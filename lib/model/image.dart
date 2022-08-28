class Images {
  Hits hits;

  Images({required this.hits});
  factory Images.convertFromJson(Map json) {
    return Images(hits: Hits.convertPostsFromJson(json["hits"]));
  }
}

class Hits {
  final String user;
  final int likes, comments, views, previewWidth, previewHeight;
  var previewURL, userImageURL;

  Hits({
    required this.user,
    required this.likes,
    required this.comments,
    required this.views,
    required this.previewWidth,
    required this.previewHeight,
    required this.previewURL,
    required this.userImageURL,
  });
  static Hits convertPostsFromJson(Map json) {
    return Hits(
      user: json['user'],
      likes: json['likes'],
      comments: json['comments'],
      views: json['views'],
      previewWidth: json['previewWidth'],
      previewHeight: json['previewHeight'],
      previewURL: json['previewURL'],
      userImageURL: json['userImageURL'],
    );
  }
}
