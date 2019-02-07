class JsonPost {
  int userId;
  int id;
  String title;
  String body;

  JsonPost({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  factory JsonPost.fromJson(Map<String, dynamic> json) {
    var result = new JsonPost();
    result.id = json['id'];
    result.body = json['body'];
    result.title = json['title'];
    result.userId = json['userId'];
    return result;
  }
}
