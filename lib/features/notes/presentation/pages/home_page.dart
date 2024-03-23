// Home Page Class
import 'package:flutter/cupertino.dart';

import '../../../../shared/shared.dart';
import '../../notes.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  late final TextEditingController descriptionController;

  // State Variables
  List<Note> notes = [];
  int selectedFilterIndex = 0;
  List<String> filterItems = [];

  @override
  Widget build(BuildContext context) {
    // Main Scaffold
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: CustomAppBar(
        bgColors: Colors.black,
        onProfilePressed: () {
          // Handle profile icon click
        },
        onAddPressed: () {
          //?detailed page navigation to be
        },
        leftData: const Icon(CupertinoIcons.person_fill),
        RightData: const Icon(CupertinoIcons.add),
        centerwidget: ScaleTransition(
          scale: Tween<double>(
            begin: 1.0,
            end: 1.1,
          ).animate(CurvedAnimation(
            parent: AnimationController(
              vsync: this,
              duration: const Duration(milliseconds: 150),
            ),
            curve: Curves.easeInOut,
          )),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Morning,",
                style: GoogleFonts.raleway(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                " James",
                style: GoogleFonts.raleway(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const LineBreak(color: Colors.white),
          YourNotes(notes: '/${notes.length}'),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FilterList(
              filterItems: filterItems,
              selectedFilterIndex: selectedFilterIndex,
              onFilterSelected: (index) {
                setState(() {
                  selectedFilterIndex = index;
                });
              },
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: notes.isEmpty ? 1 : notes.length,
              itemBuilder: (context, index) {
                if (notes.isEmpty) {
                  // If the list is empty, display a funny message
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                          padding: EdgeInsets.all(16.0),
                          child: NotePreviewWidget(
                            note: Note(
                                title: 'Account Info',
                                description:
                                    'email: sample@info.com\npass:newacc1290',
                                category: 'personal',
                                noteNumber: 1),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => NoteDetailPage(
                                        note: Note(
                                            title: 'Account Info',
                                            description:
                                                'email: sample@info.com\npass:newacc1290',
                                            category: 'personal',
                                            noteNumber: 1)),
                                  ));
                            },
                          )),
                      LineBreak(
                        color: Colors.white70,
                      )
                    ],
                  );
                } else {
                  // If the list is not empty, display the NotePreviewWidget
                  return NotePreviewWidget(
                    note: notes[index],
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NoteDetailPage(
                            note: notes[index],
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
