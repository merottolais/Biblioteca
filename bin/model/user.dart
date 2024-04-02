import '../enum/user_type.dart';

class User {
  int id = 0;
  String name = '';
  String email = '';
  String password = '';
  String type = UserType.user.toString();

  User();

  User.fromJson(Map<String, dynamic> json) {
    id = int.parse(json['id']);
    name = json['name'];
    email = json['email'];
    password = json['password'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['password'] = password;
    data['type'] = type;
    return data;
  }

  @override
  String toString() {
    return 'User{id: $id, name: $name, email: $email, password: $password, type: $type}';
  }
}
