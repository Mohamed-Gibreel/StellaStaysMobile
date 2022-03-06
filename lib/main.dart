import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:stella_stays_mobile/pages/home_page.dart';
import 'package:stella_stays_mobile/pages/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:stella_stays_mobile/state/state.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
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
      builder: () => ChangeNotifierProvider<AppState>(
        create: (_) => AppState(),
        lazy: false,
        child: MaterialApp(
          theme: ThemeData(
            scaffoldBackgroundColor: const Color(0xFFF1F1F4),
            appBarTheme: const AppBarTheme(
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
          ),
          initialRoute: "/loginscreen",
          routes: {
            "/": (BuildContext context) => const HomePage(),
            "/loginscreen": (BuildContext context) => const LoginScreen(),
          },
        ),
      ),
    );
  }
}
