import 'package:flutter/material.dart';
import 'package:todo_list/todolist.dart';
import 'package:splashscreen/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: Splash(),
    );
  }
}

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 6,
      navigateAfterSeconds: ToDoList(),
      title: const Text(
        'ToDo List',
        textScaleFactor: 2,
      ),
      image: Image.asset(
        'assets/images/todo.png',
        scale: 2,
      ),
      loadingText: const Text("Loading"),
      photoSize: 100.0,
      loaderColor: Colors.blueGrey,
    );
  }
}
