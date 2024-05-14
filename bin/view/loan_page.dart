import 'package:flutter/material.dart';

class LoansPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Loans'),
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
              leading: Icon(Icons.monetization_on),
              title: Text('Loan ${index + 1}'),
              subtitle: Text('Book ID: ${index + 1} - User ID: ${index + 1}'),
              onTap: () {
                // Navegação para a página de detalhes do empréstimo
              },
            ),
          );
        },
      ),
    );
  }
}

