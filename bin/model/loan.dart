import 'book.dart';
import 'user.dart';

class Loan {
  int id = 0;
  late Book book;
  late User user;

  Loan();

  Loan.fromJson(Map<String, dynamic> json) {
    id = int.parse(json['id']);
    book = Book.fromJson(json['book']);
    user = User.fromJson(json['user']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['book'] = book.toJson();
    data['user'] = user.toJson();
    return data;
  }
}
