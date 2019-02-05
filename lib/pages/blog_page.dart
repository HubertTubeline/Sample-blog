import 'package:flutter/material.dart';
import 'package:sample_blog/models/comment_model.dart';
import 'package:sample_blog/models/post_model.dart';
import 'package:sample_blog/widgets/post_card_widget.dart';

class BlogPage extends StatelessWidget {

  final List<Post> _postsList = _getPosts();

  static const _imagesSource = [
    "http://phandroid.s3.amazonaws.com/wp-content/uploads/2013/06/google-now-day-mountains-640x400.jpg",
    "https://c1.staticflickr.com/5/4616/39428638794_1df1009aaf_b.jpg",
    "http://nestled.co/wp-content/uploads/2018/03/graphic-design-wallpaper-material-design-graphic-design-wallpaper-pinterest.jpg",
    "https://i.pinimg.com/originals/95/5d/e2/955de20dd2d6f457a1cfdadb8edc23d4.png",
    "https://cdn-images-1.medium.com/max/1600/1*Jie55HRpeCmZpmldgrL2eQ.png"
  ];
  static _getComments(int postId, int commentsCount) {
    var list = new List<Comment>();
    for(int i = 0; i < commentsCount; i++) {
       list.add(new Comment(i, 0, postId, "Simple comment for sample post",
      dislikesCount: 0, isDisliked: false,
      likesCount: 0, isLiked: false));
    }
    return list;
  }
   static _getPosts() {
     List<Post> list = new List<Post>();
     for(int i =0; i < 5; i++) {
       list.add(new Post(i,'Simple post in blog #${i+1}',
       'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.' +
       'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.' +
       'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.' +
       'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.' +
       'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.' +
       'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.' +
       'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.' +
       'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.' +
       'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.' +
       'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 
       imageUrl: _imagesSource[i],
       isVisited: false, isLike: false, isDislike: false, commentsCount: 5 + i, likesCount: 5 + i + i%1, dislikesCount: 1, visitsCount: 5 + i + i%2,
       comments: _getComments(i, 5 + i)));
     }
     return list;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: Text("Blog sample")),
      body: new ListView(
        children: _postsList.map((post) => new PostCardWidget(post)).toList(),
      ),
    );
  }
}