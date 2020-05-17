import 'package:flutter/material.dart';
import 'constants.dart';

class PlayScreen extends StatefulWidget {
  @override
  _PlayScreenState createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  int remaining = 21;
  int score = 0;

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
                'Points: $score , Remaining $remaining',
                style: TextStyle(fontSize: 20.0),
              ),
              FlatButton(
                onPressed: () {
                  setState(() {
                    remaining = 21;
                    score = 0;
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
                  remaining--;
                  score++;
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
                remaining--;
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
