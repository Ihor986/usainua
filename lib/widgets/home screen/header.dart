import 'package:flutter/material.dart';
import 'package:usainua/utils/app_colors.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
    required this.screen,
    required this.color,
    required this.text,
  }) : super(key: key);

  final Size screen;
  final Color color;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(screen.height * 0.01),
      height: screen.height * 0.095,
      width: screen.width * 0.88,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: AppColors.textColor,
          fontSize: screen.height * 0.017,
          fontWeight: FontWeight.w400,
          letterSpacing: 1,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
