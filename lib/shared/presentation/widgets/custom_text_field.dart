import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class custom_text_field extends StatelessWidget {
  final String label;
  final int? maxLines;
  final TextInputType? inputType;
  const custom_text_field({
    super.key,
    required this.titleController,
    required this.label,
    required this.maxLines,
    this.inputType,
  });

  final TextEditingController titleController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8.0,
      ),
      child: TextField(
        controller: titleController,
        maxLines: maxLines,
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.w400,
          color: Colors.black54,
        ),
        keyboardType: inputType,
        decoration: InputDecoration(
          constraints: const BoxConstraints(maxHeight: 55),
          counterStyle: const TextStyle(color: Colors.black54),
          filled: true,
          fillColor: Colors.white,
          labelText: label,
          focusColor: Colors.black54,
          labelStyle: GoogleFonts.poppins(
              fontSize: 13, fontWeight: FontWeight.w400, color: Colors.black54),
        ),
      ),
    );
  }
}
