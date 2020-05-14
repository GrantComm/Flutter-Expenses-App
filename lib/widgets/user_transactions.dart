import 'package:flutter/material.dart';
import './new_transactions.dart';
import './list_of_transactions.dart';
import '../models/transaction.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _userTransactions = [
    Transaction(
        id: 't1', title: "New Boots", amount: 200.00, date: DateTime.now()),
    Transaction(
        id: 't2', title: "New Laptop", amount: 1633.00, date: DateTime.now())
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[NewTransaction(_addNewTransaction), TransactionList(_userTransactions)],
    );
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
