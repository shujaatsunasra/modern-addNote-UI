import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../shared/shared.dart';
import '../../notes.dart';

// Note Preview Widget
class NotePreviewWidget extends StatefulWidget {
  final Note note;
  final VoidCallback onTap;

  const NotePreviewWidget({Key? key, required this.note, required this.onTap})
      : super(key: key);

  @override
  _NotePreviewWidgetState createState() => _NotePreviewWidgetState();
}

class _NotePreviewWidgetState extends State<NotePreviewWidget>
    with SingleTickerProviderStateMixin {
  // Animation Variables
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.1,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  Widget build(BuildContext context) {
    // Note Preview Implementation
    return GestureDetector(
      onTap: () {
        _animationController.forward();
        widget.onTap();
      },
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Column(
            children: [
              const LineBreak(color: Colors.white),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 35.0, vertical: 12),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${widget.note.noteNumber}/',
                            style: GoogleFonts.poppins(
                              fontSize: 15.0,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${widget.note.title}',
                                style: GoogleFonts.poppins(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 4.0),
                              Text(
                                widget.note.description,
                                style: GoogleFonts.poppins(
                                  fontSize: 10.0,
                                  color: Colors.white70,
                                ),
                              ),
                            ],
                          ),
                          const Icon(
                            CupertinoIcons.arrow_up_right,
                            size: 20,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
