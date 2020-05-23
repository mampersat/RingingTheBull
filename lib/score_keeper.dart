import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:shared_preferences/shared_preferences.dart';

class ScoreKeeper {
  int score;
  int remaining;
  List<Round> history = [];

  ScoreKeeper() {
    load();
    reset();
  }

  // load string list from shared preferences
  // and build new history list
  void load() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> list;
    list = prefs.getStringList('score');
    if (list != null) {
      history = [];
      for (String row in list) {
        DateTime time = DateTime.parse(row.split(',')[0]);
        int score = int.parse(row.split(',')[1]);
        history.add(Round(time: time, score: score));
      }
    }
  }

  // serialize the history list to a list of comma seperated strings
  // and write to shared preferences
  void save() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> list = [];
    for (Round round in history) {
      String saveString = "${round.time.toString()},${round.score}";
      list.add(saveString);
    }
    prefs.setStringList('score', list);
  }

  void reset() {
    if (score != null) {
      history.add(Round(score: score, time: DateTime.now()));
      save();
    }

    remaining = 21;
    score = 0;
  }

  void hook() {
    score++;
    remaining--;
  }

  void miss() {
    remaining--;
  }

  bool turnOver() => remaining == 0;

  String currentState() {
    return 'Score: ${score.toString()} , Left: ${remaining.toString()}';
  }
}

class Round {
  DateTime time;
  int score;

  Round({this.time, this.score});

  timeAgoString() {
    return timeago.format(time);
  }
}
