// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

import '../../notes.dart';

class NoteDetailPage extends StatefulWidget {
  final Note note;

  const NoteDetailPage({Key? key, required this.note}) : super(key: key);

  @override
  _NoteDetailPageState createState() => _NoteDetailPageState();
}

class _NoteDetailPageState extends State<NoteDetailPage> {
  final stt.SpeechToText _speech = stt.SpeechToText();
  String voiceInput = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        bgColors: Colors.white,
        onProfilePressed: () {
          // Handle profile icon click
        },
        onAddPressed: () {},
        leftData: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            CupertinoIcons.back,
            color: Colors.black,
            size: 20,
          ),
        ),
        RightData: Padding(
          padding: const EdgeInsets.only(
            right: 8.0,
          ),
          child: Text(
            'delete',
            style: GoogleFonts.poppins(
              fontSize: 13,
              fontWeight: FontWeight.w300,
              color: Colors.black,
            ),
          ),
        ),
        centerwidget: Container(),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const LineBreak(color: Colors.black),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '18/11/24',
                  style: GoogleFonts.poppins(
                    color: Colors.black54,
                    fontSize: 13,
                  ),
                ),
                Text(
                  '#${widget.note.category}',
                  style: GoogleFonts.poppins(
                    color: Colors.black54,
                    fontSize: 13,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 45),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.7,
              child: Column(
                children: [
                  EditableTextWidget(
                    initialTitle: widget.note.title,
                    initialDescription: widget.note.description,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _startListening();
                    },
                    child: Text('Start Voice Input'),
                  ),
                  Text(
                      'Voice Input: $voiceInput'), // Display real-time voice input
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),

          // Speech to text feature
        ],
      ),
    );
  }

  void _startListening() async {
    bool available = await _speech.initialize(
      onStatus: (status) {
        print('Speech recognition status: $status');
      },
      onError: (errorNotification) {
        print('Speech recognition error: $errorNotification');
      },
    );

    if (available) {
      _speech.listen(
        onResult: (result) {
          setState(() {
            voiceInput = result.recognizedWords ?? '';
          });
        },
        listenFor: Duration(minutes: 5), // Set duration to 5 minutes
      );
    } else {
      print('Speech recognition not available');
    }
  }
}
