// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../notes.dart';

// // Filter Widget
// class FilterWidget extends StatefulWidget {
//   final String filterText;
//   final bool isSelected;

//   const FilterWidget({
//     Key? key,
//     required this.filterText,
//     this.isSelected = false,
//   }) : super(key: key);

//   @override
//   _FilterWidgetState createState() => _FilterWidgetState();
// }

// class _FilterWidgetState extends State<FilterWidget>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _animationController;
//   late Animation<double> _scaleAnimation;

//   @override
//   void initState() {
//     super.initState();

//     _animationController = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 150),
//     );

//     _scaleAnimation = Tween<double>(
//       begin: 1.0,
//       end: 1.2,
//     ).animate(CurvedAnimation(
//       parent: _animationController,
//       curve: Curves.easeInOut,
//     ));

//     if (widget.isSelected) {
//       _animationController.forward();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 8.0),
//       child: ScaleTransition(
//         scale: _scaleAnimation,
//         child: Chip(
//           label: Text(
//             widget.filterText,
//             style: TextStyle(
//               color: widget.isSelected
//                   ? Colors.white
//                   : Colors.black, // Change text color
//             ),
//           ),
//           backgroundColor:
//               widget.isSelected ? Colors.deepOrange : Colors.transparent,
//           shape: widget.isSelected
//               ? RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(20.0),
//                 )
//               : RoundedRectangleBorder(
//                   side: const BorderSide(color: Colors.white),
//                   borderRadius: BorderRadius.circular(20.0),
//                 ),
//         ),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _animationController.dispose();
//     super.dispose();
//   }
// }

class FilterWidget extends StatelessWidget {
  final String filterText;
  final bool isSelected;

  const FilterWidget({
    Key? key,
    required this.filterText,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? Colors.deepOrange : Colors.transparent,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: isSelected ? Colors.deepOrange : Colors.white70,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Center(
            child: Text(
              '#$filterText',
              style: GoogleFonts.poppins(
                fontSize: 14.0,
                fontWeight: isSelected ? FontWeight.w500 : FontWeight.w400,
                color: isSelected ? Colors.white : Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
