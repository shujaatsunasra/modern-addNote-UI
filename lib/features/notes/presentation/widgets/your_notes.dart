import '../../../../shared/shared.dart';
import '../../notes.dart';

// Your Notes Widget
class YourNotes extends StatelessWidget {
  final String notes;

  const YourNotes({super.key, required this.notes});

  @override
  Widget build(BuildContext context) {
    // Your Notes Implementation
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 45.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '\t\tyour',
                      style: GoogleFonts.raleway(
                        fontSize: 60.0,
                        fontWeight: FontWeight.w300,
                        color: Colors.white,
                      ),
                    ),
                    const WidgetSpan(
                      child: SizedBox(width: 8.0),
                    ),
                    TextSpan(
                      text: '\n\t\t\t\tnotes',
                      style: GoogleFonts.raleway(
                        fontSize: 60.0,
                        fontWeight: FontWeight.w300,
                        color: Colors.white,
                      ),
                    ),
                    const WidgetSpan(
                      child: SizedBox(width: 70.0),
                    ),
                    TextSpan(
                      text: notes,
                      style: GoogleFonts.poppins(
                        fontSize: 45.0,
                        fontWeight: FontWeight.w200,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
