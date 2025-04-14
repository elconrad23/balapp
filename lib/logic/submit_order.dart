import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart'; // Ensure this is imported for dialog and snackbar
import 'package:get/get.dart';

import '../screens/home.dart';
import 'controllers.dart';

final Controller cart = Get.find();

Future<void> submitData() async {
  String amount = cart.amountController.toString();
  String currency = "UGX";
  String fullName = "User Name"; // Replace with actual user name
  String email = "user@example.com"; // Replace with actual user email
  String phoneNumber = "1234567890"; // Replace with actual user phone number

  try {
    // Create a reference to the orders collection
    CollectionReference orders =
        FirebaseFirestore.instance.collection('orders');

    // Add a new order document to the orders collection
    await orders.add({
      'amount': amount,
      'currency': currency,
      'fullName': fullName,
      'email': email,
      'phoneNumber': phoneNumber,
      'timestamp': FieldValue.serverTimestamp(), // Add a timestamp field
    });

    // Show success modal
    Get.snackbar(
      "Success",
      "Order submitted successfully!",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      colorText: Colors.white,
      duration: const Duration(seconds: 3),
    );
    Get.to(
      Home(),
    );
  } catch (e) {
    // Show error modal
    Get.snackbar(
      "Error",
      "Failed to submit order: $e",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
      colorText: Colors.white,
      duration: const Duration(seconds: 3),
    );
  }
}
