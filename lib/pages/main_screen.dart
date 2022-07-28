import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:usainua/bloc/navigation_bloc/navigation_bloc.dart';
import 'package:usainua/pages/acquaintance%20screen/acquaintance_page.dart';
import 'package:usainua/pages/box%20screen/first_page.dart';
import 'package:usainua/pages/choice%20screen/first_page.dart';
import 'package:usainua/pages/home%20screen/first_page.dart';
import 'package:usainua/pages/profile/first_page.dart';
import 'package:usainua/routes/app_router.dart';
import 'package:usainua/widgets/navigation/custom_bottom_navigation_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({
    Key? key,
  }) : super(key: key);
  static const routeName = '/main_screen.dart';
  static final GlobalKey<NavigatorState> _navigatorKey =
      GlobalKey<NavigatorState>();

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<String> _pages = [
    FirstPageHomeScreen.routeName,
    FirstPageProChoiceScreen.routeName,
    FirstPageHomeScreen.routeName,
    FirstPageProBoxScreen.routeName,
    FirstPageProfileScreen.routeName,
  ];
  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;

    return BlocConsumer<NavigationBloc, NavigationState>(
      listener: (_, state) {
        if (MainScreen._navigatorKey.currentState != null) {
          MainScreen._navigatorKey.currentState!.pushNamedAndRemoveUntil(
            _pages.elementAt(state.pageIndex),
            (route) => false,
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Navigator(
            key: MainScreen._navigatorKey,
            initialRoute: FirstPageHomeScreen.routeName,
            onGenerateRoute: AppRouter.generateRoute,
          ),
          bottomNavigationBar: CustomBottomNavigationBar(
            // onTap: (index) {
            //   print(index);
            //   context.read<NavigationBloc>().add(ChangePage(index: index));
            // },
            screen: screen,
          ),
          extendBody: true,
          resizeToAvoidBottomInset: false,
        );
      },
    );
  }
}
