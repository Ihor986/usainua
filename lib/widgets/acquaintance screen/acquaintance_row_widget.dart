import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:usainua/utils/app_colors.dart';
import 'package:usainua/utils/app_icons.dart';

class ScreenRow extends StatefulWidget {
  const ScreenRow({
    Key? key,
    required this.screen,
    required this.pageController,
    required this.page,
  }) : super(key: key);
  final Size screen;
  final PageController pageController;
  final int page;
  @override
  State<ScreenRow> createState() => _ScreenRowState();
}

class _ScreenRowState extends State<ScreenRow> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const Alignment(0, 0.9),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _RowText(
              text: 'Назад',
              onPressed: () {
                if (widget.page == 0) return;
                widget.pageController.jumpToPage(widget.page - 1);
              }),
          _RowIndicator(
            color: widget.page == 0
                ? AppColors.blueIconsColor
                : AppColors.grayBackground,
          ),
          _RowIndicator(
            color: widget.page == 1
                ? AppColors.blueIconsColor
                : AppColors.grayBackground,
          ),
          _RowIndicator(
            color: widget.page == 2
                ? AppColors.blueIconsColor
                : AppColors.grayBackground,
          ),
          _RowIndicator(
            color: widget.page == 3
                ? AppColors.blueIconsColor
                : AppColors.grayBackground,
          ),
          _RowText(
            text: 'Далее',
            onPressed: () => widget.pageController.jumpToPage(widget.page + 1),
          ),
        ],
      ),
    );
  }
}

class _RowText extends StatelessWidget {
  const _RowText({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);
  final String text;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(
          color: AppColors.textColor,
        ),
      ),
    );
  }
}

class _RowIndicator extends StatelessWidget {
  const _RowIndicator({
    Key? key,
    required this.color,
  }) : super(key: key);
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      AppIcons.pageViewIndicator,
      color: color,
    );
  }
}
