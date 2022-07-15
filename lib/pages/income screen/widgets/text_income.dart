import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';

class TextIncome extends StatelessWidget {
  const TextIncome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(top: screen.height * 0.14),
      child: Text(
        'Вход',
        style: TextStyle(
          color: AppColors.textColor,
          fontSize: screen.height * 0.052,
          fontWeight: FontWeight.w800,
          fontStyle: FontStyle.normal,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}
