import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  var _questions = [
    {
      'questionText': 'What is your favourite colour?',
      'answers': [
        {'text': 'Black', 'score': 1},
        {'text': 'red', 'score': 2},
        {'text': 'green', 'score': 3},
        {'text': 'white', 'score': 4}
      ],
    },
    {
      'questionText': 'What is your favourite animal?',
      'answers': [
        {'text': 'tiger', 'score': 1},
        {'text': 'lion', 'score': 2},
        {'text': 'snake', 'score': 3},
        {'text': 'kangaroo', 'score': 4}
      ],
    },
    {
      'questionText': 'What is your favourite food?',
      'answers': [
        {'text': 'Noodles', 'score': 1},
        {'text': 'Bread', 'score': 2},
        {'text': 'Milk', 'score': 3},
        {'text': 'Eggs', 'score': 4}
      ],
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;
    if (_questionIndex < _questions.length)
      setState(() {
        _questionIndex = _questionIndex + 1;
      });
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('The question is:'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
