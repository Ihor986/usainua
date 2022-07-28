import 'package:flutter/material.dart';
import 'package:usainua/pages/acquaintance%20screen/acquaintance_page.dart';
import 'package:usainua/pages/home%20screen/first_page.dart';
import 'package:usainua/pages/home%20screen/main_screen.dart';
import 'package:usainua/pages/income%20screen/code_confirmations_screen.dart';
import 'package:usainua/pages/income%20screen/code_confirmations_signin_screen.dart';
import 'package:usainua/pages/income%20screen/password_has_been_sent_screen.dart';
import 'package:usainua/pages/income%20screen/remind_password_screen.dart';
import 'package:usainua/pages/income%20screen/sign_in_screen.dart';
import 'package:usainua/pages/income%20screen/sign_up_screen.dart';

class AppRouter {
  const AppRouter._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    // final Object? arguments = settings.arguments;

    WidgetBuilder builder;

    // Login

    switch (settings.name) {
      case SignInScreen.routeName:
        builder = (_) => const SignInScreen();
        break;

      case RemindPasswordScreen.routeName:
        builder = (_) => const RemindPasswordScreen();
        break;

      case PasswordHasBeenSentScreen.routeName:
        builder = (_) => const PasswordHasBeenSentScreen();
        break;

      case SignUpScreen.routeName:
        builder = (_) => const SignUpScreen();
        break;

      case CodeConfirmationsScreen.routeName:
        builder = (_) => const CodeConfirmationsScreen();
        break;

      case CodeConfirmationsSignInScreen.routeName:
        builder = (_) => const CodeConfirmationsSignInScreen();
        break;

      // AcquaintanceScreen

      case AcquaintanceScreen.routeName:
        builder = (_) => const AcquaintanceScreen();
        break;

      // Home screen

      case MainScreen.routeName:
        builder = (_) => const MainScreen();
        break;

      case FirstPageHomeScreen.routeName:
        builder = (_) => const FirstPageHomeScreen();
        break;

      // case MainScreen.routeName:
      //   builder = (_) => const MainScreen();
      //   break;

      // case PasswordHasBeenSentScreen.routeName:
      //   builder = (_) => const PasswordHasBeenSentScreen();
      //   break;

      // case TicketDetailsPage.routeName:
      //   final TicketDetailsPageArguments args =
      //       arguments as TicketDetailsPageArguments;
      //   builder = (_) => TicketDetailsPage(
      //         index: args.index,
      //         title: args.title,
      //       );
      //   break;

      default:
        throw Exception('Invalid route: ${settings.name}');
    }

    return MaterialPageRoute(
      builder: builder,
      settings: settings,
    );
  }
}
