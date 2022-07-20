import 'package:bot_toast/bot_toast.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:usainua/bloc/auth_bloc/auth_bloc.dart';
import 'package:usainua/firebase_options.dart';
import 'package:usainua/pages/income%20screen/sign_in_screen.dart';
import 'package:usainua/routes/app_router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // await DataBase.instance.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  // await FirebaseAuth.instance.signOut();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
        // MultiRepositoryProvider(
        //   providers: const [
        //     // RepositoryProvider(create: (context) => UserRepository()),
        //     // RepositoryProvider(create: (context) => AuthReposytory('')),
        //     // RepositoryProvider(create: (context) => TalesListRepository()),
        //     // RepositoryProvider(create: (context) => SelectionsListRepository()),
        //   ],
        //   child:
        MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(create: (context) => AuthBloc()),
        //       // BlocProvider<SelectionsBloc>(create: (context) => SelectionsBloc()),
        //       // BlocProvider<MainScreenBloc>(create: (context) => MainScreenBloc()),
        //       // BlocProvider<NavigationBloc>(create: (context) => NavigationBloc()),
        //       // BlocProvider<ProfileBloc>(create: (context) => ProfileBloc()),
        //       // BlocProvider<DeleteBloc>(create: (context) => DeleteBloc()),
        //       // BlocProvider<SubscribeBloc>(create: (context) => SubscribeBloc()),
        //       // BlocProvider<RecordBloc>(create: (context) => RecordBloc()),
        //       // BlocProvider<AudioScreenBloc>(create: (context) => AudioScreenBloc()),
      ],
      child: MaterialApp(
        theme: _buildTheme(Brightness.dark),
        builder: BotToastInit(),
        navigatorObservers: [BotToastNavigatorObserver()],
        debugShowCheckedModeBanner: true,
        initialRoute: SignInScreen.routeName,
        onGenerateRoute: AppRouter.generateRoute,
        //   ),
      ),
    );
  }

  ThemeData _buildTheme(brightness) {
    var baseTheme = ThemeData(brightness: brightness);

    return baseTheme.copyWith(
      textTheme: GoogleFonts.latoTextTheme(baseTheme.textTheme),
    );
  }
}
