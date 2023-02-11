import 'package:flutter/material.dart';
import 'package:flutter_challenges/core/utilis/app_strings/app_strings_screen.dart';

class OrdersScreen extends StatelessWidget {
  static const String routeName = '/orders';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.orders),
      ),
      body: Center(
        child: Text('Orders Screen.'),
      ),
    );
  }
}