import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todoapp/data/database.dart';
import 'package:todoapp/util/dialog_box.dart';
import 'package:todoapp/util/todo_list.dart';

// the Home page
class ToDoHome extends StatefulWidget {

  const ToDoHome({super.key});

  @override
  State<ToDoHome> createState() => _ToDoHomeState();
}

class _ToDoHomeState extends State<ToDoHome> {
  final _myBox = Hive.box('mybox');
  ToDoDataBase db = ToDoDataBase();

  @override
  void initState() {

    if(_myBox.get("TODOLIST") == null){
      db.initalData();
    }else{
      db.loadData();
    }

    super.initState();
  }
  final myController = TextEditingController();

  // To check the task
  void onChanged(bool? value, int index){
    setState(() {
      db.todolist[index][1] = !db.todolist[index][1];
    });
    db.updateData();
  }
  

  // createTask through dialog
  void createNewTask(){
    showDialog(context: context, builder: (context){
      return DialogBox(
        controller: myController,
        onCancel: () => Navigator.of(context).pop(),
        onSave: () {
          setState(() {
            db.todolist.add([myController.text,false]);
            myController.clear();
          });
          Navigator.of(context).pop();
          db.updateData();
        }, 
        
      );
      
    },);
  } 

  // remove the task 
  void onDelete(int index){
    setState(() {
      db.todolist.removeAt(index);
    });
  }


  @override
  Widget build(BuildContext context) {

    return  Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF121212),
          title: Text('TO DO' , style: TextStyle(
            color: Colors.white,
          ),),
          centerTitle: true,
        ),
        backgroundColor: const Color(0xFFE6E6E6),
        body: ListView.builder(
          // number of task equal it's length
          itemCount: db.todolist.length,
          itemBuilder: (context, index) {
            return TodoList(
              text: db.todolist[index][0], // name
              ischecked: db.todolist[index][1], // false or true
              onChanged: (value) => onChanged(value , index), // if pressed or not
              delete: (value) => onDelete(index), // to delete it 
            );
            
          },
        ),

        // to add a task through dialog
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xFF000000),
          onPressed: createNewTask,
          child: Icon(Icons.add, color:Colors.white ,),
        ),
      );
  }
}