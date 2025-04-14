import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../logic/controllers.dart';
import '../widgets/feedbackwidget.dart';

class FeedbackPage extends StatefulWidget {
  const FeedbackPage({super.key});

  @override
  State<FeedbackPage> createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  Controller quickCart = Get.find();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
        padding: const EdgeInsets.all(16.0),
          width: MediaQuery.of(context).size.width * 0.8, // 80% of the screen width
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            const SizedBox(height: 20,),
            TextFormField(
              initialValue: " I do feel .. about the service quality ",
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center, // Center the text horizontally
              textAlignVertical: TextAlignVertical.center, // Center the text vertically
              decoration: const InputDecoration(
              labelText: ' So how about sending us your feedback about our services here? ',
              labelStyle: TextStyle(
              fontSize: 19,
              color: Colors.blueAccent,
              ),
            ),
          validator: (value) {
    if (value == null || value.isEmpty) {
      return ' Please enter a suggestion ';
    }
    return null;
    }
    ),
    const SizedBox(height: 20),
    FeedbackWidget(quickCart: quickCart),
])));
  }
}
