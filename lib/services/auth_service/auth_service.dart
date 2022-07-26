// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class AuthService {
  // AuthService._();
  // static const
  final TextEditingController phoneInputController = TextEditingController();
  final TextEditingController nameInputController = TextEditingController();
  final TextEditingController emailInputController = TextEditingController();
  // final TextEditingController codeController = TextEditingController();
  String? _codeController;

  String? get getCode => _codeController;

  void setCode(String value) {
    _codeController == null
        ? _codeController = value
        : _codeController = _codeController! + value;
  }

  void dispouseCode() {
    _codeController = null;
  }

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
