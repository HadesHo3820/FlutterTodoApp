import 'package:flutter/material.dart';
import 'package:project_todos_test/blocs/bloc_exports.dart';
import 'package:project_todos_test/models/task_model.dart';
import 'package:project_todos_test/widgets/tasks_list.dart';

class IncompletedTodosScreen extends StatelessWidget {
  IncompletedTodosScreen({Key? key}) : super(key: key);
  List<Task> listAllInCompletedTodos = [];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<Task> tasksList = state.allTasks;
        listAllInCompletedTodos =
            tasksList.where((element) => element.isDone == false).toList();
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Chip(
                  label: Text('${listAllInCompletedTodos.length} Incompleted')),
            ),
            TasksList(tasksList: listAllInCompletedTodos)
          ],
        );
      },
    );
  }
}
