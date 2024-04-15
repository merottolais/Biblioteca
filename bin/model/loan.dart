import '../register.dart';
import '../service/generic_service.dart';
import 'book.dart';
import 'user.dart';

class Loan {
  int id = 0;
  Book? book;
  User? user;

  Loan();

  Loan.fromJson(Map<String, dynamic> json) {
    id = int.parse(json['id']);
    book = service<GenericService<Book>>().get(int.parse(json['bookId']));
    user = service<GenericService<User>>().get(int.parse(json['userId']));
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['book'] = book?.toJson();
    data['user'] = user?.toJson();
    return data;
  }
}
