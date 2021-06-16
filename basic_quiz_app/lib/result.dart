import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function reserHandler;
  Result(this.resultScore, this.reserHandler);

  String get resultPhrase {
    var resultText = 'WOW! you did it';
    if (resultScore <= 5) {
      resultText = 'You are awsome and innocent!!';
    }
    //more conditions to be put up
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultPhrase,
            // resultScore,
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            onPressed: reserHandler,
            child: Text(
              'Restart quiz',
            ),
            textColor: Colors.blue,
          )
        ],
      ),
    );
  }
}
