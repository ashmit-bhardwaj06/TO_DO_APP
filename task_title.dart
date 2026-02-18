import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/task_model.dart';
import '../providers/task_provider.dart';

class TaskTile extends StatelessWidget {
  final Task task;
  final int index;

  TaskTile({required this.task, required this.index});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        value: task.isCompleted,
        onChanged: (_) {
          Provider.of<TaskProvider>(context, listen: false)
              .toggleTask(index);
        },
      ),
      title: Text(
        task.title,
        style: TextStyle(
          decoration: task.isCompleted
              ? TextDecoration.lineThrough
              : TextDecoration.none,
        ),
      ),
      subtitle: Text(task.category),
      trailing: IconButton(
        icon: Icon(Icons.delete, color: Colors.red),
        onPressed: () {
          Provider.of<TaskProvider>(context, listen: false)
              .deleteTask(index);
        },
      ),
    );
  }
}
