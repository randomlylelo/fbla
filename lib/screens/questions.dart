import 'package:flutter/material.dart';

// Q & A

// Using Expansion Panel Class for Q&A.

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
      body: Container(
        padding: EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: <Widget>[
              questions('QUESTION', 'ANSWER'),
            ],
          ),
        ),
      ),
    );
  }
}
