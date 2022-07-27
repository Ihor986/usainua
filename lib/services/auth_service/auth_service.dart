// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class AuthService {
  // AuthService._();
  // static const
  final TextEditingController phoneInputController = TextEditingController();
  final TextEditingController nameInputController = TextEditingController();
  final TextEditingController emailInputController = TextEditingController();
  final TextEditingController codeController = TextEditingController();
  final TextEditingController codeController2 = TextEditingController();
  final TextEditingController codeController3 = TextEditingController();
  final TextEditingController codeController4 = TextEditingController();
  final TextEditingController codeController5 = TextEditingController();
  final TextEditingController codeController6 = TextEditingController();

  String get getCode {
    String code;
    code = codeController.text +
        codeController2.text +
        codeController3.text +
        codeController4.text +
        codeController5.text +
        codeController6.text;

    return code;
  }

  // void setCode(String value) {
  //   _codeController == null
  //       ? _codeController = value
  //       : _codeController = _codeController! + value;
  // }

  void dispouseCode() {
    codeController.text = '';
    codeController2.text = '';
    codeController3.text = '';
    codeController4.text = '';
    codeController5.text = '';
    codeController6.text = '';
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
