// ignore_for_file: library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../logic/controllers.dart';
import '../utlities/app_button.dart';

late Controller currencyController;
class PaymentScreen {
  final formKey = GlobalKey<FormState>();
  final Controller amountController = Get.put(Controller());
  final Controller userEmail = Get.put(Controller());
  final publicKeyController = TextEditingController();
  final encryptionKeyController = TextEditingController();
  final phoneNumberController = TextEditingController();

  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: Form(
          key: formKey,
          child: ListView(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                child: Obx(() => Text("Amount: ${amountController.count}")),
              ),

              Container(
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                child: TextFormField(
                  controller: phoneNumberController,
                  textInputAction: TextInputAction.next,
                  style: const TextStyle(color: Colors.black),
                  decoration: const InputDecoration(
                    hintText: "Phone Number to call on",
                  ),
                  validator: (value) =>
                      value!.isNotEmpty ? null : "Phone Number is required",
                ),
              ),
              
              Container(
                width: double.infinity,
                height: 50,
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                child: AppButton(
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                    // _makeFlutterwavePayment(context,name,userPhone,userEmail,amountPaid);
                  }},
                  child: const Text(
                    "Make Payment",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      );
  }

  Future<void> showLoading(String message) {
    return showDialog(
      context: StatelessElement(const Text("Order received")),
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            margin: const EdgeInsets.fromLTRB(30, 20, 30, 20),
            width: double.infinity,
            height: 50,
            child: Text(message),
          ),
        );
      },
    );
  }
}