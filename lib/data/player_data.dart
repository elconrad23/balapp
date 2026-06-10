import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/player_model.dart';

class PlayerDataFetcher {
  // Team website API endpoints - to be provided later
  static const Map<String, String> teamApiEndpoints = {
    'City Oilers': 'https://api.cityoilers.example.com/players',
    'River Hoopers': 'https://api.riverhoopers.example.com/players',
    'Al Ahly Egypt': 'https://api.alahlyegypt.example.com/players',
    'Nairobi Thunder': 'https://api.nairobi-thunder.example.com/players',
    'MBB': 'https://api.mbb.example.com/players',
    'Monastir': 'https://api.monastir.example.com/players',
    'Petro': 'https://api.petro.example.com/players',
    'Fus': 'https://api.fus.example.com/players',
    'Apr': 'https://api.apr.example.com/players',
    'HSB': 'https://api.hsb.example.com/players',
    'A.S.C.V.D': 'https://api.ascvd.example.com/players',
  };

  /// Fetches players from a specific team's API endpoint
  static Future<List<Player>> fetchTeamPlayers(String teamName) async {
    final endpoint = teamApiEndpoints[teamName];
    
    if (endpoint == null) {
      print('No API endpoint configured for team: $teamName');
      return [];
    }

    try {
      final response = await http.get(
        Uri.parse(endpoint),
        headers: {
          'Content-Type': 'application/json',
        },
      ).timeout(
        const Duration(seconds: 10),
        onTimeout: () => throw Exception('Request timeout for $teamName'),
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);
        
        // Parse JSON data and convert to Player objects
        List<Player> teamPlayers = jsonData.map((playerJson) {
          return Player(
            name: playerJson['name'] ?? 'Unknown',
            position: playerJson['position'] ?? 'N/A',
            age: playerJson['age'] ?? 0,
            height: playerJson['height'] ?? 0,
            image: playerJson['image'] ?? 'assets/images/placeholder.png',
          );
        }).toList();

        return teamPlayers;
      } else {
        print('Failed to fetch players for $teamName. Status: ${response.statusCode}');
        return [];
      }
    } catch (e) {
      print('Error fetching players for $teamName: $e');
      return [];
    }
  }

  /// Fetches all players from all configured teams
  static Future<List<Player>> fetchAllPlayers() async {
    List<Player> allPlayers = [];

    for (String teamName in teamApiEndpoints.keys) {
      final teamPlayers = await fetchTeamPlayers(teamName);
      allPlayers.addAll(teamPlayers);
    }

    return allPlayers;
  }

  /// Fetches players for multiple teams
  static Future<List<Player>> fetchPlayersForTeams(List<String> teamNames) async {
    List<Player> teamPlayers = [];

    for (String teamName in teamNames) {
      final players = await fetchTeamPlayers(teamName);
      teamPlayers.addAll(players);
    }

    return teamPlayers;
  }

  /// Caches and updates player data - call this periodically to refresh
  static Future<void> updatePlayerCache() async {
    try {
      final allPlayers = await fetchAllPlayers();
      // TODO: Implement local storage/caching mechanism
      // This could use sqflite, hive, or SharedPreferences
      print('Player cache updated. Total players: ${allPlayers.length}');
    } catch (e) {
      print('Error updating player cache: $e');
    }
  }
}

/// Default fallback player list (used when API is unavailable)
List<Player> players = [
  Player(
    name: 'Jimmy Enabu',
    position: 'Point Guard',
    age: 42,
    height: 187,
    image: 'assets/images/je.jpg',
  ),
  Player(
    name: 'Jimmy Enabu',
    position: 'Point Guard',
    age: 42,
    height: 187,
    image: 'assets/images/je.jpg',
  ),
  Player(
    name: 'Jimmy Enabu',
    position: 'Point Guard',
    age: 42,
    height: 187,
    image: 'assets/images/je.jpg',
  ),
];
