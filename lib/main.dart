import 'package:course_app_one/quiz.dart';
import 'package:course_app_one/result.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(AppOne());
}

class AppOne extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AppOneState();
  }
}

class _AppOneState extends State<AppOne> {
  var _questionIndex = 0;
  var _totalScore = 0;
  final _questions = const [
    {
      'question': 'What\'s your fav color?',
      'answers': [
        {'text': 'black', 'score': 5},
        {'text': 'red', 'score': 4},
        {'text': 'green', 'score': 2},
        {'text': 'white', 'score': 1}
      ]
    },
    {
      'question': 'What\'s your fav name?',
      'answers': [
        {'text': 'Frank', 'score': 5},
        {'text': 'Steve', 'score': 4},
        {'text': 'Sigrid', 'score': 2},
        {'text': 'Kevin', 'score': 2}
      ]
    },
    {
      'question': 'What\'s your fav cheese?',
      'answers': [
        {'text': 'Swiss', 'score': 5},
        {'text': 'Cheddar', 'score': 4},
        {'text': 'Gouda', 'score': 2},
        {'text': 'Parmesan', 'score': 0}
      ]
    },
  ];

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    setState(() {
      _questionIndex = _questionIndex + 1;
      _totalScore += score;
    });
    print('Answer Chosen' + _questionIndex.toString());
  }

  @override
  Widget build(BuildContext context) {
    print(_questionIndex.toString());

    if (_questionIndex > _questions.length) _questionIndex = 0;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('App One'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questions: _questions,
                questionIndex: _questionIndex)
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
