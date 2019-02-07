class Comment {
  Comment(this.commentId, this.authorId, this.postId,
      {this.title,
      this.likesCount,
      this.dislikesCount,
      this.isDisliked,
      this.isLiked});

  int commentId;
  int postId;
  int authorId;
  String title;

  bool isLiked;
  bool isDisliked;
  int likesCount;
  int dislikesCount;
}
