import 'package:flutter/material.dart';
import 'package:sample_blog/models/post_model.dart';
import 'package:sample_blog/pages/comments_page.dart';

class PostBottomButtonsWidget extends StatefulWidget {
  PostBottomButtonsWidget(this._post);
  final Post _post;

  @override
  _PostBottomButtonsState createState() => _PostBottomButtonsState();
}

class _PostBottomButtonsState extends State<PostBottomButtonsWidget> {
  _likeClick() {
    setState(() {
      if (widget._post.isDislike) {
        widget._post.isDislike = false;
        widget._post.dislikesCount--;
      }

      widget._post.isLike = !widget._post.isLike;

      if (widget._post.isLike)
        widget._post.likesCount++;
      else
        widget._post.likesCount--;
    });
  }

  _dislikeClick() {
    setState(() {
      if (widget._post.isLike) {
        widget._post.isLike = false;
        widget._post.likesCount--;
      }

      widget._post.isDislike = !widget._post.isDislike;

      if (widget._post.isDislike)
        widget._post.dislikesCount++;
      else
        widget._post.dislikesCount--;
    });
  }

  _commentClick() {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => CommentsPage(widget._post)));
  }

  _visitsClick() {}

  @override
  Widget build(BuildContext context) {
    return new Row(children: <Widget>[
      new Container(
        child: IconButton(
          icon: Icon(Icons.thumb_up,
              color: widget._post.isLike ? Colors.green[500] : Colors.grey),
          onPressed: _likeClick,
        ),
      ),
      SizedBox(
          width: 18,
          child: Container(
            child: Text(widget._post.likesCount.toString()),
          )),
      new Container(
        child: IconButton(
          icon: Icon(Icons.thumb_down,
              color: widget._post.isDislike ? Colors.red[500] : Colors.grey),
          onPressed: _dislikeClick,
        ),
      ),
      SizedBox(
          width: 18,
          child: Container(
            child: Text(widget._post.dislikesCount.toString()),
          )),
      new Container(
        child: IconButton(
          icon: (Icon(Icons.comment)),
          color: Colors.grey,
          onPressed: _commentClick,
        ),
      ),
      SizedBox(
          width: 18,
          child: Container(
            child: Text(widget._post.commentsCount.toString()),
          )),
      new Container(
        child: IconButton(
          icon: Icon(
            Icons.remove_red_eye,
            color: Colors.grey,
          ),
          onPressed: _visitsClick,
        ),
      ),
      SizedBox(
          width: 18,
          child: Container(
            child: Text(widget._post.visitsCount.toString()),
          )),
    ]);
  }
}
