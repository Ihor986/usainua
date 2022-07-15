import 'package:flutter/material.dart';
import 'package:usainua/pages/income%20screen/password_has_been_sent_screen.dart';
import 'package:usainua/pages/income%20screen/remind_password_screen.dart';
import 'package:usainua/pages/income%20screen/sign_in_screen.dart';

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

      // End Login

      //   case SignInScreen.routeName:
      //   builder = (_) => const SignInScreen();
      //   break;

      // case RemindPasswordScreen.routeName:
      //   builder = (_) => const RemindPasswordScreen();
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
