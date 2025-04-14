import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/colors.dart';
import '../widgets/app_bar.dart';
import '../widgets/matches.dart';
import 'menu.dart';

class LiveGames extends StatelessWidget {
  const LiveGames({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          title: "Live",
          backgroundColor: HexaColor("#"),
          leading: Image.asset('assets/icon/logo-color.png'),
          actions: [
            IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () => Get.to(const Menu()),
            ),
          ],
        ),
        body: const SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 25,
              ),
                MatchWidget(),

                SizedBox(height: 40),
                Card(
                  elevation: 15,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "  Book a seat and let us help you plan your trip  ",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
        )));
  }
}
