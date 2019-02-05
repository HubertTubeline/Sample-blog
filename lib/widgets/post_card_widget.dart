import 'package:flutter/material.dart';
import 'package:sample_blog/models/post_model.dart';
import 'package:sample_blog/pages/post_page.dart';
import 'package:sample_blog/widgets/post_bottomButtons_widget.dart';

class PostCardWidget extends StatefulWidget {
  PostCardWidget(this._post);
  final Post _post;

  @override
  _PostCardState createState() => new _PostCardState();
}

class _PostCardState extends State<PostCardWidget> {
  void _openPost() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => PostPage(widget._post)));
    if (!widget._post.isVisited) {
      widget._post.isVisited = true;
      widget._post.visitsCount++;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(children: <Widget>[
      Image.asset(widget._post.imageUrl),
      Padding(
          child: Text(
            widget._post.title,
            maxLines: 1,
            style: TextStyle(fontSize: 20, letterSpacing: 2),
          ),
          padding: EdgeInsets.all(16)),
      Text(widget._post.description,
          style: TextStyle(fontSize: 16),
          maxLines: 3,
          softWrap: true,
          overflow: TextOverflow.fade),
      Divider(color: Colors.grey),
      Row(children: <Widget>[
        PostBottomButtonsWidget(widget._post),
        FlatButton(
          child: Text('Open',
              style: TextStyle(fontSize: 20, color: Colors.blueAccent)),
          onPressed: _openPost,
        )
      ])
    ]));
  }
}
