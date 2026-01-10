import 'package:flutter/material.dart';
import 'package:todoapp/util/my_button.dart';

// ignore: must_be_immutable
class DialogBox extends StatelessWidget {
  final TextEditingController controller;
  VoidCallback onSave;
  VoidCallback onCancel;
  DialogBox({super.key , required this.controller , required this.onCancel , required this.onSave,});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color(0xFFFFFFFF),
      // container with size of 300 to take information and add to cart
      content: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(1)
        ),

        height: 300,

        child: Padding(
          padding: const EdgeInsets.fromLTRB(25,50,25,50),
          child: Column(
            children: [
              // text field to input information 
              TextField(
                controller: controller,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color.fromARGB(255, 255, 255, 255),
                  border: OutlineInputBorder(),
                  hintText: 'Add a new task',
                  hintStyle:TextStyle(
                    color: const Color.fromARGB(255, 0, 0, 0)
                  )
                ),
                
              ),
              SizedBox(height: 30,),

              // button on to add the task and one to exit the dialog
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Row(children: [
                    MyButton(text: 'Add', onPressed: onSave,btnColor: const Color.fromARGB(255, 37, 141, 0),),
                  
                    MyButton(text: 'Cansel', onPressed: onCancel,btnColor: const Color.fromARGB(255, 0, 0, 0),),
                  ],),
                ),
              )
              
            ],
          ),
        ),
      ),
    );
  }
}