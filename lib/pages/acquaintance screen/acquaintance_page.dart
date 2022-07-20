import 'package:flutter/material.dart';
import 'package:usainua/pages/acquaintance%20screen/first_page.dart';
import 'package:usainua/pages/acquaintance%20screen/second_page.dart';
import 'package:usainua/utils/app_colors.dart';
import 'package:usainua/widgets/acquaintance%20screen/acquaintance_row_widget.dart';

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
            const SecondPage(),
            const SecondPage(),
            const SecondPage(),
            const SecondPage(),
          ],
        ),
        page < 4
            ? ScreenRow(
                screen: screen,
                pageController: controller,
                page: page,
              )
            : const SizedBox(),
      ],
    );
  }
}
