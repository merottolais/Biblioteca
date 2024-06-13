class Book {
  int? id;
  String title;
  String author;
  String description;
  String? imageUrl;

  Book({
    this.id,
    required this.title,
    required this.author,
    required this.description,
    this.imageUrl,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json['id'],
      title: json['title'],
      author: json['author'],
      description: json['description'],
      imageUrl: json['imageUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'author': author,
      'description': description,
      'imageUrl': imageUrl,
    };
  }
}
