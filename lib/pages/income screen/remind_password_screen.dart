import 'package:flutter/material.dart';
import 'package:usainua/pages/income%20screen/password_has_been_sent_screen.dart';
import 'package:usainua/pages/income%20screen/sign_in_screen.dart';
import 'package:usainua/pages/income%20screen/widgets/green_button.dart';
import 'package:usainua/pages/income%20screen/widgets/list_tile_button.dart';
import 'package:usainua/pages/income%20screen/widgets/text_income.dart';
import 'package:usainua/utils/app_colors.dart';
import 'package:usainua/utils/app_icons.dart';

class RemindPasswordScreen extends StatelessWidget {
  const RemindPasswordScreen({Key? key}) : super(key: key);
  static const routeName = '/RemindPasswordScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Stack(
          children: const [
            TextIncome(text: 'Вход'),
            _HelperText(),
            _LoginInput(),
            _RemindPasswordButton(),
            _RememberedPasswordButton(),
          ],
        ),
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}

class _HelperText extends StatelessWidget {
  const _HelperText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(top: screen.height * 0.24 - 16),
      child: Text(
        'Введите эл. почту или телефон',
        style: TextStyle(
          color: AppColors.blueIconsColor,
          fontSize: screen.height * 0.019,
          fontWeight: FontWeight.w700,
          fontStyle: FontStyle.normal,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}

class _LoginInput extends StatelessWidget {
  const _LoginInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;
    return Padding(
      padding:
          EdgeInsets.only(top: screen.height * 0.3 - 16, left: 5, right: 5),
      child: TextFormField(
        decoration: const InputDecoration(
          hintText: 'Ваш email или телефон',
          hintStyle: TextStyle(
            color: AppColors.disactiveTextColor,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(
              Radius.circular(16.0),
            ),
          ),
          fillColor: AppColors.inputBackgroundColor,
          filled: true,
        ),
        keyboardType: TextInputType.phone,
        style: const TextStyle(
          color: AppColors.textColor,
        ),
      ),
    );
  }
}

class _RemindPasswordButton extends StatelessWidget {
  const _RemindPasswordButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;
    return Padding(
      padding:
          EdgeInsets.only(top: screen.height * 0.43 - 16, left: 5, right: 5),
      child: GreenButton(
        text: 'НАПОМНИТЬ ПАРОЛЬ',
        onPressed: () {
          Navigator.pushNamedAndRemoveUntil(
              context, PasswordHasBeenSentScreen.routeName, (route) => false);
        },
      ),
    );
  }
}

class _RememberedPasswordButton extends StatelessWidget {
  const _RememberedPasswordButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(top: screen.height * 0.53 - 16),
      child: ListTileButton(
        text: 'Я вспомнил свой пароль',
        icon: AppIcons.password,
        onTap: () {
          Navigator.pushNamedAndRemoveUntil(
              context, SignInScreen.routeName, (route) => false);
        },
      ),
    );
  }
}
