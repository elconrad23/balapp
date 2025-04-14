import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/colors.dart';
import '../widgets/app_bar.dart';
import '../widgets/matches.dart';
import 'menu.dart';

class GameHighlightsList extends StatefulWidget {
  const GameHighlightsList({super.key});

  @override
  State<GameHighlightsList> createState() => _GameHighlightsListState();
}

class _GameHighlightsListState extends State<GameHighlightsList> {
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
              MatchWidget()]))));
  }
}
