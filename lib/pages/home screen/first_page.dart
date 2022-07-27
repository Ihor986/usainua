import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:usainua/utils/app_colors.dart';
import 'package:usainua/utils/app_icons.dart';
import 'package:usainua/utils/app_images.dart';

class FirstPageHomeScreen extends StatelessWidget {
  const FirstPageHomeScreen({Key? key}) : super(key: key);
  static const routeName = '/FirstPageHomeScreen';

  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppColors.white,
          elevation: 0,
          leading: IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              AppIcons.notification,
              color: AppColors.textColor,
            ),
          ),
          title: SvgPicture.asset(
            AppImages.logo,
            width: screen.width * 0.4,
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                AppIcons.massage,
                color: AppColors.textColor,
              ),
            ),
          ]),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Stack(
          children: [
            Container(),
            _BalanceRow(
              screen: screen,
              sum: '358.93 \$',
              sumUah: ' \\ 11157 грн',
            ),
            Column(
              children: [
                _BuyOrDelivery(
                  color: AppColors.mediaButtonBackgroundColor,
                  text: 'Покупка и доставка',
                  icon: AppImages.facebook,
                  screen: screen,
                ),
                const SizedBox(
                  height: 11,
                ),
                _BuyOrDelivery(
                  color: AppColors.grayBackground,
                  text: 'Только доставка',
                  icon: AppImages.facebook,
                  screen: screen,
                ),
              ],
            ),
          ],
        ),
      ),
      backgroundColor: AppColors.white,
    );
  }
}

class _BalanceRow extends StatelessWidget {
  const _BalanceRow({
    Key? key,
    required this.screen,
    required this.sum,
    required this.sumUah,
  }) : super(key: key);
  final Size screen;
  final String sum;
  final String sumUah;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: SizedBox(
        height: screen.height * 0.025,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Ваш баланс: ',
              style: TextStyle(
                color: AppColors.textColor,
                fontSize: screen.height * 0.019,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.5,
              ),
            ),
            Text(
              sum,
              style: TextStyle(
                color: AppColors.blueIconsColor,
                fontSize: screen.height * 0.019,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.5,
              ),
            ),
            Text(
              sumUah,
              style: TextStyle(
                color: AppColors.textColor,
                fontSize: screen.height * 0.017,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BuyOrDelivery extends StatelessWidget {
  const _BuyOrDelivery({
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
    return Container(
      height: screen.height * 0.095,
      width: screen.width * 0.88,
      decoration: BoxDecoration(
        color: color,
      ),
      child: Text(text),
    );
  }
}
