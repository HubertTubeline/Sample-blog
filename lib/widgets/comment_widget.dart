import 'package:flutter/material.dart';
import 'package:sample_blog/models/comment_model.dart';

class CommentWidget extends StatefulWidget {
  CommentWidget(this._comment);
  final Comment _comment;

  @override
  _CommentState createState() => _CommentState();
}

class _CommentState extends State<CommentWidget> {
  _likeClick() {
    setState(() {
      if (widget._comment.isDisliked) {
        widget._comment.isDisliked = false;
        widget._comment.dislikesCount--;
      }

      widget._comment.isLiked = !widget._comment.isLiked;

      if (widget._comment.isLiked)
        widget._comment.likesCount++;
      else
        widget._comment.likesCount--;
    });
  }

  _dislikeClick() {
    setState(() {
      if (widget._comment.isLiked) {
        widget._comment.isLiked = false;
        widget._comment.likesCount--;
      }

      widget._comment.isDisliked = !widget._comment.isDisliked;

      if (widget._comment.isDisliked)
        widget._comment.dislikesCount++;
      else
        widget._comment.dislikesCount--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Card(
        child: Column(children: <Widget>[
      Row(
        children: <Widget>[
          Column(children: <Widget>[
            Image.asset(
              "lib/resources/noavatar.png",
              width: 60,
            ),
            Text("Author"),
          ]),
          VerticalDivider(),
          Column(
            children: <Widget>[
              Text(widget._comment.title),
            ],
          )
        ],
      ),
      Divider(),
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          new Container(
            child: IconButton(
              icon: Icon(Icons.thumb_up,
                  color: widget._comment.isLiked
                      ? Colors.green[500]
                      : Colors.grey),
              onPressed: _likeClick,
            ),
          ),
          SizedBox(
              width: 18,
              child: Container(
                child: Text(widget._comment.likesCount.toString()),
              )),
          new Container(
            child: IconButton(
              icon: Icon(Icons.thumb_down,
                  color: widget._comment.isDisliked
                      ? Colors.red[500]
                      : Colors.grey),
              onPressed: _dislikeClick,
            ),
          ),
          SizedBox(
              width: 18,
              child: Container(
                child: Text(widget._comment.dislikesCount.toString()),
              )),
        ],
      )
    ]));
  }
}
