import 'package:flutter/material.dart';
import 'package:project_todos_test/blocs/bloc_exports.dart';
import 'package:project_todos_test/constants/constant_text.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Drawer(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
            color: Colors.blue,
            alignment: Alignment.center,
            child: Text(
              'Manabie Todos App',
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(color: Colors.white),
            ),
          ),
          BlocBuilder<TasksBloc, TasksState>(
            builder: (context, state) {
              return ListTile(
                leading: const Icon(Icons.folder_special),
                title: const Text('My Tasks'),
                trailing: Text('${state.allTasks.length}'),
                onTap: () => Navigator.of(context)
                    .pushNamed(RouteNames.onGenerateRouteName),
              );
            },
          ),
          const Divider(),
          BlocBuilder<TasksBloc, TasksState>(
            builder: (context, state) {
              return ListTile(
                leading: const Icon(Icons.delete),
                title: const Text('Bin'),
                trailing: Text('${state.removedTask.length}'),
                onTap: () => Navigator.of(context)
                    .pushNamed(RouteNames.recycleBinScreen),
              );
            },
          )
        ],
      ),
    ));
  }
}
