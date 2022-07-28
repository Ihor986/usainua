import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:usainua/pages/home%20screen/first_page.dart';
import 'package:usainua/pages/main_screen.dart';
import 'package:usainua/utils/app_colors.dart';
import 'package:usainua/utils/app_icons.dart';
import 'package:usainua/utils/app_images.dart';
import 'package:usainua/widgets/green_button.dart';

class FifthPage extends StatelessWidget {
  const FifthPage({
    Key? key,
    required this.screen,
  }) : super(key: key);
  final Size screen;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _Picture(
          screen: screen,
        ),
        _TextBox(
          screen: screen,
        ),
        Align(
          alignment: const Alignment(0, 0.6),
          child: Text(
            '10 грн с каждого кг идут на высадку \nдеревьев',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.textColor,
              fontSize: screen.height * 0.017,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
              letterSpacing: 1,
            ),
          ),
        ),
        Align(
            alignment: const Alignment(0, 0.83),
            child: GreenButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, MainScreen.routeName, (route) => false);
              },
              text: 'Начать',
            ))
      ],
    );
  }
}

class _Picture extends StatelessWidget {
  const _Picture({
    Key? key,
    required this.screen,
  }) : super(key: key);
  final Size screen;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 0.07 * screen.height),
      child: SizedBox(
        height: screen.height * 0.47,
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '9000'.toUpperCase(),
                    style: TextStyle(
                      color: AppColors.textColor,
                      fontWeight: FontWeight.w800,
                      fontSize: screen.height * 0.15,
                      letterSpacing: 1,
                    ),
                  ),
                  Text(
                    'высаженных'.toUpperCase(),
                    style: TextStyle(
                      color: AppColors.textColor,
                      fontWeight: FontWeight.w800,
                      fontSize: screen.height * 0.04,
                      letterSpacing: 1,
                    ),
                  ),
                  Text(
                    'деревьев'.toUpperCase(),
                    style: TextStyle(
                      color: AppColors.textColor,
                      fontWeight: FontWeight.w800,
                      fontSize: screen.height * 0.07,
                      letterSpacing: 1,
                    ),
                    textWidthBasis: TextWidthBasis.parent,
                  ),
                  SizedBox(
                    height: screen.height * 0.07,
                  )
                ],
              ),
            ),
            Center(
              child: Image.asset(
                AppImages.tree,
                height: screen.height * 0.47,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TextBox extends StatelessWidget {
  const _TextBox({
    Key? key,
    required this.screen,
  }) : super(key: key);
  final Size screen;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const Alignment(0, 0.35),
      child: Container(
        padding: EdgeInsets.all(screen.height * 0.019),
        width: screen.width * 0.87,
        height: screen.height * 0.17,
        color: AppColors.grayBackground,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Наша плантация деревьев ежегодно:',
              style: TextStyle(
                color: AppColors.textColor,
                fontWeight: FontWeight.w400,
                fontSize: screen.height * 0.017,
                letterSpacing: 1,
              ),
            ),
            SizedBox(
              height: screen.height * 0.017,
            ),
            _RowText(
              screen: screen,
              text: 'Поглощено ',
              text2: '130 тон ',
              text3: 'углекислого газа',
              icon: AppIcons.carbonDioxide1,
            ),
            _RowText(
              screen: screen,
              text: 'Произведено ',
              text2: '36 тон ',
              text3: 'кислорода',
              icon: AppIcons.carbonDioxide2,
            ),
            const SizedBox(),
          ],
        ),
      ),
    );
  }
}

class _RowText extends StatelessWidget {
  const _RowText({
    Key? key,
    required this.screen,
    required this.icon,
    required this.text,
    required this.text2,
    required this.text3,
  }) : super(key: key);
  final Size screen;
  final String icon;
  final String text;
  final String text2;
  final String text3;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          icon,
          color: AppColors.blueIconsColor,
        ),
        SizedBox(
          width: screen.width * 0.05,
        ),
        Text.rich(
          TextSpan(
            text: text,
            children: [
              TextSpan(
                text: text2,
                style: TextStyle(
                  color: AppColors.blueIconsColor,
                  fontSize: screen.height * 0.017,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                  // letterSpacing: 0.5,
                ),
              ),
              TextSpan(
                text: text3,
                style: TextStyle(
                  color: AppColors.textColor,
                  fontSize: screen.height * 0.017,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                ),
              ),
            ],
            style: TextStyle(
              color: AppColors.textColor,
              fontSize: screen.height * 0.017,
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.normal,
            ),
          ),
        ),
      ],
    );
  }
}
