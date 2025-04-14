import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/merchcategories.dart';

class Merch extends StatefulWidget {
  const Merch({super.key});
  @override
  State<Merch> createState() => _MerchState();
}

class _MerchState extends State<Merch> {

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            width: MediaQuery.of(context).size.width *
                0.8, // 80% of the screen width
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
                itemCount: menuCategories.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: InkWell(
                      onTap: menuCategories[index]["route"] != null
                          ? () => Get.to(menuCategories[index]["route"])
                          : null,
                        borderRadius: BorderRadius.circular(12),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                menuCategories[index]["icon"],
                                size: 40,
                                color: Colors.blueAccent,
                              ),
                              const SizedBox(height: 10),
                              Text(
                                menuCategories[index]["title"],
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 5),
                              Text(
                                menuCategories[index]["subtitle"],
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
                const SizedBox(height: 13,
              ),]
            ),
          ),
        ),
    ));
  }
}
