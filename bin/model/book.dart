class Book {
  int id = 0;
  String title = '';
  String author = '';
  String description = '';
  String imageUrl = '';

  Book();

  Book.fromJson(Map<String, dynamic> json) {
    id = int.parse(json['id']);
    title = json['title'];
    author = json['author'];
    description = json['description'];
    imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['author'] = author;
    data['description'] = description;
    data['imageUrl'] = imageUrl;
    return data;
  }
}
