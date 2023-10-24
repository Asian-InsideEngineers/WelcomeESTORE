import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:logger/logger.dart';
import 'package:welcomestoreapp/Generated%20Routes/routes.dart';
import 'package:welcomestoreapp/Logic%20Builder/Cart%20Logic/cartcubits.dart';
import 'package:welcomestoreapp/Logic%20Builder/Category%20Logic/categorycubit.dart';
import 'package:welcomestoreapp/Logic%20Builder/Order%20Logic/ordercubit.dart';
import 'package:welcomestoreapp/Logic%20Builder/Product%20Logic/productcubit.dart';

import 'package:welcomestoreapp/Logic%20Builder/User%20Logic/usercubit.dart';

import 'package:welcomestoreapp/Project%20Theme/Project_Colors.dart';
import 'package:welcomestoreapp/Frontend-Management/splash_Screen.dart';

import 'Logic Builder/Search Logic/searchlogic.dart';

var log = Logger(
  printer: PrettyPrinter(
    colors: true, // Colorful log messages
    printEmojis: true, // Print an emoji for each log message
  ),
);
void main() async {
  runApp(const MyApp());
  Bloc.observer = MyBlocObserver();
  HttpOverrides.global = new MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => UserCubits()),
        BlocProvider(create: (context) => CategoryCubit()),
        BlocProvider(create: (context) => ProductCubit()),
        BlocProvider(create: (context) => SearchCubit()),
        BlocProvider(
            create: (context) =>
                CartCubits(BlocProvider.of<UserCubits>(context))),
        BlocProvider(
          create: (context) => OrderCubits(
            BlocProvider.of<UserCubits>(context),
            BlocProvider.of<CartCubits>(context),
          ),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            title: "Lets Shop",
            debugShowCheckedModeBanner: false,
            onGenerateRoute: Routes.systemRoutes,
            initialRoute: SplashScreen.routeName,
            theme: ProjectThemes.project_Styles,
          );
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class MyBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    log.d("Generated: $bloc");
    super.onCreate(bloc);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    log.d("onChanged: $change");
    super.onChange(bloc, change);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    log.e("Error: $stackTrace");
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    log.d("Generated: $bloc");
    super.onClose(bloc);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    log.d("Generated: $transition");
    super.onTransition(bloc, transition);
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
