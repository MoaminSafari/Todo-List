import 'package:flutter/material.dart';
import 'Task.dart';
import 'package:intl/intl.dart';

class AddTask extends StatefulWidget {
  final Function addNewTask;

  AddTask({this.addNewTask});

  @override
  State<StatefulWidget> createState() {
    return _AddTask();
  }
}

class _AddTask extends State<AddTask> {
  TextEditingController titleC;
  TextEditingController descC;
  DateTime pickedDate;
  @override
  void initState() {
    titleC = TextEditingController();
    descC = TextEditingController();
    pickedDate = DateTime.now();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ToDo List'),
      ),
      body: Container(
        color: Colors.white30,
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              decoration: const InputDecoration(
                  icon: Icon(Icons.title_outlined),
                  iconColor: Colors.blueGrey,
                  labelText: 'Title'),
              controller: titleC,
              keyboardType: TextInputType.text,
            ),
            TextField(
              decoration: const InputDecoration(
                  icon: Icon(Icons.description_outlined),
                  iconColor: Colors.blueGrey,
                  labelText: 'Description'),
              controller: descC,
              keyboardType: TextInputType.text,
              maxLines: 10,
            ),
            ElevatedButton(
              onPressed: () {
                _selectDate(context);
              },
              child: const Text("Choose Date"),
            ),
            ElevatedButton(
              onPressed: () {
                _selectTime(context);
              },
              child: const Text("Choose Time"),
            ),
            Text(
                "${DateFormat('yMMMEd').format(pickedDate)} ${DateFormat('jm').format(pickedDate)}"),
            ElevatedButton(
                onPressed: () {
                  Task task = Task(titleC.text, descC.text, pickedDate, false);
                  widget.addNewTask(task);
                  Navigator.pop(context);
                },
                child: const Icon(Icons.add))
          ],
        ),
      ),
    );
  }

  _selectDate(BuildContext context) async {
    final DateTime selected = await showDatePicker(
      context: context,
      initialDate: pickedDate,
      firstDate: DateTime(2022),
      lastDate: DateTime(2032),
    );
    if (selected != null && selected != pickedDate) {
      setState(() {
        pickedDate = selected;
      });
    }
  }

  _selectTime(BuildContext context) async {
    final TimeOfDay selected = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(pickedDate),
    );
    if (selected != null && selected != TimeOfDay.fromDateTime(pickedDate)) {
      setState(() {
        pickedDate = DateTime(pickedDate.year, pickedDate.month, pickedDate.day,
            selected.hour, selected.minute);
      });
    }
  }
}
