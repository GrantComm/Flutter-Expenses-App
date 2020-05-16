import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _inputTitle = TextEditingController();
  final _inputAmount = TextEditingController();
  DateTime selectedDate;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: "Title"),
              controller: _inputTitle,
              onSubmitted: (_) {
                _submitTransaction();
              },
            ),
            TextField(
              decoration: InputDecoration(labelText: "Amount"),
              controller: _inputAmount,
              keyboardType: TextInputType.number,
              onSubmitted: (_) {
                _submitTransaction();
              },
            ),
            Container(
              height: 70,
              child: Row(
                children: <Widget>[
                  Expanded(
                                      child: Text(selectedDate == null
                        ? "No Date Chosen"
                        : "Picked Date: ${DateFormat.yMd().format(selectedDate)}"),
                  ),
                  FlatButton(
                    child: Text("Choose date"),
                    textColor: Colors.orange,
                    onPressed: _presentDatePicker,
                  )
                ],
              ),
            ),
            Container(
              alignment: Alignment.topRight,
              child: RaisedButton(
                color: Colors.blueGrey,
                child: Text(
                  "Add Transaction",
                  style: TextStyle(color: Colors.orange),
                ),
                onPressed: () {
                  _submitTransaction;
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  void _submitTransaction() {
    if(_inputAmount.text == ""){
      return; 
    }
    final enteredTitle = _inputTitle.text;
    final enteredAmount = double.parse(_inputAmount.text);
    if (enteredTitle.isEmpty || enteredAmount < 0 || selectedDate == null) {
      return;
    }
    widget.addTx(_inputTitle.text, double.parse(_inputAmount.text), selectedDate);

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2020),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        selectedDate = pickedDate;
      });
    });
  }
}
