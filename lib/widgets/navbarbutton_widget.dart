import 'package:flutter/material.dart';

class MyNavBarButton extends StatelessWidget {
  final Icon icon;
  final VoidCallback onPressed;
  const MyNavBarButton({required this.icon, required this.onPressed, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: icon,
    );
  }
}
