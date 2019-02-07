import 'package:sample_blog/models/comment_model.dart';

class Post {
  Post(this.postId,
      {this.title,
      this.body,
      this.imageUrl: "lib/resources/post0.png",
      this.commentsCount: 0,
      this.isVisited: false,
      this.visitsCount: 0,
      this.isLike: false,
      this.isDislike: false,
      this.likesCount: 0,
      this.dislikesCount: 0,
      this.comments});

  int postId;
  String title;
  String body;
  String imageUrl;
  bool isVisited;
  bool isLike;
  bool isDislike;
  int likesCount;
  int dislikesCount;
  int commentsCount;
  int visitsCount;

  List<Comment> comments;
}
