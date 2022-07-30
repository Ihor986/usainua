import 'package:flutter/material.dart';

class BigButton extends StatelessWidget {
  const BigButton({
    Key? key,
    required this.onPressed,
    required this.text,
    required this.color,
    required this.shadowColor,
    required this.textColor,
  }) : super(key: key);

  final void Function() onPressed;
  final String text;
  final Color color;
  final Color shadowColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(16.0),
        ),
        boxShadow: [
          BoxShadow(
            color: shadowColor,
            // spreadRadius: 5,
            blurRadius: 5,
            offset: const Offset(0, 10),
          ),
        ],
        color: color,
      ),
      width: screen.width - 42,
      height: 56,
      // height: screen.height * 0.069,
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          text.toUpperCase(),
          style: TextStyle(
            color: textColor,
          ),
        ),
      ),
    );
  }
}
