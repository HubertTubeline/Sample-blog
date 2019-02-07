import 'package:flutter/material.dart';
import 'package:simple_blog/models/account_model.dart';
import 'package:simple_blog/pages/ratedPosts_page.dart';

class AccountPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _AccountState();
}

class _AccountState extends State<AccountPage> {
  static _getAccount() {
    return new Account(0,
        email: "blog@gmail.com", firstName: "John", lastName: "Doe");
  }

  _openLikedPosts() {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => RatedPostsPage(_account, isLiked: true)));
  }

  _openDisikedPosts() {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => RatedPostsPage(_account, isDisliked: true)));
  }

  final Account _account = _getAccount();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Column(
        children: <Widget>[
          Center(
              child: Column(
            children: <Widget>[
              Padding(padding: EdgeInsets.only(top: 25)),
              Image.asset("lib/resources/face.png", width: 80, height: 80),
              Text(_account.firstName + " " + _account.lastName,
                  style: TextStyle(fontSize: 30))
            ],
          )),
          Divider(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                  child: Text("Likes",
                      style: TextStyle(color: Colors.lightBlue, fontSize: 18)),
                  onPressed: _openLikedPosts),
              FlatButton(
                  child: Text("Dislikes",
                      style: TextStyle(color: Colors.lightBlue, fontSize: 18)),
                  onPressed: _openDisikedPosts)
            ],
          )
        ],
      ),
    );
  }
}
