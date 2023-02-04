import 'package:flutter/material.dart';

class StudentDialog extends StatelessWidget {
  const StudentDialog({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 50,
            margin: const EdgeInsets.only(top: 20),
            color: Colors.grey[800],
            alignment: Alignment.bottomCenter,
            child: const Text("Oscar Miralles",
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
          ),
          Container(
            height: 50,
            color: Colors.grey[800],
            alignment: Alignment.topCenter,
            child: const Text("301250756",
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}
