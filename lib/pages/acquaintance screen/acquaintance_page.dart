import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:usainua/pages/acquaintance%20screen/first_page.dart';
import 'package:usainua/pages/acquaintance%20screen/fourth_page.dart';
import 'package:usainua/pages/acquaintance%20screen/second_page.dart';
import 'package:usainua/pages/acquaintance%20screen/third_page.dart';
import 'package:usainua/utils/app_colors.dart';
import 'package:usainua/utils/app_icons.dart';

class AcquaintanceScreen extends StatelessWidget {
  const AcquaintanceScreen({Key? key}) : super(key: key);
  static const routeName = '/AcquaintanceScreen';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.white,
      body: _MyWidget(),
      resizeToAvoidBottomInset: false,
    );
  }
}

class _MyWidget extends StatefulWidget {
  const _MyWidget({Key? key}) : super(key: key);

  @override
  State<_MyWidget> createState() => _MyWidgetState();
}

int page = 0;

class _MyWidgetState extends State<_MyWidget> {
  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController(initialPage: 0);
    final Size screen = MediaQuery.of(context).size;
    return Stack(
      children: [
        PageView(
          onPageChanged: (value) {
            setState(() {
              page = value;
            });
          },
          controller: controller,
          children: <Widget>[
            FirstPage(screen: screen),
            SecondPage(screen: screen),
            ThirdPage(screen: screen),
            FourthPage(screen: screen),
            SecondPage(screen: screen),
          ],
        ),
        page < 4
            ? _ScreenRow(
                screen: screen,
                pageController: controller,
                page: page,
              )
            : const SizedBox(),
      ],
    );
  }
}

class _ScreenRow extends StatefulWidget {
  const _ScreenRow({
    Key? key,
    required this.screen,
    required this.pageController,
    required this.page,
  }) : super(key: key);
  final Size screen;
  final PageController pageController;
  final int page;
  @override
  State<_ScreenRow> createState() => _ScreenRowState();
}

class _ScreenRowState extends State<_ScreenRow> {
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
