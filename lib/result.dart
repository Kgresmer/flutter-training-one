import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int totalScore;
  final Function reset;

  Result(this.totalScore, this.reset);

  String get resultPhrase {
    String resultText;
    if (totalScore >= 12) {
      resultText = 'twelve';
    } else if (totalScore >= 8) {
      resultText = 'eight';
    } else {
      resultText = 'Less than';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          children: [
            Text(
              resultPhrase,
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            FlatButton(onPressed: reset, child: Text('Restart'), color: Colors.amber)
          ],
        ),
    );
  }
}
