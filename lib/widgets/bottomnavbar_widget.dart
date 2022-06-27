import 'package:database_scanner_app/ui/add.dart';
import 'package:database_scanner_app/ui/home/home.dart';
import 'package:flutter/material.dart';
import 'package:database_scanner_app/widgets/navbarbutton_widget.dart';
import 'package:database_scanner_app/utils/routes/routes.dart';

class MyBottomNavBar extends StatefulWidget {
  const MyBottomNavBar({Key? key}) : super(key: key);

  @override
  State<MyBottomNavBar> createState() => _MyBottomNavBarState();
}

class _MyBottomNavBarState extends State<MyBottomNavBar> {
  static const List<Widget> _pages = <Widget>[
    HomeScreen(),
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
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.list_rounded),
          label: "Lists",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add),
          label: "Add",
        ),
      ],
    );
    // return Row(
    //   children: [
    //     const Expanded(child: Icon(Icons.list_rounded)),
    //     Expanded(
    //       child: MyNavBarButton(
    //           icon: const Icon(Icons.add),
    //           onPressed: () {
    //             const newRouteName = Routes.add;
    //             bool isNewRouteSameAsCurrent = false;

    //             Navigator.popUntil(context, (route) {
    //               if (route.settings.name == newRouteName) {
    //                 isNewRouteSameAsCurrent = true;
    //               }
    //               return true;
    //             });

    //             if (!isNewRouteSameAsCurrent) {
    //               Navigator.pushNamed(context, newRouteName);
    //             }
    //           }),
    //     ),
    //     const Expanded(child: Icon(Icons.person)),
    //   ],
    // );
  }
}
