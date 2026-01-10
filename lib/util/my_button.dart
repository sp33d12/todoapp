import 'package:flutter/material.dart';


class MyButton extends StatelessWidget {

  final String text; 
  final VoidCallback onPressed;
  final Color? btnColor;
  const MyButton({super.key, required this.text , required this.onPressed,required this.btnColor});

  // just a button class
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: MaterialButton(
        padding: EdgeInsets.all(10),
        color: btnColor,
        onPressed: onPressed , child: Text(text , style: TextStyle(
          color: Colors.white
        ),),),
    );
  }
}