import 'package:flutter/material.dart';

import 'package:fbla/widgets/help.dart';
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
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
            child: Text(a),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          Help('A questions and answer page, the answers are hidden until you want to see it.', 'In order to use this page, you must press the question or press the button on the side of the question in order to open the question and see the answer.'),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(16.0),
            child: Center(
              child: Column(
                children: <Widget>[
                  questions('Why should I join FBLA?',
                      'FBLA suits your needs as a businessperson in practice. Whether it be entrepreneurial,finance related or something similar, you will be able to practice your formality, speech, and learn more about the necessities to become successful in your future.'),
                  Divider(),
                  questions('How can I join FBLA?', 'Students have the chance to join FBLA during the first two months of each school year. During this time, there will be forms passed out at the annual club fair. If you are not able to make it to this event, you may pass by the advisor\'s classroom to pick up your form.'),
                  Divider(),
                  questions('What do I do in FBLA?', 'You will be assigned to a project of your choice. This project may either be a competition, presentation, or prejudged project. If you do choose a competition, you will have packets that will allow you to study for your date assigned. If you decide to have a presentation, you will have to write a speech, and practice your presentation before your assigned date of presentation. If you decide to do a prejudged project, you will have to work on a project depending on which you are assigned to and will be have frequent checkups until your deadline date.'),
                  Divider(),
                  questions('When can I see when my project is due?', 'Please refer to our calendar page'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
