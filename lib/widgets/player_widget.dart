import 'package:bal_app/models/player_model.dart';
import 'package:flutter/material.dart';

class PlayerCard extends StatelessWidget {
  final Player player;

  const PlayerCard({super.key, required this.player});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4, // Adds a shadow effect
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage(player.image), // Player image
          ),
          const SizedBox(height: 10),
          Text(
            player.name,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(player.position, style: const TextStyle(color: Colors.grey)),
          Text('Age: ${player.age}', style: const TextStyle(fontSize: 14)),
          Text('Height: ${player.height} cm', style: const TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
}