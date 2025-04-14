import 'package:bal_app/data/item_data.dart';
import 'package:bal_app/screens/send_tree.dart';
import 'package:bal_app/utlities/app_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../logic/controllers.dart';
import '../models/sqflite.dart';

class TicketShop extends StatefulWidget {
  const TicketShop({super.key});

  @override
  State<TicketShop> createState() => _TicketShopState();
}

class _TicketShopState extends State<TicketShop> {
    DBHelper dbHelper = DBHelper();
  final List<int> _itemCounters = List.generate(
      products.length, (index) => 0); // List to keep track of quantities
  Controller cart = Get.put(Controller());
    void _incrementCounter(int index) {
    setState(() {
      _itemCounters[index]++;
    });
  }
  @override
  Widget build(BuildContext context) {
    
    //integrate with wave
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 20,),
            const SizedBox(height: 20),
            if (cart.count > 0)
            Card(
              elevation: 15,
              child: AppButton(
                child: Obx(() => Text(
                      "Send order for ${cart.count} item(s)",
                      style: const TextStyle(color: Colors.white),
                    )),
                onTap: () {
                  const SendTree();
                },
              ),
            ),
            ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
            shrinkWrap: true,
            itemCount: products.length,
            itemBuilder: (context, index) {
              return Card(
                color: Colors.blueGrey.shade900,
                elevation: 5.0,
                child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Image(
                            height: 80,
                            width: 80,
                            image: AssetImage(products[index].image.toString()),
                          ),
                          const SizedBox(
                            width: 70,
                          ),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 3.0,
                                ),
                                RichText(
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  text: TextSpan(
                                      text:
                                          ' ${products[index].name.toString()}\n ',
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold)),
                                ),
                                const SizedBox(
                                  height: 3.0,
                                ),
                                RichText(
                                  maxLines: 1,
                                  text: TextSpan(
                                      text:
                                          ' UGX: ${products[index].unitPrice.toString()} ',
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold)),
                                ),
                                FloatingActionButton(
                                  onPressed: () => _incrementCounter(
                                      cart.count as int), // Update specific product counter
                                  tooltip: 'Increment',
                                  heroTag: 'increment_$cart.count', // Unique hero tag
                                  mini: true, // Optional: if you want smaller FABs
                                  child: const Icon(Icons.add),
                                ),
                              ]),
                        ])),
                  );
              })
        ]),
    );
  }
}
