import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:ringingthebull/screens/scores_screen.dart';
import 'constants.dart';
import 'package:ringingthebull/score_keeper.dart';

class PlayScreen extends StatefulWidget {
  @override
  _PlayScreenState createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  ScoreKeeper score = ScoreKeeper();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
                child: Text('Reset'),
                onPressed: () {
                  setState(() {
                    turnOver();
                  });
                },
              ),
              FlatButton(
                child: Text('Scores'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return ScoresScreen(score: score);
                      },
                    ),
                  );
                },
              )
            ],
          ),
          Expanded(
            child: FlatButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
              ),
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
          SizedBox(height: 20.0),
          Expanded(
              child: FlatButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
            ),
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
}
