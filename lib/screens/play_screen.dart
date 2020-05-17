import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'constants.dart';
import 'package:ringingthebull/score_keeper.dart';

class PlayScreen extends StatefulWidget {
  @override
  _PlayScreenState createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  ScoreKeeper score = ScoreKeeper();

  void turnOver() {
    Alert(
      context: context,
      title: 'Turn Over',
      desc: 'Score: ${score.score}',
      style: AlertStyle(
        backgroundColor: Colors.yellow,
      ),
      buttons: [
        DialogButton(
          child: Text(
            "OK",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          color: Colors.red,
          width: 120,
        )
      ],
    ).show();
    score.reset();
  }

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
                    //turnOver();
                    turnOver();
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
                  if (score.turnOver()) turnOver();
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
                if (score.turnOver()) turnOver();
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
