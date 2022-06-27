import 'package:database_scanner_app/ui/add.dart';
import 'package:database_scanner_app/ui/profile/profile.dart';
import 'package:database_scanner_app/widgets/appbar_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const List<Widget> _pages = <Widget>[
    ProfileScreen(),
    AddScreen(),
  ];
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(title: "Home"),
      body: _pages.elementAt(
        _selectedIndex,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedIconTheme: const IconThemeData(
          color: Colors.amberAccent,
          size: 40,
        ),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.list_rounded,
            ),
            label: "Lists",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add,
            ),
            label: "Add",
          ),
        ],
      ),
    );
  }
}
