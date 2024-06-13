import 'package:flutter/material.dart';
import '../model/loan.dart';
import 'api_service.dart';

class LoansPage extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _LoansPageState createState() => _LoansPageState();
}

class _LoansPageState extends State<LoansPage> {
  late Future<List<Loan>> futureLoans;

  @override
  void initState() {
    super.initState();
    futureLoans = ApiService().fetchLoans();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Loans'),
      ),
      body: FutureBuilder<List<Loan>>(
        future: futureLoans,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No loans available'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                Loan loan = snapshot.data![index];
                return Card(
                  elevation: 3,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    leading: Icon(Icons.book),
                    title: Text('Loan ID: ${loan.id}'),
                    subtitle: Text('Book ID: ${loan.bookId}, User ID: ${loan.userId}'),
                    onTap: () {
                      // Navegação para a página de detalhes do empréstimo
                    },
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
