import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;


  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final inputTitle = TextEditingController();

  final inputAmount = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: "Title"),
              controller: inputTitle,
              onSubmitted: (_) {
                _submitTransaction();
              },
            ),
            TextField(
              decoration: InputDecoration(labelText: "Amount"),
              controller: inputAmount,
              keyboardType: TextInputType.number,
              onSubmitted: (_) {
                _submitTransaction();
              },
            ),
            FlatButton(
              child: Text(
                "Add Transaction",
                style: TextStyle(color: Colors.orange),
              ),
              onPressed: () {
                _submitTransaction;
              },
            )
          ],
        ),
      ),
    );
  }

  void _submitTransaction() {
    final enteredTitle = inputTitle.text; 
    final enteredAmount = double.parse(inputAmount.text); 
    if(enteredTitle.isEmpty || enteredAmount < 0){
      return; 
    }
    widget.addTx(inputTitle.text, double.parse(inputAmount.text));

    Navigator.of(context).pop();
  }
}
