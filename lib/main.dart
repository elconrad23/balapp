import 'package:bal_app/screens/menu.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:splash_view/splash_view.dart';

import 'constants/colors.dart';
import 'firebase_options.dart';
import 'logic/controllers.dart';
import 'screens/home.dart';
import 'screens/merch.dart';
import 'screens/fixtures.dart';
import 'widgets/app_bar.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(Controller()); // Initialize globally
  runApp(const BALApp());
}

class BALApp extends StatelessWidget {
  const BALApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: SplashView(
        logo: const Image(
          image: AssetImage(
            "assets/icon/logo-color.png",
          ),
          height: 150,
        ),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color>[Colors.white, Colors.blue],
        ),
        done: Done(const SplashScreen()),
      ),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> _initializeApp() async {
    // Simulate other initialization tasks
    await Future.delayed(const Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initializeApp(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            body: Center(
              child: Image.asset('assets/icon/logo-color.png'),
            ),
          );
        } else {
          return const MainApp();
        }
      },
    );
  }
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int currentPageIndex = 0;
  Future<void> _initializeFirebase() async {
    if (Firebase.apps.isEmpty) {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
    }
  }

  final List<Widget> _widgetOptions = <Widget>[
    Home(),
    const Fixtures(),
    const Merch(),
  ];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initializeFirebase(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        } else {
          return Scaffold(
            appBar: CustomAppBar(
              title: "BAL",
              backgroundColor: HexaColor("#"), // Use actual color hex value
              leading: Image.asset('assets/icon/logo-color.png'),
              actions: [
                IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: () => Get.to(const Menu()),
                ),
              ],
            ),
            body: Center(
              child: _widgetOptions.elementAt(currentPageIndex),
            ),
            bottomNavigationBar: NavigationBar(
              onDestinationSelected: (int index) {
                setState(() {
                  currentPageIndex = index;
                });
              },
              indicatorColor: HexaColor("#"), // Use actual color hex value
              selectedIndex: currentPageIndex,
              destinations: <Widget>[
                NavigationDestination(
                  key: const Key("Home()"),
                  selectedIcon: const Icon(Icons.home, color: Colors.white),
                  icon: Icon(Icons.home_outlined, color: textColor("#")),
                  label: 'Home',
                ),
                NavigationDestination(
                  key: const Key("Fixture()"),
                  icon: Icon(Icons.watch, color: textColor("#")),
                  selectedIcon:
                      const Icon(Icons.watch_rounded, color: Colors.white),
                  label: 'Fixtures',
                ),
                NavigationDestination(
                  key: const Key("Merch()"),
                  selectedIcon: const Icon(Icons.cabin, color: Colors.white),
                  icon: Icon(Icons.shopping_cart, color: textColor("#")),
                  label: 'Merchandise',
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
