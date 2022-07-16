import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:usainua/pages/income%20screen/remind_password_screen.dart';
import 'package:usainua/pages/income%20screen/sign_up_screen.dart';
import 'package:usainua/pages/income%20screen/widgets/green_button.dart';
import 'package:usainua/pages/income%20screen/widgets/list_tile_button.dart';
import 'package:usainua/pages/income%20screen/widgets/media_income_button.dart';
import 'package:usainua/pages/income%20screen/widgets/text_income.dart';
import 'package:usainua/utils/app_colors.dart';
import 'package:usainua/utils/app_icons.dart';

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
      body: GestureDetector(
        onTap: () {
          if (FocusNode().hasFocus) {
            FocusScope.of(context).unfocus();
          } else {
            FocusScope.of(context).requestFocus(FocusNode());
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Stack(
            children: const [
              TextIncome(text: 'Вход'),
              _IncomeForm(),
              _RemindPassword(),
              _SignUp(),
              _MedisIncome(),
            ],
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}

class _IncomeForm extends StatefulWidget {
  const _IncomeForm({Key? key}) : super(key: key);

  @override
  State<_IncomeForm> createState() => __IncomeFormState();
}

class __IncomeFormState extends State<_IncomeForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isSecure = true;
  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.only(top: screen.height * 0.23 - 16),
      child: Column(
        children: [
          Form(
            key: _formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Ваш Номер телефона*',
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
                ),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Ваш пороль*',
                      hintStyle: const TextStyle(
                        color: AppColors.disactiveTextColor,
                      ),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(
                          Radius.circular(16.0),
                        ),
                      ),
                      fillColor: AppColors.inputBackgroundColor,
                      filled: true,
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _isSecure = !_isSecure;
                          });
                        },
                        icon: SvgPicture.asset(
                          AppIcons.yey,
                          width: screen.height * 0.0246,
                          color: AppColors.textColor,
                        ),
                      ),
                    ),
                    obscureText: _isSecure,
                    style: const TextStyle(
                      color: AppColors.textColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: screen.height * 0.049,
          ),
          Padding(
            padding: const EdgeInsets.all(5),
            child: GreenButton(
              text: 'ВОЙТИ',
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}

class _RemindPassword extends StatelessWidget {
  const _RemindPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(top: screen.height * 0.56 - 16),
      child: ListTileButton(
        text: 'Напомнить пароль',
        icon: AppIcons.lock,
        onTap: () {
          Navigator.pushNamedAndRemoveUntil(
              context, RemindPasswordScreen.routeName, (route) => false);
        },
      ),
    );
  }
}

class _SignUp extends StatelessWidget {
  const _SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(top: screen.height * 0.6 - 16),
      child: ListTileButton(
        text: 'Зарегистрироваться',
        icon: AppIcons.profilePlus,
        onTap: () {
          Navigator.pushNamedAndRemoveUntil(
              context, SignUpScreen.routeName, (route) => false);
        },
      ),
    );
  }
}

class _MedisIncome extends StatelessWidget {
  const _MedisIncome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;
    return Padding(
      padding:
          EdgeInsets.only(top: screen.height * 0.74 - 16, left: 5, right: 5),
      child: const MedisIncome(),
    );
  }
}
