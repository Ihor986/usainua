import 'package:flutter/material.dart';
import 'package:usainua/pages/income%20screen/password_has_been_sent_screen.dart';
import 'package:usainua/pages/income%20screen/sign_in_screen.dart';
import 'package:usainua/utils/app_colors.dart';
import 'package:usainua/utils/app_icons.dart';
import 'package:usainua/widgets/big_button.dart';
import 'package:usainua/widgets/income%20screen/hint_text.dart';
import 'package:usainua/widgets/income%20screen/text_income.dart';
import 'package:usainua/widgets/list_tile_button.dart';

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
            _HintText(),
            _LoginInput(),
            _RemindPasswordButton(),
            // _RememberedPasswordButton(),
          ],
        ),
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}

class _HintText extends StatelessWidget {
  const _HintText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(top: screen.height * 0.24 - 16),
      child: const HintText(
        text: 'Введите эл. почту или телефон',
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
      child: SizedBox(
        height: 56,
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
            fillColor: AppColors.grayBackground,
            filled: true,
          ),
          keyboardType: TextInputType.phone,
          style: const TextStyle(
            color: AppColors.textColor,
          ),
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
      child: Column(
        children: [
          BigButton(
            text: 'НАПОМНИТЬ ПАРОЛЬ',
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(context,
                  PasswordHasBeenSentScreen.routeName, (route) => false);
            },
            color: AppColors.greenButtonColor,
            shadowColor: AppColors.greenButtonShadowColor,
            textColor: AppColors.greenButtonTextColor,
          ),
          // SizedBox(
          //   height: screen.height * 0.04,
          // ),
          const _RememberedPasswordButton(),
        ],
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
      padding: EdgeInsets.only(top: screen.height * 0.04),
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
