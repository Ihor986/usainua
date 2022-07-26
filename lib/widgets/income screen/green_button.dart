import 'package:flutter/material.dart';
import 'package:usainua/utils/app_colors.dart';

class GreenButton extends StatelessWidget {
  const GreenButton({
    Key? key,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  final void Function() onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(16.0),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.greenButtonShadowColor,
            // spreadRadius: 5,
            blurRadius: 5,
            offset: Offset(0, 10),
          ),
        ],
        color: AppColors.greenButtonColor,
      ),
      width: screen.width - 42,
      height: 56,
      // height: screen.height * 0.069,
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          text.toUpperCase(),
          style: const TextStyle(
            color: AppColors.greenButtonTextColor,
          ),
        ),
      ),
    );
  }
}
