import 'package:flutter/material.dart';

class OrdersScreen extends StatelessWidget {
  static const routeName= 'orders';
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Text('orders'),),
    );
  }
}
