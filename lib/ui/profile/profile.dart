import 'package:flutter/material.dart';
import 'package:database_scanner_app/widgets/appbar_widget.dart';
import 'package:database_scanner_app/widgets/bottomnavbar_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MyAppBar(title: "Profile page"),
      bottomNavigationBar: MyBottomNavBar(),
    );
  }
}
