import 'package:flutter/material.dart';
import 'package:todo_list/TaskItem.dart';
import 'Task.dart';
import 'add_task.dart';
import 'dart:async';

class ToDoList extends StatefulWidget {
  @override
  State<ToDoList> createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  List<Task> tasksList = [
    Task('Task1', 'Dis1', DateTime.now(), true),
    Task('Task2', 'Dis2', DateTime.now(), false),
  ];

  Timer timer;

  void changeState(int index) {
    bool current = !tasksList[index].state;
    setState(() {
      tasksList[index].setState(current);
    });
  }

  void deleteTask(int index) {
    setState(() {
      tasksList.remove(tasksList[index]);
    });
  }

  void addTask(Task task) {
    setState(() {
      tasksList.add(task);
    });
  }

  @override
  void initState() {
    super.initState();

    /// Initialize a periodic timer with 1 second duration
    timer = Timer.periodic(
      const Duration(minutes: 1),
      (timer) {
        setState(() {});
      },
    );
  }

  Widget build(BuildContext context) {
    setState(() {
      tasksList.sort((a, b) => a.expireDate.compareTo(b.expireDate));
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text('ToDo List'),
      ),
      body: Container(
        child: ListView.builder(
            itemCount: tasksList.length,
            itemBuilder: (context, index) {
              return TaskItem(
                task: tasksList[index],
                changeState: () => changeState(index),
                onDelete: () {
                  deleteTask(index);
                },
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightGreen,
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) => AddTask(
                addNewTask: addTask,
              ),
            ),
          );
        },
      ),
    );
  }
}
