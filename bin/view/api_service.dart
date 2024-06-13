import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/book.dart';
import '../model/loan.dart';
import '../model/user.dart';

class ApiService {
  static const String _baseUrl = 'http://localhost:3000/api';

  Future<List<Book>> fetchBooks() async {
    final response = await http.get(Uri.parse('$_baseUrl/books'));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((book) => Book.fromJson(book)).toList();
    } else {
      throw Exception('Failed to load books');
    }
  }

  Future<List<Loan>> fetchLoans() async {
    final response = await http.get(Uri.parse('$_baseUrl/loans'));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((loan) => Loan.fromJson(loan)).toList();
    } else {
      throw Exception('Failed to load loans');
    }
  }

  Future<List<User>> fetchUsers() async {
    final response = await http.get(Uri.parse('$_baseUrl/users'));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((user) => User.fromJson(user)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }
}
