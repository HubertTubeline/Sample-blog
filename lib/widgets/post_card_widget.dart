import 'package:flutter/material.dart';
import 'package:sample_blog/models/post_model.dart';
import 'package:sample_blog/pages/post_page.dart';

class PostCardWidget extends StatefulWidget {
  PostCardWidget(this._post);
  Post _post;
  
  @override
  State<StatefulWidget> createState() => new PostCardState(_post);
}
class PostCardState extends State<PostCardWidget> {
  PostCardState(this._post);
  Post _post;
  @override
  Widget build(BuildContext context) {
    return Card(
          child: Column(
          children: <Widget>[
            Image.network(this._post.imageUrl),
            Padding(child: Text(this._post.title, maxLines: 1, style: TextStyle(fontSize: 20, letterSpacing: 3),), padding: EdgeInsets.all(16)),
            Row(children: <Widget>[
                Text(this._post.description, style: TextStyle(fontSize: 16))
              ],
            ),
            ButtonTheme.bar(
              child: ButtonBar(
                children: <Widget>[
                  Text(_post.isVisited ? "Visited" : "", style: TextStyle(fontSize: 18, color: Colors.grey)),
                  FlatButton(
                    child: const Text('Open', style: TextStyle(fontSize: 20),),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => PostPage(this._post)));
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
        );
  }

}

