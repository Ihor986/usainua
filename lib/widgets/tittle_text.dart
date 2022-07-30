import 'package:flutter/material.dart';
import 'package:usainua/utils/app_colors.dart';

class TittleText extends StatelessWidget {
  const TittleText({
    Key? key,
    required this.screen,
    required this.text,
  }) : super(key: key);
  final String text;
  final Size screen;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: AppColors.textColor,
        fontSize: screen.height * 0.024,
        fontWeight: FontWeight.w800,
        letterSpacing: 0.5,
      ),
    );
  }
}
