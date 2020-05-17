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

  // TODO: Pass in the main scorekeeper object
  final ScoreKeeper score;

  @override
  Widget build(BuildContext context) {
    print(score.history);
    return Scaffold(
      appBar: AppBar(
        title: Text('Score History'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          for (var round in score.history.reversed)
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text('${round.score}'),
                SizedBox(width: 10.0),
                Text('${round.timeAgoString()}'),
              ],
            )
        ],
      ),
    );
  }
}
