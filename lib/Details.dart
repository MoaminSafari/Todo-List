import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:todo_list/Task.dart';
import 'package:intl/intl.dart';

class Details extends StatefulWidget {
  const Details({Key key, this.task, this.changeState}) : super(key: key);
  final Task task;
  final Function changeState;
  @override
  State<Details> createState() => _Details();
}

class _Details extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ToDo List'),
      ),
      body: Container(
        color: Colors.white70,
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(
                icon: const Icon(Icons.title_outlined),
                iconColor: Colors.blueGrey,
                border: const OutlineInputBorder(),
                hintText: widget.task.title,
              ),
              enabled: false,
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: TextField(
                decoration: InputDecoration(
                  icon: const Icon(Icons.description_outlined),
                  iconColor: Colors.blueGrey,
                  border: const OutlineInputBorder(),
                  hintText: widget.task.description,
                ),
                enabled: false,
                maxLines: 10,
              ),
            ),
            TextField(
              decoration: InputDecoration(
                icon: const Icon(Icons.calendar_month_outlined),
                iconColor: Colors.blueGrey,
                border: const OutlineInputBorder(),
                hintText:
                    "${DateFormat('yMMMEd').format(widget.task.expireDate)} ${DateFormat('jm').format(widget.task.expireDate)}",
              ),
              enabled: false,
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Status    '),
                  FlutterSwitch(
                    activeColor: Colors.blueGrey,
                    width: 50,
                    height: 25,
                    value: widget.task.state,
                    showOnOff: false,
                    onToggle: (val) {
                      setState(() {
                        widget.changeState();
                      });
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
