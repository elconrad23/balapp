import 'package:bal_app/screens/chosenupdates.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/colors.dart';
import '../utlities/app_button.dart';
import '../widgets/app_bar.dart';

class News extends StatefulWidget {
  const News({super.key});

  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "News",
        backgroundColor: HexaColor("#"), // Use actual color hex value
        leading: Image.asset('assets/icon/logo-color.png'),
        actions: const [],
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 25,
              ),
              const Card(
                child: SizedBox(
                    child: Text(
                        "Pick your interests, access their news!")),
              ),
              const SizedBox(
                height: 25,
              ),
              Expanded(
                child: Material(
                  child: ListView(
                    children: <Widget>[
                      ListTile(
                        leading: CircleAvatar(
                            child: Image.asset("/images/nbawhlogo.png"),
                        ),
                        title: const Text('NBA'),
                        subtitle: const Text('National Basketball Association'),
                        trailing: const Icon(Icons.check_box_outline_blank),
                      ),
                      const Divider(height: 0),
                      ListTile(
                        leading: CircleAvatar(
                            child: Image.asset("/images/epl.png"),
                        ),
                        title: const Text('EPL'),
                        subtitle: const Text(
                          'Football in the Premier League for the soccer fans, find your news here and find jerseys/kits in the jerseys section in the menu.',
                        ),
                        trailing: const Icon(Icons.check_box_outline_blank),
                      ),
                      const Divider(height: 0),
                      ListTile(
                        leading: CircleAvatar(
                            child: Image.asset("/images/cricket.png"),
                        ),
                        title: const Text('Cricket'),
                        subtitle: const Text(
                          "Find niche sports that might also be of much interest when you get to learn.",
                        ),
                        trailing: const Icon(Icons.check_box_outline_blank ),
                        isThreeLine: true,
                      ),
                      const Divider(height: 0),
                    ],
                  ),
                ),
              ),
              AppButton(
                onTap: () {
                  Get.to(const Updates());
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Select"),
                    Icon(
                      Icons.select_all_rounded,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
