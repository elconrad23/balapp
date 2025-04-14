
import 'package:flutter/material.dart';

import '../logic/controllers.dart';

class FeedbackWidget extends StatelessWidget {
  const FeedbackWidget({
    super.key,
    required this.quickCart,
  });

  final Controller quickCart;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: quickCart.count.toString(),
      keyboardType: TextInputType.number,
      textAlign: TextAlign.center, // Center the text horizontally
      textAlignVertical: TextAlignVertical.center, // Center the text vertically
      decoration: const InputDecoration(
        labelText: '',
        labelStyle: TextStyle(
          fontSize: 19,
          color: Colors.blueAccent,
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a number';
        }
        final intValue = int.tryParse(value);
        if (intValue == null || intValue < 1 || intValue > 100) {
          return 'Please enter a valid number between 0 and 100';
        }
        return null;
      },
      onChanged: (value) {
        final intValue = int.tryParse(value);
        if (intValue != null) {
          quickCart.count.value = intValue;
        }
      },
    );
  }
}
