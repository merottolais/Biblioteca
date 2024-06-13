class User {
  int? id;
  String name;
  String email;
  String password;
  String type;

  User({
    this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.type,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      password: json['password'],
      type: json['type'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'type': type,
    };
  }
}

