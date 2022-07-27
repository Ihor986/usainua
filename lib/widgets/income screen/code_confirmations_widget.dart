import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:usainua/bloc/auth_bloc/auth_bloc.dart';
import 'package:usainua/pages/income%20screen/sign_in_screen.dart';
import 'package:usainua/utils/app_colors.dart';
import 'package:usainua/utils/app_icons.dart';
import 'package:usainua/widgets/green_button.dart';
import 'package:usainua/widgets/income%20screen/hint_text.dart';
import 'package:usainua/widgets/income%20screen/list_tile_button.dart';
import 'package:usainua/widgets/income%20screen/text_income.dart';

class CodeConfirmationsWidget extends StatelessWidget {
  const CodeConfirmationsWidget({
    Key? key,
    required this.onClick,
    required this.resend,
    required this.text,
  }) : super(key: key);

  final String text;
  final void Function() onClick;
  final void Function() resend;
  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
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
                  const TextIncome(text: 'Код\nподтверждения'),
                  _HintText(
                    phoneNumber: state.getFormatedPhone(),
                    screen: screen,
                  ),
                  _SignUpForm(
                    onClick: onClick,
                    text: text,
                    screen: screen,
                  ),
                  _ResendCode(
                    screen: screen,
                    resend: resend,
                  ),
                  // _Registered(
                  //   screen: screen,
                  // ),
                ],
              ),
            ),
          ),
          resizeToAvoidBottomInset: false,
        );
      },
    );
  }
}

class _HintText extends StatelessWidget {
  const _HintText({
    Key? key,
    required this.phoneNumber,
    required this.screen,
  }) : super(key: key);
  final Size screen;
  final String phoneNumber;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: screen.height * 0.33 - 16, left: 5),
      child: HintText(
        text: 'Смс с кодом отправленно на номер:\n$phoneNumber',
      ),
    );
  }
}

class _SignUpForm extends StatefulWidget {
  const _SignUpForm({
    Key? key,
    required this.onClick,
    required this.text,
    required this.screen,
  }) : super(key: key);
  final Size screen;
  final String text;
  final void Function() onClick;

  @override
  State<_SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<_SignUpForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.only(top: widget.screen.height * 0.4 - 16),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _Num(
                        screen: widget.screen,
                        codeController: state.authService.codeController,
                      ),
                      _Num(
                        screen: widget.screen,
                        codeController: state.authService.codeController2,
                      ),
                      _Num(
                        screen: widget.screen,
                        codeController: state.authService.codeController3,
                      ),
                      _Num(
                        screen: widget.screen,
                        codeController: state.authService.codeController4,
                      ),
                      _Num(
                        screen: widget.screen,
                        codeController: state.authService.codeController5,
                      ),
                      _Num(
                        screen: widget.screen,
                        codeController: state.authService.codeController6,
                      ),
                    ]),
                SizedBox(
                  height: widget.screen.height * 0.059,
                ),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: GreenButton(
                    text: widget.text,
                    onPressed: widget.onClick,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _Num extends StatelessWidget {
  const _Num({
    Key? key,
    required this.codeController,
    required this.screen,
  }) : super(key: key);
  final Size screen;
  final TextEditingController codeController;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screen.width * 0.1,
      height: screen.height * 0.08,
      child: TextFormField(
        onChanged: (value) {
          if (value.length != 1) return;
          FocusScope.of(context).nextFocus();
        },
        controller: codeController,
        decoration: const InputDecoration(
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.textColor,
              width: 3,
            ),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.textColor,
              width: 3,
            ),
          ),
          hintText: '',
          hintStyle: TextStyle(
            color: AppColors.disactiveTextColor,
          ),
        ),
        textAlign: TextAlign.center,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
        ],
        keyboardType: TextInputType.number,
        style: TextStyle(
          color: AppColors.textColor,
          fontSize: screen.height * 0.049,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}

class _ResendCode extends StatefulWidget {
  const _ResendCode({
    Key? key,
    required this.screen,
    required this.resend,
  }) : super(key: key);

  final void Function() resend;
  final Size screen;

  @override
  State<_ResendCode> createState() => __ResendCodeState();
}

class __ResendCodeState extends State<_ResendCode> {
  @override
  void initState() {
    startTimer();
    super.initState();
  }

  int start = 60;
  bool wait = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: widget.screen.height * 0.63,
        left: 5,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          wait
              ? Text(
                  'Отправить код повторно через: $start',
                  style: TextStyle(
                    color: AppColors.textColor,
                    fontSize: widget.screen.height * 0.017,
                    fontWeight: FontWeight.w400,
                  ),
                  softWrap: true,
                )
              : InkWell(
                  onTap: () {
                    start = 60;
                    wait = true;
                    widget.resend();
                  },
                  child: Text(
                    'Отправить код повторно',
                    style: TextStyle(
                      color: AppColors.textColor,
                      fontSize: widget.screen.height * 0.017,
                      fontWeight: FontWeight.w400,
                      decoration: TextDecoration.underline,
                    ),
                    softWrap: true,
                  ),
                ),
          _Registered(
            screen: widget.screen,
          ),
        ],
      ),
    );
  }

  void startTimer() {
    const Duration onsec = Duration(seconds: 1);
    Timer.periodic(onsec, (timer) {
      if (wait == false) {
        timer.cancel();
        return;
      }
      if (start == 0) {
        setState(() {
          timer.cancel();
          wait = false;
        });
        return;
      }
      setState(() {
        start--;
      });
    });
  }

  @override
  void dispose() {
    start = 0;
    wait = false;
    super.dispose();
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
    return Padding(
      padding: EdgeInsets.only(top: screen.height * 0.029),
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
