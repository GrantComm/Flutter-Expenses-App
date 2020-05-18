import 'package:flutter/material.dart';
import './widgets/list_of_transactions.dart';
import './widgets/new_transactions.dart';
import './models/transaction.dart';
import './widgets/chart.dart';

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
    /*Transaction(
        id: 't1', title: "New Boots", amount: 200.00, date: DateTime.now()),
    Transaction(
        id: 't2', title: "New Laptop", amount: 1633.00, date: DateTime.now())
    */
  ];

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
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
          onPressed: () {
            _startNewTransaction(context);
          },
        )
      ],
    );

    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
                height: (MediaQuery.of(context).size.height -
                        appBar.preferredSize.height - MediaQuery.of(context).padding.top) *
                    0.3,
                child: Chart(_recentTransactions)),
            Container(
                height: (MediaQuery.of(context).size.height -
                        appBar.preferredSize.height - MediaQuery.of(context).padding.top) *
                    0.7,
                child: TransactionList(_userTransactions, _deleteTransaction)),
          ],
        ),
      ),
    );
  }

  void _startNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return NewTransaction(_addNewTransaction);
        });
  }

  void _addNewTransaction(String NTitle, double NAmount, DateTime chosenDate) {
    final newTx = Transaction(
        title: NTitle,
        amount: NAmount,
        date: chosenDate,
        id: DateTime.now().toString());

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _deleteTransaction(String id) {
    setState(() {
      _userTransactions.removeWhere((tx) => tx.id == id);
    });
  }

  List<Transaction> get _recentTransactions {
    return _userTransactions.where((tx) {
      return tx.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }
}
