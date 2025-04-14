import 'package:flutter/material.dart';
import 'package:bal_app/widgets/app_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'auth.dart';
import 'home.dart';
import 'fixtures.dart';

class Profile extends StatelessWidget {
  Profile({super.key});

  final User? user = Auth().currentUser;

  Future<String?> getUserName() async {
    if (user != null) {
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('Users')
          .doc(user!.uid)
          .get();
      return userDoc.get('userName');
    }
    return null;
  }

  Future<void> signOut() async {
    await Auth().signOut();
  }

  Widget userUid() {
    return Text(user?.email ?? 'User email');
  }

  Widget userName() {
    return FutureBuilder<String?>(
      future: getUserName(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }
        return Text(snapshot.data ?? 'User name');
      },
    );
  }

  Widget _signOutButton() {
    return ElevatedButton(
      onPressed: signOut,
      child: const Text('SignOut'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Profile',
        leading: const Image(image: AssetImage('/icon/logo.png')),
        backgroundColor: Colors.black54,
        actions: const [],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(12),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              userUid(),
              userName(),
              ElevatedButton(
                onPressed: () => {
                  Get.to(
                    Home(),
                  ),
                },
                child: const Text("Go Home"),
              ),
              ElevatedButton(
                onPressed: () => {
                  Get.to(
                    const Fixtures(),
                  ),
                },
                child: const Text("Fixtures"),
              ),
              _signOutButton(),
            ]),
      ),
    );
  }
}
