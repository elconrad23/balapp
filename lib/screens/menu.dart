import 'package:bal_app/screens/standings.dart';
import 'package:bal_app/screens/rating.dart';
import 'package:bal_app/utlities/app_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/colors.dart';
import 'merch.dart';
import 'profile.dart';
import 'fixtures.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'),
        backgroundColor: Colors.lightGreenAccent,
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          TextButton(
              onPressed: () {
                Get.to(Profile());
              },
              child: const Icon(Icons.account_box)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            const SizedBox(height: 3.6),
            AppButton(
              child: const Text("Rosters"),
              onTap: () {
                Get.to(const RatingScreen());
              },
            ),
            const SizedBox(height: 3.6),
            AppButton(
              title: "Tickets on sale:",
              onTap: () => Get.to(const Fixtures()),
            ),
            const SizedBox(height: 3.6),
            Card(
              elevation: 8,
              child: AppButton(
                  onTap: () {
                    Get.to(
                      const Merch(),
                    );
                  },
                  child: Text(
                    " Jerseys on sale ",
                    style: TextStyle(
                      color: textColor("#"),
                      fontSize: 18,
                    ),
                  )),
            ),
            const SizedBox(height: 3.6),
            Card(
              elevation: 8,
              child: AppButton(
                  onTap: () {
                    Get.to(
                      const Standings(),
                    );
                  },
                  child: Text(
                    " Other kits ",
                    style: TextStyle(
                      color: textColor("#"),
                      fontSize: 18,
                    ),
                  )),
            ),
            const Icon(
              Icons.add_box,
            ),
          ],
        ),
      ),
    );
  }
}
