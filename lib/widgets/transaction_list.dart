import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';
import 'transction_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    // print('build() TransactionList');
    return transactions.isEmpty
        ? LayoutBuilder(
            builder: ((context, constraints) {
              return Column(
                children: [
                  Text(
                    'No transactions added yet',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: constraints.maxHeight * 0.6,
                    child: Image.asset(
                      'assets/fonts/images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              );
            }),
          )
        : ListView(
            children: transactions
                .map((tx) => TransactionItem(
                      key: ValueKey(tx.id),
                      transaction: tx,
                      deleteTx: deleteTx,
                    ))
                .toList(),
            // return Card(
            //   child: Row(children: [
            //     Container(
            //       margin: EdgeInsets.symmetric(
            //         vertical: 10,
            //         horizontal: 15,
            //       ),
            //       decoration: BoxDecoration(
            //         border: Border.all(
            //           // color: Colors.purple,
            //           color: Theme.of(context).primaryColor,
            //           width: 2,
            //         ),
            //       ),
            //       padding: EdgeInsets.all(10),
            //       child: Text(
            //         //STRING INTERPOLATION K USE KAR RHE  HAI
            //         //tx.amount.toString(),
            //         '₹ ${transactions[index].amount.toStringAsFixed(2)}',
            //         // agar dollar sign use krna hai pr dollar interpoltion
            //         // ke liye use ho raha hia yaha toh (\)  yeh laga ke use kar sakte hai '\$${tx.amount}',
            //         style: TextStyle(
            //           fontSize: 20,
            //           fontWeight: FontWeight.bold,
            //           // color: Colors.purple,
            //           color: Theme.of(context).primaryColor,
            //         ),
            //       ),
            //     ),
            //     Column(
            //       //mainAxisAlignment: MainAxisAlignment.start,
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         Text(
            //           transactions[index].title,
            //           style: Theme.of(context).textTheme.headline6,
            //           // style: TextStyle(
            //           //   fontSize: 16,
            //           //   fontWeight: FontWeight.bold,
            //           // ),
            //         ),
            //         Text(
            //           DateFormat('dd/MM/yyyy')
            //               .format(transactions[index].date),
            //           style: TextStyle(
            //             fontSize: 12,
            //             color: Colors.grey,
            //           ),
            //         ),
            //       ],
            //     )
            //   ]),
            // );

            //itemCount: transactions.length,
            //children: transactions.map((tx) {}).toList(),
          );
  }
}
