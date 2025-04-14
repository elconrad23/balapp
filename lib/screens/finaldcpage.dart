import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pie_timer/pie_timer.dart';

import '../utlities/app_button.dart';
import 'home.dart';

class FinalDCPage extends StatefulWidget {
  const FinalDCPage({super.key});

  @override
  State<FinalDCPage> createState() => _FinalDCPageState();
}

class _FinalDCPageState extends State<FinalDCPage> with SingleTickerProviderStateMixin {
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
              const SizedBox(height: 27,),
              const Card(
                elevation: 8,
                child: Text(" We shall it drop it off shortly, thank you for choosing us! ", )),

                const SizedBox(height: 27,),
                const Card(
                  elevation: 8,
                  child: Text(" Time left. "),),
                
                const SizedBox(height: 27,),
                //pie timer for order timer
                PieTimer(
                  duration: const Duration(hours: 3),
                  radius: 120,
                  fillColor: const Color.fromARGB(255, 54, 149, 244),
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

                const SizedBox(height: 27,),
                Image.asset("images/car.jpg"),

                const SizedBox(height: 27,),
                AppButton(
                  child: const Text(" Back to Home ") ,
                  onTap: ()=> Get.offAll( Home())),

                const SizedBox(height: 27,),
    ]),);
  }
}