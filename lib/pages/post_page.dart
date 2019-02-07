import 'package:flutter/material.dart';
import 'package:simple_blog/models/post_model.dart';
import 'package:simple_blog/widgets/post_bottomButtons_widget.dart';

class PostPage extends StatelessWidget {
  PostPage(this._post);
  final Post _post;

  _report() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_post.title),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.warning), onPressed: _report)
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Image.asset(_post.imageUrl),
              Padding(padding: EdgeInsets.all(10), child: Text(_post.body)),
              Divider(),
              PostBottomButtonsWidget(_post)
            ],
          ),
        ));
  }
}
