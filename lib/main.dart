// Import Statements
import 'package:beyou/features/notes/notes.dart';

import 'features/notes/presentation/pages/home_page.dart';

// Main Function
void main() {
  runApp(const MyApp());
}

// Main App Class
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // App Initialization

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      // home: NoteDetailPage(
      //   note: Note(
      //       title: 'Account Info',
      //       description: 'email: sample@info.com\npass:newacc1290',
      //       category: 'personal',
      //       noteNumber: 1),
      // ));

      home: MyHomePage(),
    );
  }
}










////////////////////////////////////////////////////////!           !! TRASH CODE !!!     !////////////////////////////////////////////////////

















// // ignore_for_file: library_private_types_in_public_api

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// import 'widgets/custom_text_field.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Notes App',
//       theme: ThemeData(
//         primarySwatch: Colors.deepOrange,
//       ),
//       home: const MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key});

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   List<Note> notes = [];
//   int selectedFilterIndex = 0;
//   List<String> filterItems = [];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: CustomAppBar(
//         onProfilePressed: () {
//           // Handle profile icon click
//         },
//         onAddPressed: () {
//           _showAddNoteDialog(context);
//         },
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const LineBreak(color: Colors.white),
//           YourNotes(notes: '/${notes.length}'),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: FilterList(
//               filterItems: filterItems,
//               selectedFilterIndex: selectedFilterIndex,
//               onFilterSelected: (index) {
//                 setState(() {
//                   selectedFilterIndex = index;
//                 });
//               },
//             ),
//           ),
//           const SizedBox(height: 20),
//           Expanded(
//             child: ListView.builder(
//               physics: const BouncingScrollPhysics(),
//               itemCount: notes.length,
//               itemBuilder: (context, index) {
//                 return NotePreviewWidget(
//                   note: notes[index],
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) =>
//                             NoteDetailPage(note: notes[index]),
//                       ),
//                     );
//                   },
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Future<void> _showAddNoteDialog(BuildContext context) async {
//     TextEditingController titleController = TextEditingController();
//     TextEditingController descriptionController = TextEditingController();
//     TextEditingController categoryController = TextEditingController();
//     TextEditingController noteNumberController = TextEditingController();
//     DateTime selectedDate = DateTime.now();
//     TimeOfDay selectedTime = TimeOfDay.now();

//     await showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           scrollable: true,
//           backgroundColor: Colors.black,
//           titleTextStyle: GoogleFonts.poppins(
//               fontWeight: FontWeight.w400,
//               fontSize: 25,
//               color: Theme.of(context).primaryColor),
//           title: const Text('Add Note'),
//           content: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               //! title
//               custom_text_field(
//                 titleController: titleController,
//                 label: 'Title',
//                 maxLines: 1,
//               ),
//               //!description
//               custom_text_field(
//                 titleController: descriptionController,
//                 label: 'Description',
//                 maxLines: null,
//               ),
//               custom_text_field(
//                 titleController: categoryController,
//                 label: 'Category',
//                 maxLines: 1,
//               ),

//               custom_text_field(
//                 titleController: noteNumberController,
//                 label: 'Sr.No',
//                 maxLines: 1,
//               ),
//             ],
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               child: Text(
//                 'Cancel',
//                 style: GoogleFonts.poppins(
//                   fontWeight: FontWeight.w200,
//                   color: Colors.white70,
//                 ),
//               ),
//             ),
//             TextButton(
//               onPressed: () {
//                 String title = titleController.text;
//                 String description = descriptionController.text;
//                 String category = categoryController.text;
//                 int noteNumber = int.tryParse(noteNumberController.text) ?? 0;

//                 Note newNote = Note(
//                   title: title,
//                   description: description,
//                   category: category,
//                   noteNumber: noteNumber,
//                   date: selectedDate,
//                   time: selectedTime,
//                 );

//                 setState(() {
//                   notes.add(newNote);
//                   if (!filterItems.contains(category)) {
//                     filterItems.add(category);
//                   }
//                 });

//                 Navigator.pop(context);
//               },
//               child: Text(
//                 'Add',
//                 style: GoogleFonts.poppins(
//                   fontWeight: FontWeight.w200,
//                 ),
//               ),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }

// class LineBreak extends StatelessWidget {
//   final Color color;
//   const LineBreak({super.key, required this.color});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 40.0),
//       child: Container(
//         width: double.infinity,
//         height: 1,
//         color: color,
//       ),
//     );
//   }
// }

// class YourNotes extends StatelessWidget {
//   final String notes;

//   const YourNotes({super.key, required this.notes});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Padding(
//           padding: const EdgeInsets.symmetric(vertical: 45.0),
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.end,
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               RichText(
//                 text: TextSpan(
//                   children: [
//                     TextSpan(
//                       text: '\t\tyour',
//                       style: GoogleFonts.raleway(
//                         fontSize: 60.0,
//                         fontWeight: FontWeight.w300,
//                         color: Colors.white,
//                       ),
//                     ),
//                     const WidgetSpan(
//                       child: SizedBox(width: 8.0),
//                     ),
//                     TextSpan(
//                       text: '\n\t\t\t\tnotes',
//                       style: GoogleFonts.raleway(
//                         fontSize: 60.0,
//                         fontWeight: FontWeight.w300,
//                         color: Colors.white,
//                       ),
//                     ),
//                     const WidgetSpan(
//                       child: SizedBox(width: 70.0),
//                     ),
//                     TextSpan(
//                       text: notes,
//                       style: GoogleFonts.poppins(
//                         fontSize: 45.0,
//                         fontWeight: FontWeight.w200,
//                         color: Colors.white70,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         )
//       ],
//     );
//   }
// }

// class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
//   final VoidCallback onProfilePressed;
//   final VoidCallback onAddPressed;

//   const CustomAppBar({
//     Key? key,
//     required this.onProfilePressed,
//     required this.onAddPressed,
//   }) : super(key: key);

//   @override
//   _CustomAppBarState createState() => _CustomAppBarState();

//   @override
//   Size get preferredSize => const Size.fromHeight(70);
// }

// class _CustomAppBarState extends State<CustomAppBar>
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
//       end: 1.1,
//     ).animate(CurvedAnimation(
//       parent: _animationController,
//       curve: Curves.easeInOut,
//     ));

//     if (widget.onProfilePressed != null) {
//       _animationController.forward();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       toolbarHeight: 85,
//       backgroundColor: Colors.black,
//       elevation: 0,
//       leading: Row(
//         children: [
//           ScaleTransition(
//             scale: _scaleAnimation,
//             child: IconButton(
//               icon: const Icon(
//                 Icons.account_circle,
//                 size: 40,
//               ),
//               onPressed: widget.onProfilePressed,
//             ),
//           ),
//         ],
//       ),
//       title: ScaleTransition(
//         scale: _scaleAnimation,
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               "Morning,",
//               style: GoogleFonts.raleway(
//                 fontSize: 16,
//                 fontWeight: FontWeight.w400,
//               ),
//             ),
//             Text(
//               " James",
//               style: GoogleFonts.raleway(
//                 fontSize: 16,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ],
//         ),
//       ),
//       actions: [
//         ScaleTransition(
//           scale: _scaleAnimation,
//           child: GestureDetector(
//             onTap: widget.onAddPressed,
//             child: const Padding(
//               padding: EdgeInsets.all(8.0),
//               child: Icon(Icons.add),
//             ),
//           ),
//         )
//       ],
//     );
//   }

//   @override
//   void dispose() {
//     _animationController.dispose();
//     super.dispose();
//   }
// }

// class Note {
//   final String title;
//   final String description;
//   final String category;
//   final int noteNumber;
//   final DateTime date;
//   final TimeOfDay time;

//   Note({
//     required this.title,
//     required this.description,
//     required this.category,
//     required this.noteNumber,
//     required this.date,
//     required this.time,
//   });
// }

// class NotePreviewWidget extends StatefulWidget {
//   final Note note;
//   final VoidCallback onTap;

//   const NotePreviewWidget({Key? key, required this.note, required this.onTap})
//       : super(key: key);

//   @override
//   _NotePreviewWidgetState createState() => _NotePreviewWidgetState();
// }

// class _NotePreviewWidgetState extends State<NotePreviewWidget>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _animationController;
//   late Animation<double> _scaleAnimation;

//   @override
//   void initState() {
//     super.initState();

//     _animationController = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 300),
//     );

//     _scaleAnimation = Tween<double>(
//       begin: 1.0,
//       end: 1.1,
//     ).animate(CurvedAnimation(
//       parent: _animationController,
//       curve: Curves.easeInOut,
//     ));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         _animationController.forward();
//         widget.onTap();
//       },
//       child: ScaleTransition(
//         scale: _scaleAnimation,
//         child: Padding(
//           padding: const EdgeInsets.symmetric(vertical: 8.0),
//           child: Column(
//             children: [
//               const LineBreak(color: Colors.white),
//               Padding(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 35.0, vertical: 12),
//                 child: Padding(
//                   padding: const EdgeInsets.all(12.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             '${widget.note.noteNumber}/',
//                             style: GoogleFonts.poppins(
//                               fontSize: 15.0,
//                               fontWeight: FontWeight.w400,
//                               color: Colors.white,
//                             ),
//                           ),
//                           Column(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 '${widget.note.title}',
//                                 style: GoogleFonts.poppins(
//                                   fontSize: 18.0,
//                                   fontWeight: FontWeight.w400,
//                                   color: Colors.white,
//                                 ),
//                               ),
//                               const SizedBox(height: 4.0),
//                               Text(
//                                 widget.note.description,
//                                 style: GoogleFonts.poppins(
//                                   fontSize: 10.0,
//                                   color: Colors.white70,
//                                 ),
//                               ),
//                             ],
//                           ),
//                           const Icon(
//                             CupertinoIcons.arrow_up_right,
//                             size: 20,
//                             color: Colors.white,
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
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

// class NoteDetailPage extends StatelessWidget {
//   final Note note;

//   const NoteDetailPage({Key? key, required this.note}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Note Detail'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text('Title: ${note.title}'),
//             const SizedBox(height: 20),
//             Text('Description: ${note.description}'),
//             const SizedBox(height: 20),
//             Text('Category: ${note.category}'),
//             const SizedBox(height: 20),
//             Text('Note Number: ${note.noteNumber}'),
//             const SizedBox(height: 20),
//             Text('Date: ${note.date.toLocal()}'),
//             const SizedBox(height: 20),
//             Text('Time: ${note.time.format(context)}'),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class FilterList extends StatelessWidget {
//   final List<String> filterItems;
//   final int selectedFilterIndex;
//   final Function(int) onFilterSelected;

//   const FilterList({
//     Key? key,
//     required this.filterItems,
//     required this.selectedFilterIndex,
//     required this.onFilterSelected,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       scrollDirection: Axis.horizontal,
//       child: Row(
//         children: List.generate(
//           filterItems.length,
//           (index) => GestureDetector(
//             onTap: () {
//               onFilterSelected(index);
//             },
//             child: FilterWidget(
//               filterText: filterItems[index],
//               isSelected: index == selectedFilterIndex,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

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
//               color: widget.isSelected ? Colors.white : Colors.black,
//             ),
//           ),
//           backgroundColor:
//               widget.isSelected ? Colors.blue : Colors.grey.shade300,
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
