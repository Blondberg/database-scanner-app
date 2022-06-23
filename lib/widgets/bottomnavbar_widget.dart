import 'package:flutter/material.dart';
import 'package:database_scanner_app/widgets/navbarbutton_widget.dart';
import 'package:database_scanner_app/utils/routes/routes.dart';

class MyBottomNavBar extends StatelessWidget {
  const MyBottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
      ),
      child: Row(
        children: [
          const Expanded(child: Icon(Icons.list_rounded)),
          Expanded(
            child: MyNavBarButton(
              icon: const Icon(Icons.add),
              onPressed: () => Navigator.of(context).pushNamed(Routes.profile),
            ),
          ),
          const Expanded(child: Icon(Icons.person)),
        ],
      ),
    );
  }
}
