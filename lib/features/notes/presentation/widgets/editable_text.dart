// ignore_for_file: library_private_types_in_public_api

import '../../notes.dart';

class EditableTextWidget extends StatefulWidget {
  final String initialTitle;
  final String initialDescription;

  const EditableTextWidget({
    Key? key,
    required this.initialTitle,
    required this.initialDescription,
  }) : super(key: key);

  @override
  _EditableTextWidgetState createState() => _EditableTextWidgetState();
}

class _EditableTextWidgetState extends State<EditableTextWidget> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  bool _isEditingTitle = false;
  bool _isEditingDescription = false;

  @override
  void initState() {
    super.initState();
    _titleController.text = widget.initialTitle;
    _descriptionController.text = widget.initialDescription;
  }

  void _handleTapOutside() {
    setState(() {
      _isEditingTitle = false;
      _isEditingDescription = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTapOutside,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                _isEditingTitle = true;
              });
            },
            child: _isEditingTitle
                ? Expanded(
                    child: TextField(
                      controller: _titleController,
                      maxLines: null,
                      style: GoogleFonts.poppins(
                        fontSize: 30,
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                      ),
                    ),
                  )
                : Expanded(
                    child: Text(
                      _titleController.text,
                      style: GoogleFonts.poppins(
                        fontSize: 30,
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                      ),
                    ),
                  ),
          ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              setState(() {
                _isEditingDescription = true;
              });
            },
            child: _isEditingDescription
                ? Expanded(
                    child: TextField(
                      controller: _descriptionController,
                      maxLines: null,
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.black54,
                      ),
                    ),
                  )
                : Expanded(
                    child: Text(
                      _descriptionController.text,
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.black54,
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}

// Usage example:
// EditableTextWidget(
//   initialTitle: "Initial Title",
//   initialDescription: "Initial Description",
// )
