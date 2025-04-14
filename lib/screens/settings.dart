import 'package:bal_app/screens/login_register_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'about_us.dart';
import 'contacts.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {

  @override
  Widget build(BuildContext context) {
    return ListView(
        shrinkWrap: true,
        children:[
          Column(
            children:[
              const SizedBox(
                height: 3.3,
              ),
              Padding(
                padding: const EdgeInsets.all(9.0),
                child: TextButton(
                  onPressed: () => {
                    Get.to(const LoginPage()),
                  },
                  child: const Text('My Account') ,),
              ),

              Padding(
                padding: const EdgeInsets.all(9.0),
                child: TextButton(
                  onPressed: () => {
                    Navigator.push(context,
                    MaterialPageRoute(
                      builder: (context) => const AboutUs()),
                    ),
                  },
                  child: const Text('About Us') ,),
              ),

              Padding(
                padding: const EdgeInsets.all(9.0),
                child: TextButton(
                  onPressed: () { Navigator.push( context,
                  MaterialPageRoute( builder: (context) => const Contacts()
              ),);  },
                  child: const Text('Contact Us'),
                ),
              ),
            ],
          ),
        ],
    );
  }
}