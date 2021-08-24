class Question {
  final int id, answer;
  final String question;
  final List<String> options;

  Question({this.id, this.question, this.answer, this.options});
}

const List sample_data = [
  {
    "id": 1,
    "question":
        "Who are you ______?",
    "options": ['Nam', 'Lam', 'Xam', 'Mam'],
    "answer_index": 1,
  },
  {
    "id": 2,
    "question": "What are you doing now?",
    "options": ['Do nothing', 'Do quiz', 'Sing a song?', 'Skateboard in bathroom'],
    "answer_index": 2,
  },
  {
    "id": 3,
    "question": "Who is created these stupid question?",
    "options": ['Nam', 'Konons', 'Noem', 'Coc'],
    "answer_index": 2,
  },
  {
    "id": 4,
    "question": "What is Dart? ",
    "options": ['Programming language', 'Grief', 'Depresses', "God's "],
    "answer_index": 2,
  },
];
