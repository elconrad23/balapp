import 'package:bal_app/screens/home.dart';
import 'package:bal_app/utlities/app_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pie_timer/pie_timer.dart';

import '../logic/controllers.dart';

class CashPaymentScreen extends StatefulWidget {
  const CashPaymentScreen({super.key});

  @override
  State<CashPaymentScreen> createState() => _CashPaymentScreenState();
}

final Controller cart = Get.find();

class _CashPaymentScreenState extends State<CashPaymentScreen>
    with SingleTickerProviderStateMixin {
  late PieAnimationController _pieAnimationController;

  @override
  void initState() {
    super.initState();
    _pieAnimationController = PieAnimationController(vsync: this);
  }

  @override
  void dispose() {
    _pieAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            const SizedBox(
              height: 27,
            ),
            const Card(
                elevation: 8,
                child: Text(
                  " We shall it pick up shortly, thank you for watching! ",
                )),

            const SizedBox(
              height: 27,
            ),
            const Card(
              elevation: 8,
              child: Text(" Time left. "),
            ),

            const SizedBox(
              height: 27,
            ),
            //pie timer for order timer
            PieTimer(
              duration: const Duration(hours: 3),
              radius: 150,
              fillColor: Colors.red,
              pieColor: Colors.black,
              borderColor: Colors.yellow,
              borderWidth: 15,
              shadowColor: Colors.black,
              shadowElevation: 10.0,
              textStyle: const TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
              isReverse: false,
              onCompleted: () => {},
              onDismissed: () => {},
              enableTouchControls: true,
            ),

            const SizedBox(
              height: 27,
            ),
            AppButton(
                child: const Text(" Back to Home "),
                onTap: () => Get.offAll( Home())),

            const SizedBox(
              height: 27,
            ),
            Image.asset("images/car.jpg"),

            const SizedBox(
              height: 27,
            ),
            const Text("  ")
          ]),
    );
  }
}
