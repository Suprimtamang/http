class Post {
  final int userId;
  final int id;
  final String title, body;

  Post(
      {required this.userId,
      required this.id,
      required this.title,
      required this.body});

  /// serialization
  static Post convertJsonToPost(Map json) {
    return Post(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }

// deserialization
  Map toJson() {
    return {
      "id": id,
      "userId": userId,
      "title": title,
      "body": body,
    };
  }
}
