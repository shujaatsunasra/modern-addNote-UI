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
          _showAddNoteDialog(context);
        },
        leftData: Icon(CupertinoIcons.person_fill),
        RightData: Icon(CupertinoIcons.add),
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
                  return const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      LineBreak(color: Colors.white70),
                      Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          "/Your are going empty add your notes !",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.white70),
                        ),
                      ),
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

  // Function to show the add note dialog
  Future<void> _showAddNoteDialog(BuildContext context) async {
    TextEditingController titleController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();
    TextEditingController categoryController = TextEditingController();
    TextEditingController noteNumberController = TextEditingController();
    DateTime selectedDate = DateTime.now();
    TimeOfDay selectedTime = TimeOfDay.now();

    await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => Scaffold(
                // Wrap with Scaffold
                appBar: AppBar(
                  title: Text('Add Note'),
                ),
                body: Column(
                  children: [
                    TextField(
                        controller: titleController,
                        decoration: InputDecoration(labelText: 'Title')),
                    TextField(
                        controller: descriptionController,
                        decoration: InputDecoration(labelText: 'Description')),
                    TextField(
                        controller: categoryController,
                        decoration: InputDecoration(labelText: 'Category')),
                    TextField(
                        controller: noteNumberController,
                        decoration: InputDecoration(labelText: 'Note Number')),
                    // Add widgets for date and time pickers
                    ElevatedButton(
                      onPressed: () {
                        String title = titleController.text;
                        String description = descriptionController.text;
                        String category = categoryController.text;
                        int noteNumber =
                            int.tryParse(noteNumberController.text) ?? 0;

                        Note newNote = Note(
                          title: title,
                          description: description,
                          category: category,
                          noteNumber: noteNumber,
                        );

                        setState(() {
                          notes.add(newNote);
                          if (!filterItems.contains(category)) {
                            filterItems.add(category);
                          }
                        });
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NoteDetailPage(note: newNote),
                          ),
                        );
                      },
                      child: Text('Save Note'),
                    ),
                  ],
                ),
              )),
    );
  }
}
