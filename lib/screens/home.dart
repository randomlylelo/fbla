import 'package:flutter/material.dart';
import 'package:fbla/widgets/nav.dart';
import 'package:fbla/widgets/global.dart' as globals;

class Home extends StatelessWidget {
  Widget _createSubHeading(String text) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 5, 5, 2.5),
      alignment: Alignment.center,
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
      padding: EdgeInsets.fromLTRB(5, 0, 2.5, 5),
      child: Text(
        text,
        style: TextStyle(fontSize: 17.5),
      ),
    );
  }

  Widget _createCard(String heading, String body) {
    return Container(
      padding: EdgeInsets.fromLTRB(2.5, 0, 2.5, 5),
      child: Card(
        color: Color.fromRGBO(0, 173, 230, 1),
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

  Widget _admin(BuildContext context) {
    if (!globals.admin) {
      return FlatButton(
        child: Text(
          'ADMIN LOGIN',
          style: TextStyle(
            color: Colors.white70,
            fontSize: 12,
          ),
        ),
        onPressed: () => Navigator.of(context).pushNamed('admin'),
      );
    }
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            backgroundColor: Color.fromRGBO(0, 30, 96, 1),
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                alignment: Alignment.bottomCenter,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(0, 30, 96, 1),
                  image: DecorationImage(
                    image: AssetImage('./lib/assets/images/background.jpg'),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            expandedHeight: 200,
            actions: <Widget>[
              _admin(context),
            ],
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                color: Color.fromRGBO(0, 30, 96, 1),
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: Column(
                  children: <Widget>[
                    _createCard(
                      'What is FBLA?',
                      'Future Business Leaders of America, also known as FBLA, is a high school association where students are brought forth a glimpse of having a career in business through means of competing and leadership.',
                    ),
                    _createCard(
                      'How does this club work?',
                      'Students in FBLA are the ones who run the club. By not only taking on tasks that are both challenging and rewarding to the student, you have the chance to give back to the community through a sense of altruism',
                    ),
                    _createCard(
                      'What you will gain?',
                      'Through FBLA, students will gain skills vital in use for continuation of business. This means students will have the chance to practice their interpersonal skills through means of presentation, management, teamwork, formality, and more. Students will be entered in one of 60 competing events where they will put their skills to the test. Competitors will either be broken up by chapter, group, or work by themselves. Depending on your schools chapter, you may have the chance to tackle on community service projects, fundraisers, fields trips, and more.',
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                      child: Text(
                        'You have a chance to make a change within our community, will you take it?',
                        style: TextStyle(
                          fontSize: 17.5,
                          color: Colors.white,
                        ),
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
                      onPressed: () {
                        Navigator.of(context).pushNamed('joinHome');
                      },
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
