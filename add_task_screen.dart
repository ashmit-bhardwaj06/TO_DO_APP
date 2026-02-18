import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/task_model.dart';
import '../providers/task_provider.dart';

class AddTaskScreen extends StatefulWidget {
  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  String category = "Work";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Task")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(labelText: "Task Title"),
                validator: (value) =>
                    value!.isEmpty ? "Enter task title" : null,
              ),
              DropdownButtonFormField(
                value: category,
                items: ["Work", "Personal", "Study"]
                    .map((cat) => DropdownMenuItem(
                          value: cat,
                          child: Text(cat),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    category = value!;
                  });
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                child: Text("Add Task"),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Provider.of<TaskProvider>(context, listen: false)
                        .addTask(Task(
                      title: _titleController.text,
                      category: category,
                    ));
                    Navigator.pop(context);
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
