// ignore_for_file: non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/colors.dart';
import '../logic/controllers.dart';
import '../screens/menu.dart';
import '../screens/settings.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  final String title ;
  final Controller cart = Get.find();

  CustomAppBar({super.key, required this.title, required Color backgroundColor, required List actions, required leading  });
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text("The premier men's basketball league in Africa",
      style: TextStyle(color: Colors.white),),
      backgroundColor: HexaColor("#"),
      leading: Padding(
        padding: const EdgeInsets.all(8.0), 
        child: Image.asset(
          'assets/icon/logo-color.png',
          height: 40, // Increase size
          width: 40,
          fit: BoxFit.contain,
        ),),
      actions: [
        IconButton(
          onPressed: () {
            Get.to(const Settings(),);
          },
          icon: const Icon(Icons.settings,
          color: Colors.white),
          ),

        // position: const BadgePosition(start: 30, bottom: 30),
        
        IconButton(onPressed: () => {
          Get.to( const Menu()),},
          icon: const Icon(Icons.menu, color: Colors.white,)),
      ]
    );
  }

@override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
