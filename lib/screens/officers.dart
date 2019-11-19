import 'package:flutter/material.dart';

import '../widgets/help.dart';
// Local Officers Screen

class Officers extends StatelessWidget {
  final String title;

  Officers(this.title);

  Container items(
      BuildContext context, String name, String position, String image) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      child: Card(
        child: Wrap(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.70,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(1), BlendMode.dstATop),
                  image: AssetImage('./lib/images/image.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              //child: Image.network(image, fit: BoxFit.cover),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.30,
              width: MediaQuery.of(context).size.width,
              child: ListTile(
                title: Text(name),
                subtitle: Text(position),
              ),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
            ),
          ],
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
          Help('This page shows Mater Lakes Academy\'s local FBLA Officer Team, on each of the cards, it shows a picture with their name and position ')
        ],
      ),
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              items(context, 'Lo', 'Developer',
                  'https://images.unsplash.com/photo-1503875154399-95d2b151e3b0?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'),
              items(context, 'Lo', 'Developer',
                  'https://images.unsplash.com/photo-1503875154399-95d2b151e3b0?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'),
              items(context, 'Lo', 'Developer',
                  'https://images.unsplash.com/photo-1503875154399-95d2b151e3b0?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'),
              items(context, 'Lo', 'Developer',
                  'https://images.unsplash.com/photo-1503875154399-95d2b151e3b0?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'),
            ],
          ),
          alignment: Alignment.centerLeft,
          // BACKGROUND COLOR TO BOX
          decoration: BoxDecoration(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
