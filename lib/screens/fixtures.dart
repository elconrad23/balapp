import 'package:bal_app/screens/playerprofiles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/notifications_slider.dart';
import 'seasonschedule.dart';
import 'ticketshop.dart';

class Fixtures extends StatefulWidget {
  const Fixtures({super.key});

  @override
  State<Fixtures> createState() => _FixturesState();
}

class _FixturesState extends State<Fixtures> {
  final List<Map<String, dynamic>> menuItems = [
    {
      "title": "Schedule",
      "subtitle": "View upcoming matches",
      "icon": Icons.calendar_today,
      "route": const SeasonSchedule(),
    },
    {
      "title": "Player Profiles",
      "subtitle": "Explore player stats",
      "icon": Icons.person,
      "route": const PlayerprofilesScreen(),
    },
    {
      "title": "Buy Tickets",
      "subtitle": "Secure your seat",
      "icon": Icons.confirmation_number,
      "route": const TicketShop(),
    },
    {
      "title": "Fantasy Bet",
      "subtitle": "Play for pay",
      "icon": Icons.casino,
      "route": const TicketShop(),
    }
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          width: MediaQuery.of(context).size.width * 0.8,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 20),

              // Grid Layout
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // 2 cards per row
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1, // Adjusted for better UI balance
                ),
                itemCount: menuItems.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: InkWell(
                      onTap: menuItems[index]["route"] != null
                          ? () => Get.to(menuItems[index]["route"])
                          : null,
                      borderRadius: BorderRadius.circular(12),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              menuItems[index]["icon"],
                              size: 40,
                              color: Colors.blueAccent,
                            ),
                            const SizedBox(height: 10),
                            Text(
                              menuItems[index]["title"],
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 5),
                            Text(
                              menuItems[index]["subtitle"],
                              style: const TextStyle(fontSize: 12, color: Colors.grey),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),

              const SizedBox(height: 15),

              // Notification Slider
              const NotificaitonSlider(),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
