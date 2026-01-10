import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todoapp/pages/home_page.dart';

// run the app
Future<void> main() async {
  await Hive.initFlutter();
  await Hive.openBox('mybox');
  runApp(const ToDo());
}


// Call the Home page
class ToDo extends StatelessWidget {
  const ToDo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:ToDoHome(),
    );
  }
}