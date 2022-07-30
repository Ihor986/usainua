import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:usainua/utils/app_colors.dart';
import 'package:usainua/utils/app_icons.dart';

class DeliveryTypeContainer extends StatelessWidget {
  const DeliveryTypeContainer({
    Key? key,
    required this.screen,
    required this.text1,
    required this.text2,
    required this.text3,
    required this.text4,
    required this.icon1,
    required this.icon2,
    required this.icon3,
    required this.icon4,
    this.icon5,
    required this.color,
  }) : super(key: key);
  final Size screen;
  final String text1;
  final String text2;
  final String text3;
  final String text4;
  final String icon1;
  final String icon2;
  final String icon3;
  final String icon4;
  final String? icon5;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 0.5 * screen.height,
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              icon5 == null
                  ? _LineRow(
                      color: color,
                      text: text1,
                      icon: icon1,
                      screen: screen,
                    )
                  : _FirstLineRow(
                      color: color,
                      text: text1,
                      icon: icon1,
                      icon5: icon5!,
                      screen: screen,
                    ),
              Padding(
                padding: EdgeInsets.only(
                    bottom: icon5 == null
                        ? screen.height * 0.03
                        : screen.height * 0.04),
                child: _LineRow(
                  color: color,
                  text: text4,
                  icon: icon4,
                  screen: screen,
                ),
              ),
            ],
          ),
          Center(
            child: SizedBox(
              height:
                  icon5 == null ? 0.25 * screen.height : 0.2 * screen.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _LineRow(
                    color: color,
                    text: text2,
                    icon: icon2,
                    screen: screen,
                  ),
                  _LineRow(
                    color: color,
                    text: text3,
                    icon: icon3,
                    screen: screen,
                  ),
                  const SizedBox(),
                ],
              ),
            ),
          ),
          Center(
            child: Container(
              foregroundDecoration: BoxDecoration(
                image: DecorationImage(
                  image: icon5 == null
                      ? const AssetImage(
                          AppIcons.snakePng,
                        )
                      : const AssetImage(
                          AppIcons.snake2Png,
                        ),
                  fit: BoxFit.fill,
                ),
              ),
              height:
                  icon5 == null ? 0.33 * screen.height : 0.23 * screen.height,
            ),
          ),
        ],
      ),
    );
  }
}

class _LineRow extends StatelessWidget {
  const _LineRow({
    Key? key,
    required this.screen,
    required this.text,
    required this.icon,
    required this.color,
  }) : super(key: key);
  final Size screen;
  final String text;
  final String icon;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SvgPicture.asset(
          icon,
          alignment: Alignment.topCenter,
          color: color,
        ),
        Text(
          text,
          style: TextStyle(
            color: AppColors.textColor,
            fontSize: screen.height * 0.017,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.5,
          ),
        ),
        const SizedBox(),
      ],
    );
  }
}

class _FirstLineRow extends StatelessWidget {
  const _FirstLineRow({
    Key? key,
    required this.screen,
    required this.text,
    required this.icon,
    required this.icon5,
    required this.color,
  }) : super(key: key);
  final Size screen;
  final String text;
  final String icon;
  final String icon5;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SvgPicture.asset(
              icon,
              alignment: Alignment.topCenter,
              color: color,
            ),
            Text(
              text,
              style: TextStyle(
                color: AppColors.textColor,
                fontSize: screen.height * 0.017,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.5,
              ),
            ),
            const SizedBox(),
          ],
        ),
        SizedBox(
          height: screen.height * 0.01,
        ),
        InkWell(
          onTap: () {
            // TODO: add func
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                icon5,
                alignment: Alignment.topCenter,
                color: color,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                'Адреса складов',
                style: TextStyle(
                  color: AppColors.textColor,
                  fontSize: screen.height * 0.017,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.5,
                ),
              ),
              SizedBox(
                width: screen.width * 0.2,
              ),
            ],
          ),
        )
      ],
    );
  }
}
