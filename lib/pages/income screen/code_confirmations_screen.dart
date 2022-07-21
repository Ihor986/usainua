import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:usainua/bloc/auth_bloc/auth_bloc.dart';
import 'package:usainua/pages/income%20screen/sign_in_screen.dart';
import 'package:usainua/utils/app_colors.dart';
import 'package:usainua/utils/app_icons.dart';
import 'package:usainua/widgets/income%20screen/green_button.dart';
import 'package:usainua/widgets/income%20screen/hint_text.dart';
import 'package:usainua/widgets/income%20screen/list_tile_button.dart';
import 'package:usainua/widgets/income%20screen/text_income.dart';

class CodeConfirmationsScreen extends StatelessWidget {
  const CodeConfirmationsScreen({Key? key}) : super(key: key);
  static const routeName = '/CodeConfirmationsScreen';
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
              TextIncome(text: 'Код\nподтверждения'),
              _HintText(
                phoneNumber: '+38 063 058 8512',
              ),
              _SignUpForm(),
              _ResendCode(),
              _Registered(),
            ],
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}

class _HintText extends StatelessWidget {
  const _HintText({
    Key? key,
    required this.phoneNumber,
  }) : super(key: key);
  final String phoneNumber;

  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(top: screen.height * 0.33 - 16, left: 5),
      child: HintText(
        text: 'Смс с кодом отправленно на номер:\n$phoneNumber',
      ),
    );
  }
}

class _SignUpForm extends StatefulWidget {
  const _SignUpForm({Key? key}) : super(key: key);

  @override
  State<_SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<_SignUpForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.only(top: screen.height * 0.4 - 16),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List<Widget>.generate(
                6,
                (int index) {
                  return const _Num();
                },
              ),
            ),
            SizedBox(
              height: screen.height * 0.059,
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: GreenButton(
                text: 'Зарегистрироваться',
                onPressed: () {
                  context.read<AuthBloc>().add(
                        SignUpEvent(context: context),
                      );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Num extends StatelessWidget {
  const _Num({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;
    return SizedBox(
      width: screen.width * 0.1,
      height: screen.height * 0.08,
      child: TextFormField(
        onChanged: (value) {
          if (value.length != 1) return;
          FocusScope.of(context).nextFocus();
        },
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
  const _ResendCode({Key? key}) : super(key: key);

  @override
  State<_ResendCode> createState() => __ResendCodeState();
}

class __ResendCodeState extends State<_ResendCode> {
  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(
        top: screen.height * 0.62,
        left: 5,
      ),
      child: Text(
        'Отправить код повторно через: 24',
        style: TextStyle(
          color: AppColors.textColor,
          fontSize: screen.height * 0.017,
          fontWeight: FontWeight.w400,
        ),
        softWrap: true,
      ),
    );
  }
}

class _Registered extends StatelessWidget {
  const _Registered({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(top: screen.height * 0.68 - 16),
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
