import 'package:flutter/material.dart';
import './transaction.dart';

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
  final List<Transaction> transactions = [
    Transaction(
        id: 't1', title: "New Boots", amount: 200.00, date: DateTime.now()),
    Transaction(
        id: 't2', title: "New Laptop", amount: 1633.00, date: DateTime.now())
  ];
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
      body: Center(
        child: Column(
          children: <Widget>[
            Card(
              color: Colors.blueGrey,
              child: Container(
                  width: double.infinity, height: 100, child: Text("Chart",)),
              elevation: 5,
            ),
            Column(
                children: transactions.map((tx) {
              return Card(
                elevation: 10,
                child: Row(
                  children: <Widget>[
                    Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.blueGrey, width: 2)),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        tx.amount.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.orange),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(tx.title, style: TextStyle(
                          fontSize: 16, 
                          color: Colors.orange, 
                          fontWeight: FontWeight.bold

                        ),),
                        Text(tx.date.toString(),style: TextStyle(
                          fontSize: 13, 
                        ),)
                      ],
                    )
                  ],
                ),
              );
            }).toList())
          ],
        ),
      ),
    );
  }
}
