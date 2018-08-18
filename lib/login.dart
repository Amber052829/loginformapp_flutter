import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _userController = new TextEditingController();
  final TextEditingController _passController = new TextEditingController();
  String _welcomeString = "";

  void _login() {
    setState(() {
      if (_userController.text.isNotEmpty && _passController.text.isNotEmpty) {
        _welcomeString = _userController.text;
      } else {
        _welcomeString = "Nothing!";
      }
    });
  }

  void _clear() {
    setState(() {
      _userController.clear();
      _passController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Login"),
      ),
      body: new Container(
        alignment: Alignment.topCenter,
        child: new ListView(
          
          children: <Widget>[
            new Padding(padding: new EdgeInsets.all(20.0)),
            new Image.asset(
              'images/face.png',
              width: 90.0,
              height: 90.0,
            ),
            new Padding(padding: new EdgeInsets.all(20.0)),
            new Container(
              height: 180.0,
              width: 380.0,
              color: Colors.teal.shade900,
              child: new Column(
                children: <Widget>[
                  new TextField(
                    controller: _userController,
                    decoration: new InputDecoration(
                        hintText: "Username", icon: new Icon(Icons.person)),
                  ),
                  new TextField(
                    controller: _passController,
                    decoration: new InputDecoration(
                        hintText: "Password", icon: new Icon(Icons.lock)),
                    obscureText: true,
                  ),
                  new Padding(padding: new EdgeInsets.all(12.0)),
                  new Center(
                      child: new Row(
                    children: <Widget>[
                      new Container(
                        margin: const EdgeInsets.only(left: 50.0),
                        child: new RaisedButton(
                          onPressed: _login,
                          color: Colors.teal,
                          child: new Text(
                            "Login",
                            style: new TextStyle(
                                color: Colors.white70, fontSize: 17.0),
                          ),
                        ),
                      ),
                      new Container(
                        margin: const EdgeInsets.only(left: 100.0),
                        child: new RaisedButton(
                          onPressed: _clear,
                          color: Colors.teal,
                          child: new Text(
                            "Clear",
                            style: new TextStyle(
                                color: Colors.white70, fontSize: 17.0),
                          ),
                        ),
                      ),
                    ],
                  ))
                ],
              ),
            ),
            new Padding(padding: new EdgeInsets.only(top: 20.0)),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text(
                  "Welcome, $_welcomeString",
                  style: new TextStyle(
                      color: Colors.white,
                      fontSize: 19.5,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
