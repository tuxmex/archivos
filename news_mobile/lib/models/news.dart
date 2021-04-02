class News {
  int id;
  String title;
  String imageUrl;

  News({this.id, this.title, this.imageUrl});

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      id: json['id'] as int,
      title: json['title'] as String,
      imageUrl: 'http://192.168.1.73:3000/' + json['imageUrl'],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "imageUrl": imageUrl,
      };
}
