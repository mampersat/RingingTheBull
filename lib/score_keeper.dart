class ScoreKeeper {
  int score;
  int remaining;

  ScoreKeeper() {
    reset();
  }

  void reset() {
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
    return 'Score: ${score.toString()} , Remaining: ${remaining.toString()}';
  }
}
