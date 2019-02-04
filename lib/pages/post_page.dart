import 'package:flutter/material.dart';
import 'package:sample_blog/models/post_model.dart';

class PostPage extends StatelessWidget {
  PostPage(this._post);
  final Post _post;

  _add(){

  }
  _like(){

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_post.title),
      actions: <Widget>[
        IconButton(icon: Icon(Icons.add), onPressed: _add),
        IconButton(icon: Icon(Icons.favorite), onPressed: _like)
      ],),
      body: Column(
        children: <Widget>[
          Image.network(_post.imageUrl),
          Text(_post.description)
        ],
      ),
    );
  }

}