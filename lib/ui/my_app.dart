import 'package:flutter/material.dart';
import 'package:database_scanner_app/constants/strings.dart';
import 'package:database_scanner_app/ui/home/home.dart';
import 'package:database_scanner_app/utils/routes/routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Strings.appName,
      home: const HomeScreen(),
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFFFFFFF),
      ),
      routes: Routes.routes,
    );
  }
}
