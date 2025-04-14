import 'package:flutter/material.dart';

class Help extends StatelessWidget {
  const Help({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          Column(
            children: [
            Image(image: AssetImage("/images/laundry_pic1_75.png")),
            Text("Phone: 256703862204"),
            Text("Email: nbaafrica@mail.com"),
            ],),
          Column(
            children: [
              Text("Help to find my laundry"),
              Text("How to wash different colors"),
              Text("How to wash in orderly manner"),
            ],),],),
    );
  }
}