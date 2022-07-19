import 'package:flutter/material.dart';

class AuthService {
  // AuthService._();
  // static const
  final TextEditingController phoneInputController = TextEditingController();
  void changePhoneValue(String value) {
    if (value.length == 1) {
      bool isWrongValue =
          value == '0' || value == '3' || value == '8' || value == '+';
      if (isWrongValue) {
        phoneInputController.text = '+380';
      } else {
        phoneInputController.text = '+380$value';
      }
      phoneInputController.selection = TextSelection.fromPosition(
        TextPosition(offset: phoneInputController.text.length),
      );
    }
  }
}
