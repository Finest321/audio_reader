import 'package:flutter/material.dart';

class ChapterScreen extends StatelessWidget {
  final String chapterContent;

  ChapterScreen({required this.chapterContent});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Life Changer'),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios, // Use the arrow back iOS icon
            color: Colors.white, // Set the icon color
          ),
          onPressed: () {
            // Handle back button press here
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            chapterContent,
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
