import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:quiz_ui/widgets/button_widget.dart';

class MakeQuiz extends StatefulWidget {
  @override
  _MakeQuizState createState() => _MakeQuizState();
}

class _MakeQuizState extends State<MakeQuiz> {
  File file;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        centerTitle: true,

      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            ButtonWidget(
              text: 'Select File',
              icon: Icons.attach_file,
              onClicked: selectFile,
            ),
          ]),
        ),

      ),
    );
  }

  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: true);
    if (result == null) return;
    final path = result.files.single.path;
    
    setState(() => file = File(path));
  }
}
