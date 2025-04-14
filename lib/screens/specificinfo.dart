import 'package:flutter/material.dart';

class SpecificInformation extends StatefulWidget {
  const SpecificInformation({super.key});

  @override
  State<SpecificInformation> createState() => _SpecificInformationState();
}

class _SpecificInformationState extends State<SpecificInformation> {
  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      
      child: Column(children: [
        Text("Tips to come"),
        Text("How to wash different colors"),
        Text("How to wash in orderly manner"),
      ],)
      
    );
  }
}