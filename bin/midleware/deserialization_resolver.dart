import '../model/book.dart';
import '../model/loan.dart';
import '../model/user.dart';

class DeserializationResolver {
  T resolve<T>(Map<String, dynamic> json) {
    if (T == User) {
      return User.fromJson(json) as T;
    } else if (T == Book) {
      return Book.fromJson(json) as T;
    } else if (T == Loan) {
      return Loan.fromJson(json) as T;
    }
    throw Exception('Unknown type');
  }
}
