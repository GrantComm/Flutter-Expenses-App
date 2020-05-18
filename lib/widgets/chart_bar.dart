import 'package:flutter/material.dart';

class Chartbar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double percentage;

  Chartbar(this.label, this.spendingAmount, this.percentage);
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, contraints){
      return Column(
      children: <Widget>[
        Container(
            height: contraints.maxHeight * 0.15,
            child: FittedBox(
              child: Text('\$${spendingAmount.toStringAsFixed(0)}'),
            )),
        SizedBox(
          height: contraints.maxHeight * 0.05,
        ),
        Container(
          height: contraints.maxHeight * 0.6,
          width: 10,
          child: Stack(
            children: <Widget>[
              Container(
                  decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1),
                color: Colors.blueGrey,
                borderRadius: BorderRadius.circular(10),
              )),
              FractionallySizedBox(
                heightFactor: percentage,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(10)),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: contraints.maxHeight * 0.05,
        ),
        Container(
        height: contraints.maxHeight * 0.15,
        child: FittedBox(child: Text(label)))
      ],
    );
    },); 
  }
}
