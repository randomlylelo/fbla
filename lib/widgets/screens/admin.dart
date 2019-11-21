import 'package:flutter/material.dart';

class Admin extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AdminState();
}

enum Screen { login, register }

class _AdminState extends State<Admin> {
  // Declare Variables
  final TextEditingController _emailFilter = TextEditingController();
  final TextEditingController _nameFilter = TextEditingController();
  final TextEditingController _passwordFilter = TextEditingController();
  String _email = '';
  String _name = '';
  String _password = '';

  // Set default to login.
  Screen _form = Screen.login;

  _AdminState() {
    // Email Listener
    _emailFilter.addListener(() {
      if (_emailFilter.text.isEmpty) {
        _email = '';
      } else {
        _email = _emailFilter.text;
      }
    });
    // Name Listener
    _nameFilter.addListener(() {
      if (_nameFilter.text.isEmpty) {
        _name = '';
      } else {
        _name = _nameFilter.text;
      }
    });
    // Password Listener
    _passwordFilter.addListener(() {
      if (_passwordFilter.text.isEmpty) {
        _password = '';
      } else {
        _password = _passwordFilter.text;
      }
    });
  }

  void _screenChange() {
    setState(() {
      if (_form == Screen.register) {
        _form = Screen.login;
      } else {
        _form = Screen.register;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Please Login!'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            _buildTextFields(),
            _buildButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildTextFields() {
    if (_form == Screen.login) {
      return Container(
        child: Column(
          children: <Widget>[
            Container(
              child: TextField(
                controller: _emailFilter,
                decoration: InputDecoration(labelText: 'Email'),
              ),
            ),
            Opacity(
              opacity: 0.0,
              child: Container(
                child: TextField(
                  controller: _nameFilter,
                  decoration: InputDecoration(labelText: 'Name'),
                  enabled: false,
                ),
              ),
            ),
            Container(
              child: TextField(
                controller: _passwordFilter,
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
            )
          ],
        ),
      );
    } else {
      return Container(
        child: Column(
          children: <Widget>[
            Container(
              child: TextField(
                controller: _emailFilter,
                decoration: InputDecoration(labelText: 'Email'),
              ),
            ),
            Container(
              child: TextField(
                controller: _nameFilter,
                decoration: InputDecoration(labelText: 'Name'),
              ),
            ),
            Container(
              child: TextField(
                controller: _passwordFilter,
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
            )
          ],
        ),
      );
    }
  }

  Widget _buildButtons() {
    if (_form == Screen.login) {
      return Container(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text('Login'),
              onPressed: () => _accPrint(),
            ),
            FlatButton(
              child: Text('Dont have an account? Tap here to register.'),
              onPressed: _screenChange,
            ),
            FlatButton(
              child: Text('Forgot Password?'),
              onPressed: () => _accPrint(),
            )
          ],
        ),
      );
    } else {
      return Container(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text('Create an Account'),
              onPressed: () => _accPrint(),
            ),
            FlatButton(
              child: Text('Have an account? Click here to login.'),
              onPressed: _screenChange,
            )
          ],
        ),
      );
    }
  }

  void _accPrint() {
    print('Email: $_email, Password: $_password, Name: $_name');
  }
}
