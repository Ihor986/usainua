import 'package:flutter/material.dart';
import 'package:usainua/pages/income%20screen/sign_in_screen.dart';

class AppRouter {
  const AppRouter._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final Object? arguments = settings.arguments;

    WidgetBuilder builder;

    switch (settings.name) {
      case SignInScreen.routeName:
        builder = (_) => const SignInScreen();
        break;

      // case RegularUserPage.routeName:
      //   builder = (_) => const RegularUserPage();
      //   break;

      // case NewUserPage.routeName:
      //   builder = (_) => const NewUserPage();
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
