import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:usainua/utils/app_colors.dart';
import 'package:usainua/utils/app_images.dart';

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
