import 'package:flutter/material.dart';
import 'package:usainua/utils/app_colors.dart';

class HintText extends StatelessWidget {
  const HintText({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;
    return Text(
      text,
      style: TextStyle(
        color: AppColors.blueIconsColor,
        fontSize: screen.height * 0.019,
        fontWeight: FontWeight.w700,
        fontStyle: FontStyle.normal,
        letterSpacing: 0.5,
      ),
    );
  }
}
