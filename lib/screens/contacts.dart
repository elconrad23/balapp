import 'news.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utlities/app_button.dart';
import 'about_us.dart';

class Contacts extends StatefulWidget {
  const Contacts({super.key});

  @override
  State<Contacts> createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children:[
        const SizedBox(
          height: 3.3,
        ),
        Padding(
          padding: const EdgeInsets.all(9.0),
          child: AppButton(
            onTap: () => {
              Get.to( const News()),
            },
            child: const Text('Find Information') ,),
        ),
    
        const SizedBox(
          height: 3.3,
        ),
    
        const Padding(
          padding: EdgeInsets.all(9.0),
          child: Text('Contact Us: +256703862204 nbaafrica@gmail.com'),
          ),
          
          const SizedBox(height: 15,),
          Padding(
          padding: const EdgeInsets.all(9.0),
          child: AppButton(
            onTap: () => {
              Get.to( const AboutUs()),
            },
            child: const Text('About Us') ,),
        ),
      ],
    );
  }}