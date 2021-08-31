import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:quiz_ui/constants.dart';
import 'package:quiz_ui/widgets//button_widget.dart';
import 'package:quiz_ui/models/quiz_model.dart';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:path/path.dart';
import 'package:quiz_ui/widgets/border_text_field.dart';
import 'package:quiz_ui/widgets/bottom_bar.dart';
import 'package:quiz_ui/widgets/user_menu_bar.dart';

class MakeQuiz extends StatefulWidget {
  @override
  _MakeQuizState createState() => _MakeQuizState();
}

class _MakeQuizState extends State<MakeQuiz> {
  List<Quiz> questions = [
    Quiz(question: "", answerA: "", answerB: "", answerC: "", answerD: "")
  ];
  String input = "";
  File file;
  TextEditingController _questionController = new TextEditingController();
  TextEditingController _answerAController = new TextEditingController();
  TextEditingController _answerBController = new TextEditingController();
  TextEditingController _answerCController = new TextEditingController();
  TextEditingController _answerDController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    final fileName = file != null ? basename(file.path) : 'No Document Selected';
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Constants.primaryColor,
          title: Text("Create Quiz"),

        ),
        bottomNavigationBar: BottomBar(),
        floatingActionButton: Container(
            child: FloatingActionButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text(
                      "Add question",
                      style: TextStyle(
                        fontSize: 21.0,
                        color: Constants.primaryTextColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    content: Container(
                        child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          Container(
                              height: 40,
                              margin: EdgeInsets.fromLTRB(168, 0, 0, 10),
                              child: Row(
                                children: [
                                  Container(
                                    child: FloatingActionButton(
                                      onPressed: () {},
                                      child: Icon(
                                        Icons.camera,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: FloatingActionButton(
                                      onPressed: () {},
                                      child: Icon(
                                        Icons.voice_chat,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                          Padding(
                            padding: const EdgeInsets.all(5),
                            child: TextField(
                              controller: _questionController,
                              decoration:
                                  InputDecoration(labelText: "Question"),
                            ),
                          ),
                          TextField(
                            controller: _answerAController,
                            decoration: InputDecoration(labelText: "Answer A"),
                          ),
                          TextField(
                            controller: _answerBController,
                            decoration: InputDecoration(labelText: "Answer B"),
                          ),
                          TextField(
                            controller: _answerCController,
                            decoration: InputDecoration(labelText: "Answer C"),
                          ),
                          TextField(
                            controller: _answerDController,
                            decoration: InputDecoration(labelText: "Answer D"),
                          )
                        ],
                      ),
                    )),
                    actions: <Widget>[
                      FlatButton(
                          onPressed: () {
                            setState(() {
                              questions.add(Quiz(
                                  question: _questionController.text,
                                  answerA: _answerAController.text,
                                  answerB: _answerBController.text,
                                  answerC: _answerCController.text,
                                  answerD: _answerDController.text));
                            });
                            Navigator.of(context).pop();
                          },
                          child: Text("Add"))
                    ],
                  );
                });
          },
          child: Icon(Icons.add),
          // label: Text("New question"),
        )),
        body: SingleChildScrollView(
          child: SafeArea(
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: 30.0,
                        ),
                        // UserMenuBar(),
                        SizedBox(height: 10),
                        SizedBox(
                          height: 50,
                          child: Text(
                            "Document",
                            style: TextStyle(
                              fontSize: 21.0,
                              color: Constants.primaryTextColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Container(
                            height: 40,
                            child: Row(children: [
                              Flexible(
                                  child: BorderTextField(
                                hintText: "Search...",
                              )),
                              SizedBox(width: 5),
                              Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color.fromRGBO(
                                              169, 176, 185, 0.42),
                                          spreadRadius: 0,
                                          blurRadius: 8,
                                          offset: Offset(0,
                                              2), // changes position of shadow
                                        ),
                                      ],
                                      borderRadius: BorderRadius.circular(8)),
                                  child: FlatButton(
                                    child: Text('Select File'),
                                    onPressed: selectFile,
                                  ))
                            ])),
                        SizedBox(height: 8),
                        Text(
                          fileName,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Container(
                          height: 30,
                          child: Text(
                            "Question",
                            style: TextStyle(
                              fontSize: 21.0,
                              color: Constants.primaryTextColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Container(
                          height: 500.0,
                          child: ListView.builder(
                              itemCount: questions.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Dismissible(
                                    key: Key(questions[index].question),
                                    child: Card(
                                      elevation: 4,
                                      margin: EdgeInsets.all(8),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child: ListTile(
                                        title: Text(
                                            "Question: ${questions[index].question}"),
                                        subtitle: Text(
                                            "Answer A: ${questions[index].answerA} \nAnswer B: ${questions[index].answerB} \nAnswer C: ${questions[index].answerC} \nAnswer D: ${questions[index].answerD} "),
                                        // Can not export data from list. RÊCHECK here.
                                        trailing: IconButton(
                                          icon: Icon(Icons.close,
                                              color: Colors.grey),
                                          color: Colors.grey,
                                          onPressed: () {
                                            setState(() {
                                              questions.removeAt(index);
                                            });
                                          },
                                        ),
                                      ),
                                    ));
                              }),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                            child: OutlineButton(
                          child: Text("Save quiz"),
                          onPressed: () {},
                        )),
                        SizedBox(
                          height: 30,
                        )
                      ]))),
        ));
  }

  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);
    if (result == null) return;
    final path = result.files.single.path;

    setState(() => file = File(path));
  }
}
