import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Column(
        
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                alignment: Alignment.bottomRight,
                padding: EdgeInsets.all(16.0),
                child: Text('000000000000000000000000000000',
                              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold
                              ),
                              textAlign: TextAlign.end,),
              ),
            ),
          )
        ],

      )),
    );
  }
}