import 'package:flutter/material.dart';
import 'package:simple_blog/models/account_model.dart';

class RatedPostsPage extends StatelessWidget {
  RatedPostsPage(this._account, {this.isLiked: false, this.isDisliked: false});

  final Account _account;

  final bool isLiked;
  final bool isDisliked;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text("todo");
  }
}
