import 'package:flutter/material.dart';

class BooksPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Books'),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Card(
            elevation: 3,
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              leading: Icon(Icons.book),
              title: Text('Book ${index + 1}'),
              subtitle: Text('Author ${index + 1}'),
              onTap: () {
                // Navegação para a página de detalhes do livro
              },
            ),
          );
        },
      ),
    );
  }
}

