import 'package:flutter/material.dart';
import 'package:sample_blog/models/post_model.dart';
import 'package:sample_blog/widgets/comment_widget.dart';

class CommentsPage extends StatelessWidget {
  CommentsPage(this._post);
  final Post _post;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: Text(_post.title)),
      body: ListView(
        children: _post.comments.map((comment) => new CommentWidget(comment)).toList(),
      ),
    );
  }
}