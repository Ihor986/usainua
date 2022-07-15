import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:usainua/pages/income%20screen/remind_password_screen.dart';
import 'package:usainua/pages/income%20screen/widgets/green_button.dart';
import 'package:usainua/pages/income%20screen/widgets/text_income.dart';
import 'package:usainua/utils/app_colors.dart';
import 'package:usainua/utils/app_icons.dart';
import 'package:usainua/utils/app_images.dart';

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
            TextIncome(),
            _IncomeForm(),
            _RemindPassword(),
            _SignUp(),
            _GoogleIncome(),
            _FacebookIncome(),
          ],
        ),
      ),
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
      padding: EdgeInsets.only(top: screen.height * 0.23),
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
      padding: EdgeInsets.only(top: screen.height * 0.56),
      child: ListTile(
        onTap: () {
          Navigator.pushNamedAndRemoveUntil(
              context, RemindPasswordScreen.routeName, (route) => false);
        },
        title: Row(children: [
          SvgPicture.asset(
            AppIcons.lock,
            color: AppColors.blueIconsColor,
            width: screen.width * 0.04,
          ),
          SizedBox(
            width: screen.width * 0.05,
          ),
          Text(
            'Напомнить пароль',
            style: TextStyle(
              color: AppColors.textColor,
              fontSize: screen.height * 0.017,
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.normal,
            ),
          ),
        ]),
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
      padding: EdgeInsets.only(top: screen.height * 0.6),
      child: ListTile(
        onTap: () {
          // print(screen.height);
        },
        title: Row(children: [
          SvgPicture.asset(
            AppIcons.profile,
            color: AppColors.blueIconsColor,
            width: screen.width * 0.05,
          ),
          SizedBox(
            width: screen.width * 0.04,
          ),
          Text(
            'Зарегистрироваться',
            style: TextStyle(
              color: AppColors.textColor,
              fontSize: screen.height * 0.017,
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.normal,
            ),
          ),
        ]),
      ),
    );
  }
}

class _GoogleIncome extends StatelessWidget {
  const _GoogleIncome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(top: screen.height * 0.74, left: 5, right: 5),
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: const BoxDecoration(
          color: AppColors.mediaButtonBackgroundColor,
          borderRadius: BorderRadius.all(
            Radius.circular(16.0),
          ),
        ),
        width: screen.width - 42,
        height: screen.height * 0.069,
        child: TextButton(
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Войти как пользователь',
                style: TextStyle(
                  color: AppColors.textColor,
                ),
              ),
              SvgPicture.asset(AppImages.google),
            ],
          ),
        ),
      ),
    );
  }
}

class _FacebookIncome extends StatelessWidget {
  const _FacebookIncome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(top: screen.height * 0.82, left: 5, right: 5),
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: const BoxDecoration(
          color: AppColors.mediaButtonBackgroundColor,
          borderRadius: BorderRadius.all(
            Radius.circular(16.0),
          ),
        ),
        width: screen.width - 42,
        height: screen.height * 0.069,
        child: TextButton(
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Войти как пользователь',
                style: TextStyle(
                  color: AppColors.textColor,
                ),
              ),
              SvgPicture.asset(AppImages.facebook),
            ],
          ),
        ),
      ),
    );
  }
}
