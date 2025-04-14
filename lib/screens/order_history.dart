import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/colors.dart';
import '../data/item_data.dart';
import '../models/cart_model.dart';
import '../models/sqflite.dart';
// import '../models/cart.dart';
import '../logic/controllers.dart';

class OrderHistory extends StatefulWidget {
  const OrderHistory({super.key});
  @override
  State<OrderHistory> createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
  late DBHelper dbHelper = DBHelper();

  @override
  Widget build(BuildContext context) {
    final Controller cart = Get.put(Controller());
    void saveData(int index) {
      dbHelper
          .insert(
        Cart(
          id: index,
          productId: index.toString(),
          productName: products[index].name,
          quantity: ValueNotifier(1),
          image: products[index].image,
          initialPrice: null,
          productPrice: null,
        ),
      )
          .then((value) {
        cart.addTotalPrice(products[index].unitPrice.toDouble());
        cart.addAmount();
      }).onError((error, stackTrace) {
        if (kDebugMode) {
          print(error.toString());
        }
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(' Order history '),
        backgroundColor: textColor('#'),
        actions: [
          Obx(() => Text("In Basket: ${cart.count}")),
        ],
        leading: BackButton(onPressed: () {
          Navigator.pop(context);
        }),
      ),
      body: SingleChildScrollView(
          child: Column(children: [
        ListView.builder(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
            shrinkWrap: true,
            itemCount: products.length,
            itemBuilder: (context, index) {
              return Card(
                color: Colors.blueGrey.shade200,
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
                        SizedBox(
                          width: 130,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 5.0,
                              ),
                              RichText(
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                text: TextSpan(
                                    text: 'Name: ',
                                    style: TextStyle(
                                        color: Colors.blueGrey.shade800,
                                        fontSize: 16.0),
                                    children: [
                                      TextSpan(
                                          text:
                                              '${products[index].name.toString()}\n',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold)),
                                    ]),
                              ),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          Colors.blueGrey.shade900),
                                  onPressed: () {
                                    saveData(index);
                                  },
                                  child: const Text('Add to Basket')),
                            ],
                          ),
                        ),
                      ]),
                ),
              );
            })
      ])),
    );
  }
}
