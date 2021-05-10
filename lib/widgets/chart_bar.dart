import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPcOfTotal;

  var chartColor = Color.fromRGBO(147, 112, 210, 1);

  ChartBar(this.label, this.spendingAmount, this.spendingPcOfTotal);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Container(
        //   height: 20,
        //   child: FittedBox(
        //     child: Padding(
        //       padding: EdgeInsets.symmetric(horizontal: 1),
        //       child: Text('\$${spendingAmount.toStringAsFixed(0)}'),
        //     ),
        //   ),
        // ),
        SizedBox(height: 4),
        Container(
          height: 110,
          width: 19,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1.0),
                  color: chartColor, //#9370d2
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: FractionallySizedBox(
                  heightFactor: spendingPcOfTotal,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          label,
          style: TextStyle(color: chartColor, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
