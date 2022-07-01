import 'package:flutter/material.dart';
import 'package:project_todos_test/blocs/bloc_exports.dart';
import 'package:project_todos_test/models/task_model.dart';
import 'package:project_todos_test/widgets/tasks_list.dart';

class AllTodosScreen extends StatelessWidget {
  AllTodosScreen({Key? key}) : super(key: key);
  List<Task> listIncompletedTask = [];
  List<Task> listCompletedTask = [];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<Task> tasksList = state.allTasks;
        listCompletedTask =
            tasksList.where((element) => element.isDone == true).toList();
        listIncompletedTask =
            tasksList.where((element) => element.isDone == false).toList();
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Chip(
                  label: Text(
                      '${listCompletedTask.length} Completed | ${listIncompletedTask.length} Incompleted')),
            ),
            TasksList(tasksList: tasksList)
          ],
        );
      },
    );
  }
}
