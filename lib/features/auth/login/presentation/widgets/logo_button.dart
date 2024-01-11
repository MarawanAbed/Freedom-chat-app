import 'package:flutter/material.dart';

class LogoButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final void Function()? onPressed;

  const LogoButton({
    super.key,
    required this.icon,
    required this.color, this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        icon,
        color: color,
      ),
    );
  }
}