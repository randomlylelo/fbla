import 'package:fbla/screens/specific/allEvents.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// Links to Social Media

class Social extends StatelessWidget {
  final String title;

  Social(this.title);

  _launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
        color: Colors.blueAccent,
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Offical Websites:',
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Divider(),
                  Container(
                    alignment: Alignment.topRight,
                    child: Column(
                      children: <Widget>[
                        Container(
                          alignment: Alignment.topRight,
                          child: Text(
                            'Mater Lakes Academy\'s FBLA website',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Container(
                          alignment: Alignment.topRight,
                          child: RaisedButton(
                            elevation: 0,
                            child: Text('Visit'),
                            onPressed: () => _launchURL('https://www.materlakes.org/apps/pages/index.jsp?uREC_ID=106549&type=d&termREC_ID=&pREC_ID=staff'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(),
                  Container(
                    alignment: Alignment.topRight,
                    child: Column(
                      children: <Widget>[
                        Container(
                          alignment: Alignment.topRight,
                          child: Text(
                            'Offical FBLA Website',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Container(
                          alignment: Alignment.topRight,
                          child: RaisedButton(
                            elevation: 0,
                            child: Text('Visit'),
                            onPressed: () => _launchURL('https://www.fbla-pbl.org/'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Text(
              'Follow FBLA\'s Social Media!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '(Press the buttons below)',
              style: TextStyle(
                color: Colors.white,
                fontStyle: FontStyle.italic,
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        //padding: EdgeInsets.all(12),
        color: Colors.blue,
        child: Row(
          children: <Widget>[
            ButtonTheme(
              minWidth: MediaQuery.of(context).size.width * .20,
              height: 100.0,
              child: FlatButton(
                child: Icon(
                  FontAwesomeIcons.facebookF,
                  color: Colors.white,
                ),
                onPressed: () =>
                    _launchURL('http://www.facebook.com/FutureBusinessLeaders'),
              ),
            ),
            ButtonTheme(
              minWidth: MediaQuery.of(context).size.width * .20,
              height: 100.0,
              child: FlatButton(
                child: Container(
                  height: 100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        FontAwesomeIcons.twitter,
                        color: Colors.white,
                      ),
                      Text(
                        'FBLA',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
                onPressed: () =>
                    _launchURL('https://twitter.com/FBLA_National'),
              ),
            ),
            ButtonTheme(
              minWidth: MediaQuery.of(context).size.width * .20,
              height: 100.0,
              child: FlatButton(
                child: Container(
                  height: 100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        FontAwesomeIcons.twitter,
                        color: Colors.white,
                      ),
                      Text(
                        'PBL',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
                onPressed: () => _launchURL('https://twitter.com/PBL_National'),
              ),
            ),
            ButtonTheme(
              minWidth: MediaQuery.of(context).size.width * .20,
              height: 100.0,
              child: FlatButton(
                child: Icon(
                  FontAwesomeIcons.instagram,
                  color: Colors.white,
                ),
                onPressed: () => _launchURL('https://instagram.com/fbla_pbl/'),
              ),
            ),
            ButtonTheme(
              minWidth: MediaQuery.of(context).size.width * .20,
              height: 100.0,
              child: FlatButton(
                child: Icon(
                  FontAwesomeIcons.linkedinIn,
                  color: Colors.white,
                ),
                onPressed: () =>
                    _launchURL('http://www.linkedin.com/groups?gid=106458'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
