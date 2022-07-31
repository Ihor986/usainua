import 'package:flutter/material.dart';
import 'package:usainua/utils/app_colors.dart';

class CheckButtonRow extends StatelessWidget {
  const CheckButtonRow({
    Key? key,
    required this.screen,
    required this.onClick,
    required this.text,
    required this.color,
    required this.isCheced,
  }) : super(key: key);
  final Size screen;
  final void Function() onClick;
  final String text;
  final Color color;
  final bool isCheced;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28),
        child: Row(
          children: [
            Stack(
              children: [
                Container(
                  padding: EdgeInsets.all(screen.height * 0.01),
                  width: screen.height * 0.04,
                  height: screen.height * 0.04,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(
                          50.0), //                 <--- border radius here
                    ),
                    color: isCheced ? color : AppColors.grayBackground,
                  ),
                  child: Container(
                    width: screen.height * 0.02,
                    height: screen.height * 0.02,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                            50.0), //                 <--- border radius here
                      ),
                      color: AppColors.grayBackground,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              text,
              style: TextStyle(
                color:
                    isCheced ? AppColors.textColor : AppColors.grayBackground,
                fontSize: screen.height * 0.024,
                fontWeight: FontWeight.w800,
                letterSpacing: 0.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
