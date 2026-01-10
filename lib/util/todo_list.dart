
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';


// ignore: must_be_immutable
class TodoList extends StatelessWidget {
  String text;
  bool ischecked;
  Function(bool?)? onChanged;
  Function(BuildContext?) delete;
  TodoList({super.key ,
  required this.text , 
  required this.ischecked ,
  required this.onChanged,
  required this.delete
  
  });
  
 


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25, 15, 25, 15),
      // the slidable used to delete animation 
      child: Slidable(
        endActionPane: ActionPane(motion:  StretchMotion(), 
        children: [
        SlidableAction(
        borderRadius: BorderRadius.circular(12),
        onPressed: delete ,
        icon: Icons.delete,
        backgroundColor: Colors.red,
        )
        ]
        ),

        // box that have the task
        child: Container(
          
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: const Color(0xFFFFFFFF),
          ),
          child: Row(
            children: [
              // check box
              Checkbox(value:ischecked, onChanged:onChanged ,
              checkColor: const Color.fromARGB(255, 255, 255, 255),
              activeColor: const Color(0xFF4CAF50),
              ),

              // text 
              Text( text ,
              style:TextStyle(
                // cool shit 
                decoration: ischecked ? TextDecoration.lineThrough: TextDecoration.none
              ) 
              ),
            ],
          ),
        ),
      ),
    );
  }
}