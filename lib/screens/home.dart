import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/colors.dart';
import '../widgets/headerslider.dart';
import 'highlightlist.dart';
import 'livegames.dart';
import 'standings.dart';
import 'news.dart';
import 'ticketshop.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final List<Map<String, dynamic>> entries = [
    {
      "title": "Watch live games",
      "subtitle": "Catch all the action live",
      "image": "/images/balla.jpg",
      "icon": Icons.play_circle_fill,
      "route": const LiveGames(),
    },
    {
      "title": "Get tickets",
      "subtitle": "Don't miss the action",
      "image": "/images/OurDayParty.jpg",
      "icon": Icons.confirmation_number,
      "route": const TicketShop(),
    },
    {
      "title": "Sports news",
      "subtitle": "Latest sports news",
      "image": "/images/nbssop.png",
      "icon": Icons.article,
      "route": const News(),
    },
    {
      "title": "Highlights",
      "subtitle": "Game highlights",
      "image": "/images/highlights.png",
      "icon": Icons.video_library,
      "route": const GameHighlightsList(),
    },
    {
      "title": "Standings",
      "subtitle": "Check team rankings",
      "image": "/images/hqdefault.jpg",
      "icon": Icons.leaderboard,
      "route": const Standings(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: Theme.of(context).textTheme.bodyMedium!,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 3,),
                  // Header
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    width: MediaQuery.of(context).size.width * 0.95,
                    decoration: BoxDecoration(
                      color: HexaColor('#'),
                      borderRadius: BorderRadius.circular(13),
                    ),
                    height: 105.0,
                    alignment: Alignment.center,
                    child: const HeaderSlider(),
                  ),

                  // ListView for menu items
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.all(8),
                    itemCount: entries.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ListTile(
                          contentPadding: const EdgeInsets.all(10),
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              entries[index]["image"],
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            ),
                          ),
                          title: Text(
                            entries[index]["title"],
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(entries[index]["subtitle"]),
                          trailing: Icon(
                            entries[index]["icon"],
                            color: Colors.blueAccent,
                            size: 30,
                          ),
                          onTap: () {
                            Get.to(entries[index]["route"]);
                          },
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        const SizedBox(height: 10),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
