
import 'package:flutter/material.dart';

class MatchWidget extends StatelessWidget {
  const MatchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        child: ListView(
          children: <Widget>[
            ListTile(
              leading: CircleAvatar(
                  child: Image.asset("/images/logo-black.jpg"),
              ),
              title: const Text('SMB vs RIV'),
              subtitle: const Text('Morocco'),
              trailing: const Icon(Icons.menu),
            ),
            const Divider(height: 0),
             ListTile(
              leading: CircleAvatar(
                  child: Image.asset("/images/logo-black.jpg"),
              ),
              title: const Text('FUS vs AIA'),
              subtitle: const Text('Rwanda'),
              trailing: const Icon(Icons.menu),
            ),
          ],),
        ));
  }
}