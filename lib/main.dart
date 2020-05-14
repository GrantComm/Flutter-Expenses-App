import 'package:flutter/material.dart';
import './widgets/user_transactions.dart';

void main() {
  runApp(ExpenseApp());
}

class ExpenseApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Expense App",
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget { 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Expenses",
          style: TextStyle(color: Colors.orange),
        ),
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
                  child: Column(
            children: <Widget>[
              Card(
                color: Colors.blueGrey,
                child: Container(
                    width: double.infinity,
                    height: 100,
                    child: Center(
                        child: Text(
                      "Chart",
                    ))),
                elevation: 5,
              ),
              UserTransactions(), 
            ],
          ),
        ),
      
    );
  }
}
