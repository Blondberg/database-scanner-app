import 'package:database_scanner_app/ui/add.dart';
import 'package:database_scanner_app/ui/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:database_scanner_app/ui/home/home.dart';

class Routes {
  Routes._();

  static const String home = '/home';
  static const String scan = '/scan';
  static const String profile = '/profile';
  static const String add = '/add';

  static final routes = <String, WidgetBuilder>{
    home: (BuildContext context) => const HomeScreen(),
    profile: (BuildContext context) => const ProfileScreen(),
    add: (BuildContext context) => const AddScreen()
  };
}
