import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:usainua/utils/app_colors.dart';
import 'package:usainua/utils/app_icons.dart';
import 'package:usainua/utils/app_images.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({
    Key? key,
    required this.screen,
  }) : super(key: key);
  final Size screen;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.center,
          colors: <Color>[
            AppColors.white,
            AppColors.grayBackground,
          ],
          tileMode: TileMode.mirror,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Stack(
          children: [
            _WhiteBlock(screen: screen),
            _Action(screen: screen),
            _DeliveryPeriod(screen: screen),
          ],
        ),
      ),
    );
  }
}

class _Action extends StatelessWidget {
  const _Action({
    Key? key,
    required this.screen,
  }) : super(key: key);
  final Size screen;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const Alignment(0, -0.62),
      child: Image.asset(
        AppImages.nike,
        width: 0.8 * screen.width,
      ),
    );
  }
}

class _WhiteBlock extends StatelessWidget {
  const _WhiteBlock({
    Key? key,
    required this.screen,
  }) : super(key: key);
  final Size screen;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(left: 7, right: 7, top: 0.21 * screen.height - 16),
      child: Container(
        height: 0.46 * screen.height,
        width: screen.width,
        color: AppColors.white,
        child: _PageData(screen: screen),
      ),
    );
  }
}

class _PageData extends StatelessWidget {
  const _PageData({
    Key? key,
    required this.screen,
  }) : super(key: key);
  final Size screen;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 14,
        right: 14,
        bottom: 14,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(
                AppIcons.arrowLeft,
                height: screen.height * 0.03,
                color: AppColors.textColor,
              ),
              Text(
                'Nike Pegasus Trail 2',
                style: TextStyle(
                  color: AppColors.textColor,
                  fontSize: screen.height * 0.024,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.5,
                ),
              ),
              SvgPicture.asset(
                AppIcons.arrowRight,
                height: screen.height * 0.03,
                color: AppColors.textColor,
              ),
            ],
          ),
          SizedBox(
            height: screen.height * 0.046,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screen.width * 0.053),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Цена в Украине',
                  style: TextStyle(
                    color: AppColors.textColor,
                    fontSize: screen.height * 0.017,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 1,
                  ),
                ),
                Text(
                  '202\$',
                  style: TextStyle(
                    color: AppColors.textColor,
                    fontSize: screen.height * 0.017,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 1,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: screen.height * 0.023,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screen.width * 0.053),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Цена в США',
                  style: TextStyle(
                    color: AppColors.textColor,
                    fontSize: screen.height * 0.017,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 1,
                  ),
                ),
                Text(
                  '130\$',
                  style: TextStyle(
                    color: AppColors.textColor,
                    fontSize: screen.height * 0.017,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 1,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: screen.height * 0.02,
          ),
          Container(
            width: screen.width * 0.8,
            height: screen.height * 0.09,
            color: AppColors.grayBackground,
            child: Center(
              child: Text.rich(
                TextSpan(
                  text: 'Экономия ',
                  children: [
                    TextSpan(
                      text: '72\$',
                      style: TextStyle(
                        color: AppColors.greenButtonColor,
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
            ),
          )
        ],
      ),
    );
  }
}

class _DeliveryPeriod extends StatelessWidget {
  const _DeliveryPeriod({
    Key? key,
    required this.screen,
  }) : super(key: key);
  final Size screen;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const Alignment(0, 0.6),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 7,
        ),
        child: Container(
          height: 0.09 * screen.height,
          width: screen.width,
          color: AppColors.mediaButtonBackgroundColor,
          child: Center(
            child: Text.rich(
              TextSpan(
                text: 'Срок доставки примерно ',
                children: [
                  TextSpan(
                    text: '10 дней',
                    style: TextStyle(
                      color: AppColors.textColor,
                      fontSize: screen.height * 0.017,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.normal,
                      letterSpacing: 0.75,
                    ),
                  ),
                ],
                style: TextStyle(
                  color: AppColors.textColor,
                  fontSize: screen.height * 0.017,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  letterSpacing: 0.75,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
