import 'package:bal_app/constants/colors.dart';
import 'package:bal_app/screens/home.dart';
import 'package:bal_app/screens/notifications.dart';
import 'package:bal_app/utlities/app_button.dart';
import 'package:bal_app/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'menu.dart';

class RatingScreen extends StatefulWidget {
  const RatingScreen({super.key});

  @override
  State<RatingScreen> createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {
  RangeValues values = const RangeValues(1, 5);

  @override
  Widget build(BuildContext context) {
    RangeLabels labels = RangeLabels(
      values.start.toString(),
      values.end.toString(),
    );
    return Scaffold(
      appBar: CustomAppBar(
        title: " How do you feel about the app? ",
        backgroundColor: textColor("#"),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(
                const Notifications(),
              );
            },
            icon: const Icon(Icons.notifications),
          ),
          IconButton(
            onPressed: () {
              Get.to(
                const Menu(),
              );
            },
            icon: const Icon(Icons.menu),
          ),
        ],
        leading: BackButton(onPressed: () {
          Navigator.pop(context);
        }),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RangeSlider(
                  values: values,
                  min: 1,
                  max: 5,
                  divisions: 4,
                  labels: labels,
                  onChanged: (newValues) {
                    setState(() {
                      values = newValues;
                    });
                    // int quantity = max;
                  }),
            ),
            const SizedBox(
              height: 22,
            ),
            TextFormField(
              initialValue: " Send more feedback, optional. ",
              decoration: const InputDecoration(
                labelText: "Test us",
                labelStyle: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            const SizedBox(
              height: 22,
            ),
            AppButton(
              child: const Text(" Rate "),
              onTap: () {
                Get.to(
                  Home(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

void setState(Null Function() param0) {}
