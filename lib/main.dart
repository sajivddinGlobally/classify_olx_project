import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

import 'package:shopping_app_olx/home/home.page.dart';
import 'package:shopping_app_olx/login/login.page.dart';
import 'package:shopping_app_olx/noInterNet.dart' show NoInternetPage;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Hive and open the box
  await Hive.initFlutter();
  await Hive.openBox("data");

  // Initialize the navigator key globally

  // Run the app with the ProviderScope and pass the navigatorKey
  runApp(ProviderScope(child: MyApp()));
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  late final StreamSubscription<InternetStatus> _listener;

  bool isOffline = false;

  @override
  void initState() {
    super.initState();

    // _listener = InternetConnection().onStatusChange.listen((status) {
    //   final hasInternet = status == InternetStatus.connected;
    //   final ctx = navigatorKey.currentContext;

    //   if (!hasInternet && !isOffline && ctx != null) {
    //     isOffline = true;
    //     if (ModalRoute.of(ctx)?.settings.name != '/no-internet') {
    //       navigatorKey.currentState?.pushReplacementNamed('/no-internet');
    //     }
    //   } else if (hasInternet && isOffline && ctx != null) {
    //     isOffline = false;
    //     if (ModalRoute.of(ctx)?.settings.name != '/home') {
    //       navigatorKey.currentState?.pushReplacementNamed('/home');
    //     }
    //   }
    // });
  }

  @override
  void dispose() {
    _listener.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var box = Hive.box("data");
    var token = box.get("token");
    log("///////////////////////////////////");
    log(token?.toString() ?? "No token found");

    return ScreenUtilInit(
      designSize: Size(440, 956),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return SafeArea(
          child: MaterialApp(
            navigatorKey: navigatorKey,
            title: 'Flutter Demo',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            ),
            home: HomePage(), // Check if token exists
            routes: {
              '/home': (context) => const HomePage(),
              '/no-internet': (context) => const NoInternetPage(),
              '/login': (context) => const LoginPage()
            },
          ),
        );
      },
    );
  }
}
