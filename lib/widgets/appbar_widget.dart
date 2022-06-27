import 'package:database_scanner_app/constants/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const MyAppBar({required this.title, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Container(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Navigator.canPop(context)
                  ? TextButton(
                      child: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        size: 16,
                      ),
                      onPressed: () => Navigator.pop(context),
                    )
                  : Container(),
            ),
            Expanded(
              child: Text(
                textAlign: TextAlign.center,
                title.toUpperCase(),
                style: GoogleFonts.roboto(
                  textStyle: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1.5,
                  ),
                ),
              ),
            ),
            Expanded(
              child: const Icon(Icons.search, size: 16),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50.0);
}
