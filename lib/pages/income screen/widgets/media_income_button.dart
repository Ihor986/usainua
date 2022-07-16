import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:usainua/utils/app_colors.dart';
import 'package:usainua/utils/app_images.dart';

class MedisIncome extends StatelessWidget {
  const MedisIncome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(5),
          decoration: const BoxDecoration(
            color: AppColors.mediaButtonBackgroundColor,
            borderRadius: BorderRadius.all(
              Radius.circular(16.0),
            ),
          ),
          width: screen.width - 42,
          height: screen.height * 0.069,
          child: TextButton(
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Войти как пользователь',
                  style: TextStyle(
                    color: AppColors.textColor,
                  ),
                ),
                SvgPicture.asset(
                  AppImages.facebook,
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: screen.height * 0.012,
        ),
        Container(
          padding: const EdgeInsets.all(5),
          decoration: const BoxDecoration(
            color: AppColors.mediaButtonBackgroundColor,
            borderRadius: BorderRadius.all(
              Radius.circular(16.0),
            ),
          ),
          width: screen.width - 42,
          height: screen.height * 0.069,
          child: TextButton(
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Войти как пользователь',
                  style: TextStyle(
                    color: AppColors.textColor,
                  ),
                ),
                SvgPicture.asset(
                  AppImages.google,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
