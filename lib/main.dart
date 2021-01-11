import 'package:course_app_one/answer.dart';
import 'package:course_app_one/question.dart';
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

  void answerQuestion() {
    setState(() {
      if (_questionIndex == 2) {
        _questionIndex = 0;
      } else {
        _questionIndex = _questionIndex + 1;
      }
    });
    print('Answer Chosen' + _questionIndex.toString());
  }

  @override
  Widget build(BuildContext context) {
    print(_questionIndex.toString());
    var questions = [
      {'question': 'What\'s your fav color?', 'answers': [
        'black', 'red', 'green', 'white'
      ]},
      {'question': 'What\'s your fav name?', 'answers': [
        'Frank', 'Steve', 'Sigrid', 'Kevin'
      ]},
      {'question': 'What\'s your fav cheese?', 'answers': [
        'Swiss', 'Cheddar', 'Gouda', 'Parmesan'
      ]},
    ];
    if (_questionIndex > questions.length) _questionIndex = 0;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('App One'),
        ),
        body: Column(
          children: [
            Question(questions[_questionIndex]['question']),
            ...(questions[_questionIndex]['answers'] as List<String>)
              .map((answer) {
              return Answer(answerQuestion, answer);
            }).toList()
          ],
        ),
      ),
    );
  }
}
