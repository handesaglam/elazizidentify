import 'package:flutter/material.dart';
class ButtonColor extends StatelessWidget {
  const ButtonColor({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 160,
      child: Center(
        child: Text("View Hotels",
        style: TextStyle(color: Colors.white,
        fontSize: 18,fontWeight: FontWeight.w600
        
        ),
        ),
      ),

      decoration: BoxDecoration(
        border: Border.all(
            color:  Color.fromARGB(255, 14, 233, 21),
            width: 2.0,
            style: BorderStyle.solid
          ),
              color: Colors.green,
        borderRadius: BorderRadius.circular(25),
         
      ),
    );
  }
}