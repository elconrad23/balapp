import 'package:flutter/material.dart';

import '../data/player_data.dart';
import '../models/player_model.dart';
import '../widgets/player_widget.dart';

class PlayerprofilesScreen extends StatefulWidget {
  const PlayerprofilesScreen({super.key});

  @override
  PlayerprofilesScreenState createState() => PlayerprofilesScreenState();
}

class PlayerprofilesScreenState extends State<PlayerprofilesScreen> {

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ResponsiveGrid(),
    );
  }
}

class ResponsiveGrid extends StatefulWidget {
  const ResponsiveGrid({super.key});

  @override
  ResponsiveGridState createState() => ResponsiveGridState();
}

class ResponsiveGridState extends State<ResponsiveGrid> {
  int determineCrossAxisCount(BuildContext context) {
   final screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth < 600) {
      return 2; // Smaller screens: 2 columns
    } else if (screenWidth < 900) {
      return 3; // Medium screens: 3 columns
    } else {
      return 4; // Larger screens: 4 columns
    }
  }

  TextEditingController searchController = TextEditingController();
  List<Player> filteredPlayers = players; // Initially, show all players

  void filterPlayers(String query) {
    setState(() {
      filteredPlayers = players
          .where((player) => player.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Search TextField
        Padding(
          padding: const EdgeInsets.all(8.0),
          child:  Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.5, //Half screen width
                child: TextField(
                  controller: searchController,
                  onChanged: filterPlayers, //Call filter function when user types
                  decoration: InputDecoration(
                    labelText: "Search Players",
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ),
          ),
        ),

        // GridView inside Expanded
        Expanded(
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: determineCrossAxisCount(context),
            ),
            itemCount: filteredPlayers.length,
            itemBuilder: (BuildContext context, int index) {
              return PlayerCard(player: filteredPlayers[index]);
            },
          ),
        ),
      ],
    );
  }
}    
