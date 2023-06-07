import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final VoidCallback onClicked;
  final IconData? icon;

  const ButtonWidget({
    Key? key,
    required this.onClicked,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => IconButton(
        style: IconButton.styleFrom(
          minimumSize: Size.fromHeight(50),
        ),
        icon: Icon(icon),
        iconSize: 72,
        onPressed: onClicked,
      );
}
