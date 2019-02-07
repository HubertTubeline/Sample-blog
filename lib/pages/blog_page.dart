import 'package:flutter/material.dart';
import 'package:sample_blog/models/comment_model.dart';
import 'package:sample_blog/models/jsonPost_model.dart';
import 'package:sample_blog/models/post_model.dart';
import 'package:sample_blog/widgets/post_card_widget.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class BlogPage extends StatefulWidget {
  @override
  _BlogState createState() => _BlogState();
}

class _BlogState extends State<BlogPage> {
  List<Post> _postsList = new List<Post>();

  @override
  initState() {
    _getPosts();
    super.initState();
  }

  static const _imagesSource = [
    "lib/resources/post0.png",
    "lib/resources/post1.png",
    "lib/resources/post2.jpg",
    "lib/resources/post3.jpg",
    "lib/resources/post4.jpg"
  ];

  _getComments(int postId, int commentsCount) {
    var list = new List<Comment>();
    for (int i = 0; i < commentsCount; i++) {
      list.add(new Comment(i, 0, postId,
          title: "Simple comment for sample post",
          dislikesCount: 0,
          isDisliked: false,
          likesCount: 0,
          isLiked: false));
    }
    return list;
  }

  _getDescription() {
    String result = "";
    for (int i = 0; i < 8; i++)
      result +=
          'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. ' +
              'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.';

    return result;
  }

  _getPosts() {
    List<Post> list = new List<Post>();
    for (int i = 0; i < 5; i++) {
      list.add(new Post(i,
          title: 'Simple post in blog #${i + 1}',
          body: _getDescription(),
          imageUrl: _imagesSource[i],
          isVisited: false,
          isLike: false,
          isDislike: false,
          commentsCount: 5 + i,
          likesCount: 5 + i + i % 1,
          dislikesCount: 1,
          visitsCount: 5 + i + i % 2,
          comments: _getComments(i, 5 + i)));
    }
    _postsList = list;
  }

  _getAPIPosts() {
    fetchData().then((response) {
      setState(() {
        var jsonPost = json.decode(response.body);
        List<Post> result = new List<Post>();
        for (var item in jsonPost) {
          var i = JsonPost.fromJson(item);
          var post = new Post(
            i.id,
            title: i.title,
            body: i.body,
            isVisited: false,
            isLike: false,
            isDislike: false,
            commentsCount: 5,
            likesCount: 5,
            dislikesCount: 1,
            visitsCount: 5,
          );
          result.add(post);
        }
        _postsList = result;
      });
    });
  }

  Future<http.Response> fetchData() {
    return http.get("https://jsonplaceholder.typicode.com/posts");
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new ListView(
        children: _postsList.map((post) => new PostCardWidget(post)).toList(),
      ),
    );
  }
}
