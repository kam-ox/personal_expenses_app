import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;
  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      child: transactions.isEmpty
          ? Column(
              children: [
                Text(
                  'No transactions added yet!',
                  style: Theme.of(context).textTheme.title,
                ),
                SizedBox(
                  height: 20,
                ),
                Flexible(
                    //height: 200,
                    child: Image.asset(
                  'assets/images/waiting.png',
                  height: 170,
                  fit: BoxFit.cover,
                )),
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 9),
                  child: Card(
                    shape: RoundedRectangleBorder( //Rounding card corners
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
                              '\$${transactions[index].amount.toStringAsFixed(2)}',
                              style: TextStyle(
                                  fontFamily: 'RobotoCondensed',
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic),
                            )),
                          ),
                        ),
                        title: Text(
                          transactions[index].title,
                          style: Theme.of(context).textTheme.title,
                        ),
                        subtitle: Text(
                          DateFormat.yMMMMd().format(transactions[index].date),
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          color: Colors.black,
                          onPressed: () => deleteTx(transactions[index].id),
                        ),
                      ),
                    ),
                  ),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
