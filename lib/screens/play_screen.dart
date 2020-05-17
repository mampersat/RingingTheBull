import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:ringingthebull/score_keeper.dart';

class PlayScreen extends StatefulWidget {
  @override
  _PlayScreenState createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  ScoreKeeper score = ScoreKeeper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ringing the Bull'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                score.currentState(),
                style: TextStyle(fontSize: 20.0),
              ),
              FlatButton(
                onPressed: () {
                  setState(() {
                    score.reset();
                  });
                },
                child: Text('Reset'),
              )
            ],
          ),
          Expanded(
            child: FlatButton(
              color: Colors.green,
              onPressed: () {
                setState(() {
                  score.hook();
                });
              },
              child: Text(
                'Hook',
                style: kBigButtonTextStyle,
              ),
            ),
          ),
          Expanded(
              child: FlatButton(
            color: Colors.red,
            onPressed: () {
              setState(() {
                score.miss();
              });
            },
            child: Text(
              'Miss',
              style: kBigButtonTextStyle,
            ),
          ))
        ],
      ),
    );
  }
}
