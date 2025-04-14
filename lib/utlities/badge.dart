import 'package:bal_app/screens/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:get/get.dart';

class CartBadge extends StatefulWidget {
  const CartBadge({super.key});

  @override
  _CartBadgeState createState() => _CartBadgeState();
}

class _CartBadgeState extends State<CartBadge> {
  int cartItemCount = 0;

  // You can simulate updating the cart count using this function.
  void updateCart(int count) {
    setState(() {
      cartItemCount += count;
    });
  }

  @override
  Widget build(BuildContext context) {
    return badges.Badge(
      badgeContent: Text(
        cartItemCount.toString(),
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      child: IconButton(
        icon: const Icon(Icons.shopping_cart),
        onPressed: () {
          // Simulate adding an item to the cart
          // updateCart(cartItemCount + 1);
          Get.to(const CartScreen());
        },
      ),
    );
  }
}
