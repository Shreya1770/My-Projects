import 'package:calculator_app/button_values.dart';
import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
 
}

class _CalculatorScreenState extends State<CalculatorScreen> {
   String num1="";
  String operator="";
  String num2="";
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
                child: Text('$num1$operator$num2'.isEmpty?"0":'$num1$operator$num2',
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
            borderRadius: BorderRadius.circular(50.0),
            borderSide: const BorderSide(
              color: Colors.white24,
            ),
            ),
            child: InkWell(
              onTap: ()=>onBtnTap(value),
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
          void onBtnTap( String value){
            if(value==Btn.clr){
              setState(() {
                num1="";
                num2="";
                operator="";
              });
            }
            else if(value==Btn.del){
              if( num2.isNotEmpty){
                setState(() {
                  num2=num2.substring(0,num2.length-1);
                });
              }
              else if(operator.isNotEmpty){
                setState(() {
                  operator="";
                });
              }else{
                setState(() {
                  num1=num1.substring(0,num1.length-1);
                });
              }
            }
            else if([Btn.add,Btn.subtract,Btn.multiply,Btn.divide].contains(value)){
              if(operator.isNotEmpty && num2.isNotEmpty){
                calculateResult();
              }
              setState(() {
                operator=value;
              });
            }
            else if(value==Btn.calculate){
              calculateResult();
            }
            else{
              if(operator.isEmpty){
                num1+=value;
              }
              else{
                num2+=value;
              }
            }
            

          }
          void calculateResult(){
            if(num1.isEmpty||operator.isEmpty || num2.isEmpty)return;

          double n1=double.parse(num1);
          double n2=double.parse(num2);
          double result=0.0;

          switch(operator){
            case Btn.add:
            result=n1+n2;
            break;
            case Btn.subtract:
            result=n1-n2;
            break;
            case Btn.multiply:
            result=n1*n2;
            break;
            case Btn.divide:
            if(n2!=0)result=n1/n2;
            else{
              print("division by zero is not possible");
            }
            break;
            case Btn.per:
            result=(n1*n2)/100;
            break;
          }
          setState(() {
            num1=result.toStringAsFixed(2).replaceAll(RegExp(r"\.0+$"),"");
            num2="";
            operator="";
          });
            

          }
        
        
      
    
  
  }
