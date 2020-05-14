import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {

  final inputTitle = TextEditingController(); 
  final inputAmount = TextEditingController(); 
  final Function addTx; 

  NewTransaction(this.addTx); 

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
                    ),
                    TextField(
                      decoration: InputDecoration(labelText: "Amount"),
                      controller: inputAmount,
                    ),
                    FlatButton(
                      child: Text(
                        "Add Transaction",
                        style: TextStyle(color: Colors.orange),
                      ),
                      onPressed: (){
                        addTx(inputTitle.text, double.parse(inputAmount.text));  
                      },
                    )
                  ],
                ),
              ),
            );
  }
}