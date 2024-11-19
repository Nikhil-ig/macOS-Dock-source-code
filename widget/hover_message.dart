import 'package:flutter/material.dart';
import '../core/icons_data.dart';

class HoverMessage extends StatelessWidget {
  const HoverMessage({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
      decoration: BoxDecoration(
          color: Colors.black54, //.shade800,
          borderRadius: const BorderRadius.all(Radius.circular(6)),
          border: Border.all(color: Colors.grey.shade600)),
      child: Text(
        MacIcons.iconsList[index].title!,
        style: const TextStyle(color: Color(0xFFE1E0E0), fontSize: 12),
      ),
    );
  }
}
