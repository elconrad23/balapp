import 'package:bal_app/screens/specificinfo.dart';
import 'package:bal_app/utlities/app_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/colors.dart';
import '../widgets/app_bar.dart';
import 'finaldcpage.dart';
import 'menu.dart';

class Standings extends StatefulWidget {
  const Standings({super.key});

  @override
  State<Standings> createState() => _StandingsState();
}

class _StandingsState extends State<Standings> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 13,
                ),
                const Card(
                    elevation: 8,
                    child: Text("Team standings will show up here!")),
                const SizedBox(
                  height: 13,
                ),
                
                AppButton(
                  child: const Text("Player Stats"),
                  onTap: () => Get.to(const FinalDCPage()),
                ),
                const SizedBox(
                  height: 13,
                ),
                AppButton(
                  child: const Text("Rosters"),
                  onTap: () => Get.to(const SpecificInformation()),
                ),
                const SizedBox(
                  height: 13,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
