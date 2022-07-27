import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:usainua/utils/app_colors.dart';

class ListTileButton extends StatelessWidget {
  const ListTileButton({
    Key? key,
    required this.icon,
    required this.text,
    required this.onTap,
  }) : super(key: key);
  final void Function() onTap;
  final String text;
  final String icon;

  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;
    return InkWell(
      onTap: onTap,
      child: Row(children: [
        SvgPicture.asset(
          icon,
          color: AppColors.blueIconsColor,
          height: screen.height * 0.02,
        ),
        SizedBox(
          width: screen.width * 0.04,
        ),
        Text(
          text,
          style: TextStyle(
            color: AppColors.textColor,
            fontSize: screen.height * 0.017,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
          ),
        ),
      ]),
    );
  }
}
