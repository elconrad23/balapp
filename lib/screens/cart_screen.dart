import 'package:bal_app/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../logic/controllers.dart';
import '../utlities/app_button.dart';
import '../widgets/app_bar.dart';
import 'final_cashscreen.dart';
import 'payment_screen.dart';

final Controller c = Get.find();

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: ' Order Confirmation ',
        actions: [
          IconButton(
            icon: const Icon(Icons.home_outlined),
            onPressed: () {
              Get.to( Home());
            },
          ),
        ],
        leading: const Icon(Icons.account_balance),
        backgroundColor: Colors.red,
      ),
      // Replace the 8 lines Navigator.push by a simple Get.to(). You don't need context
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        AppButton(
            child: Text(" Pay cash for ${c.count.value} clothes "),
            onTap: () => Get.to(const CashPaymentScreen())),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppButton(
                child: const Text(" MTN Mobile Payment "),
                onTap: () => Get.to(PaymentScreen())),
            const SizedBox(width: 20),
            AppButton(
                child: const Text(" Airtel Mobile Payment "),
                onTap: () => Get.to(PaymentScreen())),
          ],
        )
      ]),
    );
  }
}

class ReusableWidget extends StatelessWidget {
  final String title, value;
  const ReusableWidget({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Text(
            value.toString(),
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ],
      ),
    );
  }
}
