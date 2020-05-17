import 'package:timeago/timeago.dart' as timeago;

class ScoreKeeper {
  int score;
  int remaining;
  List<Round> history = [];

  ScoreKeeper() {
    reset();
  }

  void reset() {
    if (score != null) history.add(Round(score: score));

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

  Round({this.score}) {
    time = DateTime.now();
  }

  timeAgoString() {
    return timeago.format(time);
  }
}
