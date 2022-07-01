import 'package:flutter/material.dart';
import 'package:project_todos_test/blocs/bloc_exports.dart';
import 'package:project_todos_test/widgets/my_drawer.dart';
import 'package:project_todos_test/widgets/tasks_list.dart';

class RecycleBinScreen extends StatelessWidget {
  const RecycleBinScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        return Scaffold(
          drawer: const MyDrawer(),
          appBar: AppBar(title: const Text('Recycle Bin')),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Chip(label: Text('${state.removedTask.length} Tasks')),
              ),
              TasksList(tasksList: state.removedTask)
            ],
          ),
        );
      },
    );
  }
}
