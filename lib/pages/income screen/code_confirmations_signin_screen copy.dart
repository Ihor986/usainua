import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:usainua/bloc/auth_bloc/auth_bloc.dart';
import 'package:usainua/widgets/income%20screen/code_confirmations_widget.dart';

class CodeConfirmationsSignInScreen extends StatelessWidget {
  const CodeConfirmationsSignInScreen({Key? key}) : super(key: key);
  static const routeName = '/CodeConfirmationsSignInScreen';
  @override
  Widget build(BuildContext context) {
    return CodeConfirmationsWidget(
      text: 'Войти',
      onClick: () {
        context.read<AuthBloc>().add(
              SignInEvent(
                navigator: Navigator.of(context, rootNavigator: true),
              ),
            );
      },
    );
  }
}
