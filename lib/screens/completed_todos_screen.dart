import 'package:flutter/material.dart';
import 'package:project_todos_test/blocs/bloc_exports.dart';
import 'package:project_todos_test/models/task_model.dart';
import 'package:project_todos_test/widgets/tasks_list.dart';

class CompletedTodosScreen extends StatelessWidget {
  CompletedTodosScreen({Key? key}) : super(key: key);

  List<Task> listAllCompletedTodos = [];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<Task> tasksList = state.allTasks;
        listAllCompletedTodos =
            tasksList.where((element) => element.isDone == true).toList();
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Chip(
                  label: Text('${listAllCompletedTodos.length} Completed')),
            ),
            TasksList(tasksList: listAllCompletedTodos)
          ],
        );
      },
    );
  }
}
