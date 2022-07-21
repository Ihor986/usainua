import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:usainua/bloc/auth_bloc/auth_bloc.dart';
import 'package:usainua/pages/income%20screen/code_confirmations_screen.dart';
import 'package:usainua/pages/income%20screen/sign_in_screen.dart';
import 'package:usainua/utils/app_colors.dart';
import 'package:usainua/utils/app_icons.dart';
import 'package:usainua/widgets/income%20screen/green_button.dart';
import 'package:usainua/widgets/income%20screen/list_tile_button.dart';
import 'package:usainua/widgets/income%20screen/media_income_button.dart';
import 'package:usainua/widgets/income%20screen/text_income.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);
  static const routeName = '/SignUpScreen';
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
            // alignment: AlignmentDirectional.center,
            children: [
              const TextIncome(text: 'Регистрация'),
              _SignUpForm(screen: screen),
              _Registered(screen: screen),
              _MedisIncome(screen: screen),
            ],
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}

class _SignUpForm extends StatefulWidget {
  const _SignUpForm({
    Key? key,
    required this.screen,
  }) : super(key: key);
  final Size screen;

  @override
  State<_SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<_SignUpForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return Align(
          alignment: const Alignment(0, -0.14),
          // padding: EdgeInsets.only(top: widget.screen.height * 0.23 - 16),
          // child:
          // SizedBox(
          //   height: widget.screen.height * 0.5,
          // child: SingleChildScrollView(
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: TextFormField(
                        validator: (value) {
                          // if (value == null || value.isEmpty) {
                          //   return 'Укажите Ваше имя';
                          // }
                          return null;
                        },
                        decoration: const InputDecoration(
                          hintText: 'Ваше имя*',
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
                        // keyboardType: TextInputType.phone,
                        style: const TextStyle(
                          color: AppColors.textColor,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: TextFormField(
                        validator: (value) {
                          // if (value == null || value.isEmpty) {
                          //   return 'Укажите Ваш email';
                          // }
                          return null;
                        },
                        decoration: const InputDecoration(
                          hintText: 'Ваш email*',
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
                        // keyboardType: TextInputType.phone,
                        style: const TextStyle(
                          color: AppColors.textColor,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.length != 13) {
                            return 'Укажите Ваш Номер телефона';
                          }
                          return null;
                        },
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
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: widget.screen.height * 0.018,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Регистрируясь, Вы соглашаетесь с',
                        style: TextStyle(
                          color: AppColors.textColor,
                          fontWeight: FontWeight.w400,
                          fontSize: widget.screen.height * 0.017,
                          letterSpacing: 0.75,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          'пользовательским соглашением',
                          style: TextStyle(
                            color: AppColors.textColor,
                            fontSize: widget.screen.height * 0.017,
                            fontWeight: FontWeight.w400,
                            decoration: TextDecoration.underline,
                            letterSpacing: 0.75,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: widget.screen.height * 0.05,
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: GreenButton(
                  text: 'Зарегистрироваться',
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      context.read<AuthBloc>().add(VerifyPhoneNumberEvent());
                      Navigator.pushNamedAndRemoveUntil(context,
                          CodeConfirmationsScreen.routeName, (route) => false);
                    }
                  },
                ),
              ),
            ],
          ),
          //   ),
          // ),
        );
      },
    );
  }
}

class _Registered extends StatelessWidget {
  const _Registered({
    Key? key,
    required this.screen,
  }) : super(key: key);
  final Size screen;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const Alignment(0, 0.44),
      // padding: EdgeInsets.only(top: screen.height * 0.7 - 16),
      child: ListTileButton(
        text: 'Я уже зарегистрирован',
        icon: AppIcons.password,
        onTap: () {
          Navigator.pushNamedAndRemoveUntil(
              context, SignInScreen.routeName, (route) => false);
        },
      ),
    );
  }
}

class _MedisIncome extends StatelessWidget {
  const _MedisIncome({
    Key? key,
    required this.screen,
  }) : super(key: key);
  final Size screen;
  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment(0, 0.8),
      // padding:
      //     EdgeInsets.only(top: screen.height * 0.79 - 16, left: 5, right: 5),
      child: MedisIncome(),
    );
  }
}
