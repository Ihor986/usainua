import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:usainua/utils/app_colors.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({
    Key? key,
  }) : super(key: key);
  static const routeName = '/';
  // static final GlobalKey<NavigatorState> _navigatorKey =
  //     GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Stack(
          children: const [
            Align(
              alignment: Alignment(-0.97, -0.76),
              child: _TextIncome(),
            ),
          ],
        ),
      ),
    );
  }
}

class _TextIncome extends StatelessWidget {
  const _TextIncome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;
    return Text(
      'Вход',
      style: TextStyle(
        color: AppColors.textColor,
        fontSize: screen.height * 0.052,
        fontWeight: FontWeight.w800,
        fontStyle: FontStyle.normal,
        letterSpacing: 0.5,
      ),
    );
  }
}
