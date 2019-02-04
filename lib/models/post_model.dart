class Post {
  Post(this.title, this.description, {this.imageUrl, this.isVisited});

  String title;
  String description;
  String imageUrl;
  bool isVisited;
}