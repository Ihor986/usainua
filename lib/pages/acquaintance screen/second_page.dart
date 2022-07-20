import 'package:flutter/material.dart';
import 'package:usainua/utils/app_colors.dart';
import 'package:usainua/utils/app_images.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Stack(
        children: [
          // _GrayBlock(screen: screen),
          _GirlBackgroun(screen: screen),
          _Girl(screen: screen),
        ],
      ),
    );
  }
}

class _Girl extends StatelessWidget {
  const _Girl({
    Key? key,
    required this.screen,
  }) : super(key: key);
  final Size screen;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 0.12 * screen.height),
      child: Image.asset(
        AppImages.girl,
        width: 0.88 * screen.width,
      ),
    );
  }
}

class _GirlBackgroun extends StatelessWidget {
  const _GirlBackgroun({
    Key? key,
    required this.screen,
  }) : super(key: key);
  final Size screen;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -0.03 * screen.height,
      left: -0.04 * screen.height,
      right: -0.04 * screen.height,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(0.27 * screen.height),
        child: Container(
          width: 0.54 * screen.height,
          height: 0.54 * screen.height,
          color: AppColors.white,
        ),
      ),
    );
  }
}

class _GrayBlock extends StatelessWidget {
  const _GrayBlock({
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
        height: 0.6 * screen.height,
        width: screen.width,
        color: AppColors.grayBackground,
        child: _GrayBlockText(screen: screen),
      ),
    );
  }
}

class _GrayBlockText extends StatelessWidget {
  const _GrayBlockText({
    Key? key,
    required this.screen,
  }) : super(key: key);
  final Size screen;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment : MainAxisAlignment.end,
      children: [
        Text(
          'Покупка и доставка\nтоваров в США и Европе\nс нами легко',
          style: TextStyle(
            color: AppColors.textColor,
            fontWeight: FontWeight.w800,
            fontSize: screen.height*0.024,
            letterSpacing: 0.5,
          ),
            softWrap: true, 
            textAlign: TextAlign.center,
        ),
        SizedBox(
          height: screen.height * 0.032,
        ),
        Text(
          'Нада сюди придумати пару строчок\nтексту просто привітального',
          style: TextStyle(
            color: AppColors.textColor,
            fontWeight: FontWeight.w700,
            fontSize: screen.height*0.017,
          ),
            softWrap: true, 
            textAlign: TextAlign.center,
        ),
        SizedBox(
          height: screen.height * 0.037,
        ),
        Text(
          'USAIN.UA',
          style: TextStyle(
            color: AppColors.greenButtonColor,
            fontWeight: FontWeight.w700,
            fontSize: screen.height*0.017,
          ),
            softWrap: true, 
            textAlign: TextAlign.center,
        ),
        SizedBox(
          height: screen.height * 0.042,
        ),
      ],
    );
  }
}
