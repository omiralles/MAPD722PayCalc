import 'package:flutter/material.dart';
import 'package:mapd722_paycalculator_oscarmiralles/payment_calculator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: const Text('Payment Calculator'),
      ),
      body: const PaymentCalculator(),
    ));
  }
}
