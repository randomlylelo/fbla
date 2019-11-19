import 'package:flutter/material.dart';

// Q & A

// Using Expansion Tile Class for Q&A.
// TODO: since expansion tile is depresciated replace with Expansion Panel
// Link to a Stackoverflow: https://stackoverflow.com/questions/45559580/expansion-panel-list-in-flutter

class Question extends StatefulWidget {
  final String title;

  Question(this.title);

  @override
  _QuestionState createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  Container questions(String q, String a) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white60,
      ),
      child: ExpansionTile(
        title: Text(q),
        children: <Widget>[
          Text(a),
          Text(''),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(32.0),
            child: Center(
              child: Column(
                children: <Widget>[
                  questions('QUESTION', 'ANSWER'),
                  Divider(),
                  questions('QUESTION', 'ANSWER'),
                  Divider(),
                  questions('QUESTION', 'ANSWER'),
                  Divider(),
                  questions('QUESTION', 'ANSWER'),
                  Divider(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
