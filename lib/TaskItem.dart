import 'package:flutter/material.dart';
import 'package:todo_list/Task.dart';
import 'Details.dart';

class TaskItem extends StatelessWidget {
  final Task task;
  final Function changeState;
  final Function onDelete;

  TaskItem({this.task, this.changeState, this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
          textColor: task.state ? Colors.white : Colors.lightGreen,
          tileColor: task.expireDate.isBefore(DateTime.now())
              ? const Color.fromARGB(255, 159, 28, 28)
              : (task.state ? Colors.lightGreen : Colors.white),
          leading: GestureDetector(
            onTap: () {
              changeState();
            },
            child: task.state
                ? const Icon(
                    Icons.check_box,
                    color: Colors.white,
                  )
                : const Icon(Icons.check_box_outline_blank),
          ),
          title: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Details(
                    task: task,
                    changeState: changeState,
                  ),
                ),
              );
            },
            child: Text(task.title),
          ),
          subtitle: Text(task.description),
          trailing: GestureDetector(
            onTap: onDelete,
            child: Icon(Icons.delete_forever,
                color: task.expireDate.isBefore(DateTime.now())
                    ? Colors.white
                    : const Color.fromARGB(255, 159, 28, 28)),
          )),
    );
  }
}
