import 'package:flutter/material.dart';
//import 'package:flutter/foundation.dart';
// yeh bhi use kr sakte hai material ki jagah

class Transaction {
  final String id;
  final String title;
  final double amount;
  final DateTime date;

  Transaction({
    @required this.id,
    @required this.title,
    @required this.amount,
    @required this.date,
  });
}
