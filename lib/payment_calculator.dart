import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './about_dialog.dart';

class PaymentCalculator extends StatefulWidget {
  const PaymentCalculator({super.key});

  @override
  State<PaymentCalculator> createState() => _PaymentCalculatorState();
}

class _PaymentCalculatorState extends State<PaymentCalculator> {
  //Result report labels
  String regular = "regular pay";
  String overtime = "overtime pay";
  String total = "total pay";
  String tax = "tax";

  @override
  Widget build(BuildContext context) {
    //Variables for imputs and calculation
    final hours = TextEditingController();
    final rate = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          margin:
              const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 68),
          color: Colors.grey,
          child: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                color: Colors.white,
                child: TextField(
                  controller: hours,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  decoration: InputDecoration(
                      labelText: "Number of hours",
                      labelStyle:
                          const TextStyle(fontSize: 15, color: Colors.black),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(0))),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                color: Colors.white,
                child: TextField(
                  controller: rate,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  decoration: InputDecoration(
                      labelText: "Hourly rate",
                      labelStyle:
                          const TextStyle(fontSize: 15, color: Colors.black),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(0))),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              GestureDetector(
                onTap: () {
                  double _hours = 0;
                  double _rate = 0;
                  double _regular = 0;
                  double _overtime = 0;
                  double _total = 0;
                  double _tax = 0;

                  if (hours.text != "") {
                    _hours = double.parse(hours.text);
                  }

                  if (rate.text != "") {
                    _rate = double.parse(rate.text);
                  }

                  if (_hours <= 40) {
                    _regular = _hours * _rate;
                  } else {
                    _regular = 40 * _rate;
                    _overtime = ((_hours - 40) * (_rate * 1.5));
                  }

                  _total = _regular + _overtime;
                  _tax = _total * 0.18;

                  regular = "";
                  overtime = "";
                  total = "";
                  tax = "";

                  setState(() {
                    regular = "regular pay $_regular";
                    overtime = "overtime pay $_overtime";
                    total = "total pay $_total";
                    tax = "tax $_tax";
                  });
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: 200,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(5)),
                  child: const Text(
                    "Calculate",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                color: Colors.white,
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  children: [
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Report",
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(regular,
                          style: const TextStyle(
                              fontSize: 16, color: Colors.black)),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(overtime,
                          style: const TextStyle(
                              fontSize: 16, color: Colors.black)),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(total,
                          style: const TextStyle(
                              fontSize: 16, color: Colors.black)),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(tax,
                          style: const TextStyle(
                              fontSize: 16, color: Colors.black)),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                color: Colors.white,
                child: const StudentDialog(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
