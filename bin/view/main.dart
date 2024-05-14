import 'package:flutter/material.dart';
import 'book_page.dart';
import 'loan_page.dart';
import 'user_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/books',
      routes: {
        '/books': (context) => BooksPage(),
        '/loans': (context) => LoansPage(),
        '/users': (context) => UsersPage(),
      },
    );
  }
}
