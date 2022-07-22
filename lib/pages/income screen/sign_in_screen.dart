import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:usainua/bloc/auth_bloc/auth_bloc.dart';
import 'package:usainua/pages/acquaintance%20screen/acquaintance_page.dart';
import 'package:usainua/pages/income%20screen/code_confirmations_screen.dart';
import 'package:usainua/pages/income%20screen/remind_password_screen.dart';
import 'package:usainua/pages/income%20screen/sign_up_screen.dart';
import 'package:usainua/utils/app_colors.dart';
import 'package:usainua/utils/app_icons.dart';
import 'package:usainua/widgets/income%20screen/green_button.dart';
import 'package:usainua/widgets/income%20screen/list_tile_button.dart';
import 'package:usainua/widgets/income%20screen/media_income_button.dart';
import 'package:usainua/widgets/income%20screen/text_income.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({
    Key? key,
  }) : super(key: key);
  static const routeName = '/';
  // static final GlobalKey<NavigatorState> _navigatorKey =
  //     GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;
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
            children: [
              const TextIncome(text: 'Вход'),
              _IncomeForm(screen: screen),
              _RemindPassword(screen: screen),
              // _SignUp(screen: screen),
              _MedisIncome(screen: screen),
            ],
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}

class _IncomeForm extends StatefulWidget {
  const _IncomeForm({
    Key? key,
    required this.screen,
  }) : super(key: key);
  final Size screen;

  @override
  State<_IncomeForm> createState() => __IncomeFormState();
}

class __IncomeFormState extends State<_IncomeForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _user = FirebaseAuth.instance.currentUser;
  bool _isSecure = true;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.only(top: widget.screen.height * 0.23 - 16),
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: TextFormField(
                        controller: state.authService.phoneInputController,
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
                          fillColor: AppColors.grayBackground,
                          filled: true,
                        ),
                        keyboardType: TextInputType.phone,
                        onChanged: (value) {
                          context
                              .read<AuthBloc>()
                              .add(OnChangePhoneEvent(value: value));
                        },
                        style: const TextStyle(
                          color: AppColors.textColor,
                        ),
                        validator: (value) {
                          if (value == null || value.length != 13) {
                            return 'Укажите Ваш Номер телефона';
                          }
                          return null;
                        },
                      ),
                    ),
                    _user != null
                        ? Padding(
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
                                fillColor: AppColors.grayBackground,
                                filled: true,
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _isSecure = !_isSecure;
                                    });
                                  },
                                  icon: SvgPicture.asset(
                                    AppIcons.yey,
                                    width: widget.screen.height * 0.0246,
                                    color: AppColors.textColor,
                                  ),
                                ),
                              ),
                              obscureText: _isSecure,
                              style: const TextStyle(
                                color: AppColors.textColor,
                              ),
                            ),
                          )
                        : const SizedBox(),
                  ],
                ),
              ),
              SizedBox(
                height: widget.screen.height * 0.049,
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: GreenButton(
                  text: 'ВОЙТИ',
                  onPressed: () {
                    if (!_formKey.currentState!.validate()) return;
                    if (_user?.phoneNumber ==
                        state.authService.phoneInputController.text) {
                      Navigator.pushNamedAndRemoveUntil(context,
                          AcquaintanceScreen.routeName, (route) => false);
                    } else {
                      context.read<AuthBloc>().add(VerifyPhoneNumberEvent());
                      Navigator.pushNamedAndRemoveUntil(context,
                          CodeConfirmationsScreen.routeName, (route) => false);
                    }
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _RemindPassword extends StatelessWidget {
  const _RemindPassword({
    Key? key,
    required this.screen,
  }) : super(key: key);
  final Size screen;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: screen.height * 0.55 - 16),
      child: Column(
        children: [
          ListTileButton(
            text: 'Напомнить пароль',
            icon: AppIcons.lock,
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, RemindPasswordScreen.routeName, (route) => false);
            },
          ),
          SizedBox(
            height: screen.height * 0.02,
          ),
          ListTileButton(
            text: 'Зарегистрироваться',
            icon: AppIcons.profilePlus,
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, SignUpScreen.routeName, (route) => false);
            },
          ),
        ],
      ),
    );
  }
}

// class _SignUp extends StatelessWidget {
//   const _SignUp({
//     Key? key,
//     required this.screen,
//   }) : super(key: key);
//   final Size screen;
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.only(top: screen.height * 0.61 - 16),
//       child:
//     );
//   }
// }

class _MedisIncome extends StatelessWidget {
  const _MedisIncome({
    Key? key,
    required this.screen,
  }) : super(key: key);
  final Size screen;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(top: screen.height * 0.74 - 16, left: 5, right: 5),
      child: const MedisIncome(),
    );
  }
}
