import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key key,
    @required this.transaction,
    @required this.deleteTx,
  }) : super(key: key);

  final Transaction transaction;
  final Function deleteTx;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 9),
      child: Card(
        shape: RoundedRectangleBorder(
          //Rounding card corners
          borderRadius: BorderRadius.circular(15.0),
        ),
        margin: EdgeInsets.symmetric(vertical: 6),
        elevation: 3,
        color: Colors.grey.shade200,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
          child: ListTile(
            leading: CircleAvatar(
              radius: 30,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: FittedBox(
                    child: Text(
                  '\$${transaction.amount.toStringAsFixed(2)}',
                  style: TextStyle(
                      fontFamily: 'RobotoCondensed',
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic),
                )),
              ),
            ),
            title: Text(
              transaction.title,
              style: Theme.of(context).textTheme.title,
            ),
            subtitle: Text(
              DateFormat.yMMMMd().format(transaction.date),
            ),
            trailing: MediaQuery.of(context).size.width > 460
                ? FlatButton.icon(
                    icon: Icon(Icons.delete),
                    label: Text('Delete'),
                    textColor: Colors.black,
                    onPressed: () =>
                        deleteTx(transaction.id),
                  )
                : IconButton(
                    icon: Icon(Icons.delete),
                    color: Colors.black,
                    onPressed: () =>
                        deleteTx(transaction.id),
                  ),
          ),
        ),
      ),
    );
  }
}
