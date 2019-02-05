import 'package:sample_blog/models/comment_model.dart';

class Post {
  Post(this.postId, this.title, this.description, 
  {this.imageUrl, this.commentsCount, this.isVisited,  this.visitsCount,
  this.isLike, this.isDislike,this.likesCount, this.dislikesCount, this.comments});
  int postId;
  String title;
  String description;
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