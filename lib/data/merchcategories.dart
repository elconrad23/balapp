import 'package:flutter/material.dart';

import '../screens/fantasyscreen.dart';
import '../screens/playerprofiles.dart';
import '../screens/seasonschedule.dart';
import '../screens/ticketshop.dart';

final List<Map<String, dynamic>> menuCategories = [
    {
      "title": "Jerseys and kits",
      "subtitle": "All sports inclusive",
      "icon": Icons.sports_bar,
      "route": const SeasonSchedule(),
    },
    {
      "title": "Balls",
      "subtitle": "All sports inclusive",
      "icon": Icons.sports_basketball,
      "route": const PlayerprofilesScreen(),
    },
    {
      "title": "Video Games",
      "subtitle": "All sports inclusive",
      "icon": Icons.videogame_asset_sharp,
      "route": const SeasonSchedule(),
    },
    {
      "title": "Buy Tickets",
      "subtitle": "Secure your seat",
      "icon": Icons.confirmation_number,
      "route": const TicketShop(),
    },
    {
      "title": "Fitness Equipment",
      "subtitle": "Gym and cardio",
      "icon": Icons.sports_gymnastics_sharp,
      "route": const FantasyPage(),
    },
    {
      "title": "Signed kits",
      "subtitle": "Customize your purchase",
      "icon": Icons.sports_bar,
      "route": const SeasonSchedule(),
    }
  ];