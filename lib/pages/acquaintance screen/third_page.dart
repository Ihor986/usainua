import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:usainua/utils/app_colors.dart';
import 'package:usainua/utils/app_icons.dart';
import 'package:usainua/utils/app_images.dart';

class ThirdPage extends StatelessWidget {
  const ThirdPage({
    Key? key,
    required this.screen,
  }) : super(key: key);
  final Size screen;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Stack(
        children: [
          _Picture(screen: screen),
          _TextColumn(screen: screen),
        ],
      ),
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
    return Align(
      alignment: const Alignment(0, -0.54),
      child: SizedBox(
        height: screen.height * 0.4,
        width: screen.width * 0.87,
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Container(
              height: screen.height * 0.3,
              width: screen.width * 0.87,
              color: AppColors.grayBackground,
            ),
            Center(
              child: Image.asset(
                AppImages.deliveryMan,
                width: 0.8 * screen.width,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TextColumn extends StatelessWidget {
  const _TextColumn({
    Key? key,
    required this.screen,
  }) : super(key: key);
  final Size screen;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const Alignment(0, 0.55),
      child: SizedBox(
        height: screen.height * 0.2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _TextRow(
              screen: screen,
              text: '8 лет на рынке',
            ),
            _TextRow(
              screen: screen,
              text: 'Более 1.000.000 доставленных товаров',
            ),
            _TextRow(
              screen: screen,
              text: '200.000 пользователей',
            ),
            _TextRow(
              screen: screen,
              text: '4,6 из 5 - Рейтинг основанный на более',
              text2: '1000 отзывов',
            ),
          ],
        ),
      ),
    );
  }
}

class _TextRow extends StatelessWidget {
  const _TextRow({
    Key? key,
    required this.text,
    required this.screen,
    this.text2,
  }) : super(key: key);
  final Size screen;
  final String text;
  final String? text2;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              AppIcons.greenCheck,
              width: screen.height * 0.017,
              color: AppColors.greenButtonColor,
            ),
            const SizedBox(
              width: 12,
            ),
            Text(
              text,
              style: TextStyle(
                color: AppColors.textColor,
                fontSize: screen.height * 0.017,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        text2 != null
            ? Text(
                text2!,
                style: TextStyle(
                  color: AppColors.textColor,
                  fontSize: screen.height * 0.017,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              )
            : const SizedBox(),
      ],
    );
  }
}
