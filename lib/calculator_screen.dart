import 'package:calculator_app/button_values.dart';
import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  @override
  Widget build(BuildContext context) {
    final screenSize=MediaQuery.of(context).size;
    return Scaffold(
      
      body: SafeArea(
        bottom: false,
        
        child: Column(
        
        children: [
          Expanded(
            child: SingleChildScrollView(
              reverse: true,
              child: Container(
                alignment: Alignment.bottomRight,
                padding:  const EdgeInsets.all(16.0),
                child: Text('0',
                              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold
                              ),
                              textAlign: TextAlign.end,
                              ),
              ),
            ),
          ),
           Wrap(
          children: Btn.buttonvalues.map((value)=>
          SizedBox(
            width:value==Btn.n0?screenSize.width/2: (screenSize.width/4),

          
            height: screenSize.height/9,
            child: buildButton(value),
          ),
          ).toList()
          
        ),
        ],
       

      )),
    );
  }
    

  Widget buildButton(value){
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Material(
          clipBehavior: Clip.hardEdge,
          color: [Btn.del,Btn.clr].contains(value)
          ?Colors.blueGrey
          :[Btn.divide,
          Btn.multiply,
          Btn.add,
          Btn.subtract,
          Btn.per,
          Btn.calculate].contains(value)
          ?Colors.orange
          :Colors.black87,
          shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100.0),
            borderSide: const BorderSide(
              color: Colors.white24,
            ),
            ),
            child: InkWell(
              onTap: (){

              },
              child: Center(
                child: Text(value,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.white,
                ),
                            ),
              ),
            ),
          ),
          );
        
      
    
  
  }
}