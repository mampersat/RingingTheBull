import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:ringingthebull/components/big_button.dart';
import 'package:ringingthebull/screens/scores_screen.dart';
import 'constants.dart';
import 'package:ringingthebull/score_keeper.dart';

class PlayScreen extends StatefulWidget {
  @override
  _PlayScreenState createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> with TickerProviderStateMixin {
  ScoreKeeper score = ScoreKeeper();

  AnimationController controllerHook;
  AnimationController controllerMiss;
  @override
  void initState() {
    super.initState();

    controllerHook =
        AnimationController(duration: Duration(milliseconds: 200), vsync: this);
    controllerMiss =
        AnimationController(duration: Duration(milliseconds: 200), vsync: this);

    controllerHook.addListener(() {
      setState(() {});
    });

    controllerHook.addStatusListener((status) {
      if (status == AnimationStatus.completed) controllerHook.reverse();
    });

    controllerMiss.addListener(() {
      setState(() {});
    });

    controllerMiss.addStatusListener((status) {
      if (status == AnimationStatus.completed) controllerMiss.reverse();
    });
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
          BigButton(
            text: 'Hook',
            color: Colors.green,
            animationValue: controllerHook.value,
            onPressed: () {
              setState(() {
                controllerHook.forward();
                score.hook();
                if (score.turnOver()) turnOver();
              });
            },
          ),
          SizedBox(height: 20.0),
          BigButton(
              text: 'Miss',
              color: Colors.red,
              animationValue: controllerMiss.value,
              onPressed: () {
                setState(() {
                  controllerMiss.forward();
                  score.miss();
                  if (score.turnOver()) turnOver();
                });
              }),
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
