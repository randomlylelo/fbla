import 'package:flutter/material.dart';
import 'package:fbla/widgets/nav.dart';
import 'package:fbla/screens/specific/joinHome.dart';

class Home extends StatelessWidget {
  Widget _createSubHeading(String text) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 5, 5, 2.5),
      alignment: Alignment.topLeft,
      child: Text(
        text,
        style: TextStyle(
          color: Colors.black,
          fontSize: 25.0,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  Widget _createBodyText(String text) {
    return Container(
      alignment: Alignment.topLeft,
      padding: EdgeInsets.fromLTRB(35, 0, 0, 2.5),
      child: Text(
        text,
        style: TextStyle(fontSize: 17.5),
      ),
    );
  }

  Widget _createCard(String heading, String body) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 5, 10, 10),
      child: Card(
        elevation: 5,
        child: Column(
          children: <Widget>[
            _createSubHeading(heading),
            _createBodyText(body),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            backgroundColor: Color.fromRGBO(0, 173, 230, 1),
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                alignment: Alignment.bottomCenter,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(0, 30, 96, 1),
                  image: DecorationImage(
                    image: AssetImage('./lib/assets/images/background.jpg'),
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            ),
            expandedHeight: 200,
            actions: <Widget>[
              FlatButton(
                child: Text(
                  'ADMIN LOGIN',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 12,
                  ),
                ),
                onPressed: () => Navigator.of(context).pushNamed('admin'),
              ),
            ],
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: Column(
                  children: <Widget>[
                    _createCard(
                      'What is FBLA?',
                      'Future Business Leaders of America, also known as FBLA, is a high school association where students are brought forth a glimpse of having a career in business through means of competing and leadership.',
                    ),
                    _createCard(
                      'How does the club work?',
                      'Students in FBLA are the ones who run the club by not only taking on tasks done by business people but by having a sense of altruism and giving back to the community.',
                    ),
                    _createCard(
                      'What you will gain: ',
                      'Through FBLA, students will gain skills vital in use for continuation of business. This means students will have the chance to practice their interpersonal skills through means of presentation, management, teamwork, formality, and more. They will be challenged by being placed in one subtopic out of over 60 competition events where they will pursue this and either present or demonstrate their skills in the end. Competitors will either be broken up by chapter, group, or work by themselves. Depending on your schools chapter, you may have the chance to tackle on community service projects, fundraisers, fields trips, and more.',
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                      child: Text(
                        'You have a chance to make a change within community, will you take it?',
                        style: TextStyle(fontSize: 17.5),
                      ),
                    ),
                    RaisedButton(
                      elevation: 1,
                      color: Colors.white,
                      child: Text(
                        'Click Here to Join!',
                        style: TextStyle(
                          color: Color.fromRGBO(0, 30, 96, 1),
                        ),
                      ),
                      onPressed: () { Navigator.of(context).pushNamed('joinHome'); },
                    )
                  ],
                ),
              )
            ]),
          )
        ],
      ),
      drawer: Nav(),
    );
  }
}
