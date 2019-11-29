import 'package:flutter/material.dart';

import 'package:fbla/widgets/help.dart';
// Local Officers Screen

class Officers extends StatelessWidget {
  final String title;

  Officers(this.title);

  Widget _officerCard(
      BuildContext context, String name, String position, String grade) {
    return Container(
      padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
      alignment: Alignment.topLeft,
      child: Card(
        elevation: 2.5,
        color: Color.fromRGBO(0, 173, 230, 1),
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: Row(
            children: <Widget>[
              Container(
                alignment: Alignment.topLeft,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Text(
                    name,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                      color: Color.fromRGBO(0, 30, 96, 1),
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: Column(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          position,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(0, 51, 160, 1),
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          grade,
                          style: TextStyle(
                            fontSize: 12,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(191, 13, 62, 1),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: <Widget>[
          Help(
              'This page shows Mater Lakes Academy\'s local FBLA Officer Team, on each of the cards, it shows their name, position, and grade level.',
              'In order to use this page, all you have to do is scroll down.')
        ],
      ),
      body: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * .6,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('./lib/assets/images/officers.jpg'),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.fromLTRB(10, 0, 10, 5),
                child: Text(
                    'Mater Lakes Academy\'s FBLA Chapter Officers & Advisor.'),
              ),
              Divider(),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.fromLTRB(10, 0, 10, 5),
                child: Text(
                  'The officers & advisors named with their position from top left to bottom right:',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
              _officerCard(context, 'Gabriel Ramirez', 'District Project Manager', '11th Grade'),
              _officerCard(context, 'Adrian Canepa', 'Treasurer', '12th Grade'),
              _officerCard(context, 'Paola Aleman', 'Junior Treasurer', '11th Grade'),
              _officerCard(context, 'Vijay Rathore', 'Vice President', '12th Grade'),
              _officerCard(context, 'Isaiah Gomez', 'Fundraising Chair', '12th Grade'),
              _officerCard(context, 'Joshua Villamizar', 'Junior Secretary', '11th Grade'),
              _officerCard(context, 'Isabella Milanes', 'District 25 Vice President', '12th Grade'),
              _officerCard(context, 'Mr. Giovanni Lorenzo', 'Advisor', ''),
              _officerCard(context, 'Anny Licor', 'President', '12th Grade'),
              _officerCard(context, 'Melany Diaz', 'Secretary', '12th Grade'),
              _officerCard(context, 'Nicole Mateus', 'Junior Competition Chair', '11th Grade'),
              _officerCard(context, 'Sabrina Arcila', 'District Project Manager', '11th Grade'),
              _officerCard(context, 'Sofia Aranda', 'District Project Manager', '11th Grade'),
              _officerCard(context, 'Alec Castro', 'Parliamentarian', '12th Grade'),
              _officerCard(context, 'Mya Polanco', 'Historian', '12th Grade'),
              _officerCard(context, 'Kathryn Kalouf', 'Competition Chair', '12th Grade'),
              _officerCard(context, 'Rosa Aleman', 'Public Relations', '12th Grade'),
            ],
          ),
        ],
      ),
    );
  }
}
