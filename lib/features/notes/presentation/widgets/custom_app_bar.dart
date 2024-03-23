// Custom App Bar Widget
// ignore_for_file: library_private_types_in_public_api, unnecessary_null_comparison, sort_child_properties_last, non_constant_identifier_names, no_logic_in_create_state

import 'package:flutter/material.dart';
import '../../../../shared/shared.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  Color? bgColors;
  final VoidCallback onProfilePressed;
  final VoidCallback onAddPressed;
  final Widget leftData;
  final Widget centerwidget;

  final Widget RightData;

  CustomAppBar({
    Key? key,
    required this.onProfilePressed,
    required this.onAddPressed,
    required this.leftData,
    this.bgColors,
    required this.RightData,
    required this.centerwidget,
  }) : super(key: key);

  @override
  _CustomAppBarState createState() => _CustomAppBarState(
        bgColor: bgColors,
      );

  @override
  Size get preferredSize => const Size.fromHeight(70);
}

class _CustomAppBarState extends State<CustomAppBar>
    with SingleTickerProviderStateMixin {
  // Animation Variables
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  final Color? bgColor;

  _CustomAppBarState({
    required this.bgColor,
  });

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
    );

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.1,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    if (widget.onProfilePressed != null) {
      _animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    // App Bar Implementation
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: AppBar(
        toolbarHeight: 80,
        backgroundColor: bgColor,
        elevation: 0,
        leading: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ScaleTransition(
              scale: _scaleAnimation,
              child: GestureDetector(
                child: widget.leftData,
                onTap: widget.onProfilePressed,
              ),
            ),
          ],
        ),
        title: widget.centerwidget,
        actions: [
          ScaleTransition(
            scale: _scaleAnimation,
            child: GestureDetector(
              onTap: widget.onAddPressed,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  widget.RightData,
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
