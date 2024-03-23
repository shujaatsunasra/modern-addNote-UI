import 'package:flutter/material.dart';
import '../../notes.dart';

// Line Break Widget
class LineBreak extends StatelessWidget {
  final Color color;
  final double padding;
  const LineBreak({super.key, required this.color, this.padding = 25});

  @override
  Widget build(BuildContext context) {
    // Line Break Implementation
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: Container(
        width: double.infinity,
        height: 1,
        color: color,
      ),
    );
  }
}
