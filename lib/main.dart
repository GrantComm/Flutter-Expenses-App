import 'package:flutter/material.dart';
import './widgets/list_of_transactions.dart';
import './widgets/new_transactions.dart';
import './models/transaction.dart';

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

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Transaction> _userTransactions = [
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
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            color: Colors.orange,
            onPressed: (){
              _startNewTransaction(context); 
            },
          )
        ],
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
           NewTransaction(_addNewTransaction), 
           TransactionList(_userTransactions),
          ],
        ),
      ),
    );
  }

  void _startNewTransaction(BuildContext ctx){
    showModalBottomSheet(context: ctx, builder: (_){
      return NewTransaction(_addNewTransaction); 
    }); 
  }

  void _addNewTransaction(String NTitle, double NAmount) {
    final newTx = Transaction(
        title: NTitle,
        amount: NAmount,
        date: DateTime.now(),
        id: DateTime.now().toString());

    setState(() {
      _userTransactions.add(newTx);
    });
  }
}
