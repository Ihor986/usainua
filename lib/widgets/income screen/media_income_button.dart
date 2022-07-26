import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:usainua/bloc/auth_bloc/auth_bloc.dart';
import 'package:usainua/utils/app_colors.dart';
import 'package:usainua/utils/app_images.dart';

class MedisIncome extends StatelessWidget {
  const MedisIncome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;
    return SizedBox(
      height: 122,
      //  height: screen.height * 0.15,
      // child: SingleChildScrollView(
      child: Column(
        children: [
          _Button(
            icon: AppImages.facebook,
            onPressed: () {
              context.read<AuthBloc>().add(
                    SignInWithFbEvent(
                      navigator: Navigator.of(context, rootNavigator: true),
                    ),
                  );
            },
            screen: screen,
          ),
          const SizedBox(
            height: 10,
          ),
          _Button(
            icon: AppImages.google,
            onPressed: () {
              context.read<AuthBloc>().add(
                    SignInWithGoogleEvent(
                      navigator: Navigator.of(context, rootNavigator: true),
                    ),
                  );
            },
            screen: screen,
          ),
        ],
      ),
      //   ),
    );
  }
}

class _Button extends StatelessWidget {
  const _Button(
      {Key? key,
      required this.icon,
      required this.onPressed,
      required this.screen})
      : super(key: key);

  final Size screen;
  final void Function() onPressed;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: const BoxDecoration(
        color: AppColors.mediaButtonBackgroundColor,
        borderRadius: BorderRadius.all(
          Radius.circular(16.0),
        ),
      ),
      width: screen.width - 42,
      height: 56,
      child: TextButton(
        onPressed: onPressed,
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
              icon,
            ),
          ],
        ),
      ),
    );
  }
}
