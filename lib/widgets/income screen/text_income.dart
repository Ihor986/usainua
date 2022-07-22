import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';

class TextIncome extends StatelessWidget {
  const TextIncome({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;
    return Padding(
      // alignment: const Alignment(-1, -0.74),
      padding: EdgeInsets.only(top: screen.height * 0.14 - 16),
      child: Text(
        text,
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
