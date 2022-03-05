import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stella_stays_mobile/pages/home_page.dart';
import 'package:stella_stays_mobile/pages/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      designSize: const Size(375, 812),
      builder: () => MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xFFF1F1F4),
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
        ),
        routes: {
          "/": (BuildContext context) => const HomePage(),
          "/loginscreen": (BuildContext context) => const LoginScreen(),
        },
      ),
    );
  }
}
