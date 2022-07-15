import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:usainua/pages/income%20screen/sign_in_screen.dart';
import 'package:usainua/pages/income%20screen/widgets/green_button.dart';
import 'package:usainua/utils/app_colors.dart';
import 'package:usainua/utils/app_images.dart';

class PasswordHasBeenSentScreen extends StatelessWidget {
  const PasswordHasBeenSentScreen({Key? key}) : super(key: key);
  static const routeName = '/PasswordHasBeenSentScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Stack(
          children: const [
            _Image(),
            _ImageText(),
            _Next(),
          ],
        ),
      ),
    );
  }
}

class _Image extends StatelessWidget {
  const _Image({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(top: screen.height * 0.11),
      child: SvgPicture.asset(
        AppImages.innotimerafiki,
        height: screen.height * 0.4,
      ),
    );
  }
}

class _ImageText extends StatelessWidget {
  const _ImageText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(
          top: screen.height * 0.51, left: screen.width * 0.019),
      child: Column(
        children: [
          Text.rich(
            TextSpan(
              text: 'Добро пожаловать \n в мир шопинга \n вместе с USA',
              children: [
                TextSpan(
                  text: 'in',
                  style: TextStyle(
                    color: AppColors.greenButtonColor,
                    fontSize: screen.height * 0.037,
                    fontWeight: FontWeight.w800,
                    fontStyle: FontStyle.normal,
                    letterSpacing: 0.5,
                  ),
                ),
                TextSpan(
                  text: 'UA',
                  style: TextStyle(
                    color: AppColors.textColor,
                    fontSize: screen.height * 0.037,
                    fontWeight: FontWeight.w800,
                    fontStyle: FontStyle.normal,
                    letterSpacing: 0.5,
                  ),
                ),
              ],
              style: TextStyle(
                color: AppColors.textColor,
                fontSize: screen.height * 0.037,
                fontWeight: FontWeight.w800,
                fontStyle: FontStyle.normal,
                letterSpacing: 0.5,
              ),
            ),
          ),
          SizedBox(
            height: screen.height * 0.025,
          ),
          Text(
            'Логин и пароль был отправлен на Ваш\n e-mail. Если пароль не получен, проверьте\n папку “СПАМ”',
            style: TextStyle(
              color: AppColors.textColor,
              fontSize: screen.height * 0.017,
            ),
            softWrap: true,
          ),
        ],
      ),
    );
  }
}

class _Next extends StatelessWidget {
  const _Next({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(top: screen.height * 0.84, left: 5, right: 5),
      child: GreenButton(
        text: 'ПРОДОЛЖИТЬ',
        onPressed: () {
          Navigator.pushNamedAndRemoveUntil(
              context, SignInScreen.routeName, (route) => false);
        },
      ),
    );
  }
}
