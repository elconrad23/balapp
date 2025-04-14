
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../logic/submit_order.dart';
import 'auth.dart';
import 'login_register_page.dart';

class SendTree extends StatefulWidget {
  const SendTree({super.key});

  @override
  State<SendTree> createState() => _SendTreeState();
}

class _SendTreeState extends State<SendTree> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Auth().authStateChanges,
      builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
        if (snapshot.hasData) {
          try {
            submitData();
          } catch (e) {
            // Show error modal
            Get.snackbar(
              "Oops!",
              "Something went wrong: $e, please try again.",
              colorText: Colors.black54,
              snackPosition: SnackPosition.BOTTOM,
              duration: const Duration(seconds: 3),
            );
          }throw(UnimplementedError);
        }else {
          return const LoginPage();
        }
      });
  }
}