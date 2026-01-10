import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase{
  List todolist = [];
  final _myBox = Hive.box('mybox');

  void initalData(){
    todolist = [
      ['hi',false]
    ];
  }

  void loadData(){
    todolist = _myBox.get("TODOLIST");
  }

  void updateData(){
    _myBox.put("TODOLIST", todolist);
  }
}