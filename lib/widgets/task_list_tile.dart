import 'package:flutter/material.dart';
import 'package:project_todos_test/blocs/bloc_exports.dart';
import 'package:project_todos_test/models/task_model.dart';

class TaskListTile extends StatelessWidget {
  const TaskListTile({
    Key? key,
    required this.task,
  }) : super(key: key);

  final Task task;

  void _removeOrDeleteTask(BuildContext context, Task task) {
    task.isDeleted!
        ? context.read<TasksBloc>().add(DeleteTask(task: task))
        : context.read<TasksBloc>().add(RemoveTask(task: task));
  }

  @override
  Widget build(BuildContext context) {
    bool isTaskDeleted = task.isDeleted!;
    return ListTile(
      title: Text(
        task.title,
        style: TextStyle(
            decoration: task.isDone! ? TextDecoration.lineThrough : null),
      ),
      trailing: IconButton(
        onPressed: () => _removeOrDeleteTask(context, task),
        icon: Icon(isTaskDeleted
            ? Icons.remove_circle_outline_outlined
            : Icons.delete),
        color: Colors.red,
      ),
      leading: Checkbox(
          value: task.isDone,
          onChanged: isTaskDeleted
              ? null
              : (newVale) {
                  context.read<TasksBloc>().add(UpdateTask(task: task));
                }),
    );
  }
}
