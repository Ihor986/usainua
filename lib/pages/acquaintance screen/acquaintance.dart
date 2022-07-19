import 'package:flutter/material.dart';
import 'package:usainua/utils/app_colors.dart';

class AcquaintanceScreen extends StatelessWidget {
  const AcquaintanceScreen({Key? key}) : super(key: key);
  static const routeName = '/AcquaintanceScreen';
  // static final GlobalKey<NavigatorState> _navigatorKey =
  //     GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: GestureDetector(
        onTap: () {
          if (FocusNode().hasFocus) {
            FocusScope.of(context).unfocus();
          } else {
            FocusScope.of(context).requestFocus(FocusNode());
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Stack(
            children: const [
              // TextIncome(text: 'Регистрация'),
              // _SignUpForm(),
              // _Registered(),
              // _MedisIncome(),
            ],
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}