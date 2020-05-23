import 'package:flutter/material.dart';
import 'package:ringingthebull/score_keeper.dart';

class ScoresScreen extends StatefulWidget {
  ScoresScreen({this.score});

  final ScoreKeeper score;

  @override
  _ScoresScreenState createState() => _ScoresScreenState(score);
}

class _ScoresScreenState extends State<ScoresScreen> {
  _ScoresScreenState(this.score);

  final ScoreKeeper score;

  List<Widget> roundWidgets() {
    List<Widget> ret = [];

    for (var round in score.history.reversed) {
      Widget card = Card(
        //color: Colors.lightBlueAccent,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
          child: Text(
            '${round.score} points -  ${round.timeAgoString()}',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
        ),
      );
      ret.add(card);
    }
    return ret;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Score History'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: roundWidgets(),
        ),
      ),
    );
  }
}

//<Widget>[
//for (var round in score.history.reversed)
//Row(
//mainAxisAlignment: MainAxisAlignment.start,
//children: <Widget>[
//Text('${round.score}'),
//SizedBox(width: 10.0),
//Text('${round.timeAgoString()}'),
//],
