import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:usainua/bloc/auth_bloc/auth_bloc.dart';
import 'package:usainua/widgets/income%20screen/code_confirmations_widget.dart';

class CodeConfirmationsScreen extends StatelessWidget {
  const CodeConfirmationsScreen({Key? key}) : super(key: key);
  static const routeName = '/CodeConfirmationsScreen';
  @override
  Widget build(BuildContext context) {
    return CodeConfirmationsWidget(
      text: 'Зарегистрироваться',
      onClick: () {
        context.read<AuthBloc>().add(
              SignUpEvent(
                navigator: Navigator.of(context, rootNavigator: true),
              ),
            );
      },
      resend: () {
        context.read<AuthBloc>().add(VerifyPhoneNumberEvent());
      },
    );
  }
}
