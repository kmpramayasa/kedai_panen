import 'package:flutter/material.dart';
import 'package:layout/models/orders_model.dart';

class TransactionDetailScreen extends StatefulWidget {

  TransactionDetailScreen({Key key, this.orders})
  :super(key: key);

  final Orders orders;

  @override
  _TransactionDetailScreenState createState() => _TransactionDetailScreenState();
}

class _TransactionDetailScreenState extends State<TransactionDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
    );
  }
}