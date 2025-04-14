import 'package:flutter/material.dart';

import '../widgets/calendarwidget.dart';

class SeasonSchedule extends StatefulWidget {
  const SeasonSchedule({super.key});

  @override
  State<SeasonSchedule> createState() => _SeasonScheduleState();
}

class _SeasonScheduleState extends State<SeasonSchedule> {
  final List<Map<String, dynamic>> schedule = [
    {
      "round": 1,
      "matches": [
        ["Al Ahly Egy", "Al Ahly Ly"],
        ["City Oilers", "Fus Der Bat"],
        ["A.S.C.V.D", "US Monastir"],
        ["Al Ahly Egy", "Fus Der Bat"],
        ["A.S.C.V.D", "City Oilers"],
        ["Fus Der Bat", "Al Ahly Ly"],
      ],
    },
    {
      "round": 2,
      "matches": [
        ["Al Ahly Ly", "Fus Der Bat"],
        ["Al Ahly Ly", "Al Ahly Egy"],
        ["Fus Der Bat", "City Oilers"],
        ["A.S.C.V.D", "US Monastir"],
        ["US Monastir", "Fus Der Bat"],
        ["A.S.C.V.D", "Cobras"],
      ],
    },
    // Add more rounds as needed...
  ];

  @override
  Widget build(BuildContext context) {
    //integrate from database
    return Column(
      children: [
        ListView.builder(
            itemCount: schedule.length,
            itemBuilder: (context, index) {
              final round = schedule[index];
              return Card(
                margin: const EdgeInsets.all(12),
                elevation: 4,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Round ${round['round']}",
                        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      ...round['matches'].map<Widget>((match) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(match[0], style: const TextStyle(fontSize: 16)),
                              Text("vs", style: TextStyle(fontSize: 16, color: Colors.grey[600])),
                              Text(match[1], style: const TextStyle(fontSize: 16)),
                            ],
                          ),
                        );
                      }).toList(),
                    ],
                  ),
                ),
              );
            },
        ),
        const Calendarwidget()
      ],
    );
  }
}
