import 'package:flutter/material.dart';

class AppIcon extends StatelessWidget {
  final String icon;
  final bool size;
  const AppIcon({super.key, required this.icon, this.size = true});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      icon,
      height: size ? 60 : null,
      width: size ? 60 : null,
    );
  }
}
