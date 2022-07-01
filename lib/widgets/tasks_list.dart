import 'package:flutter/material.dart';
import 'package:project_todos_test/models/task_model.dart';
import 'package:project_todos_test/widgets/task_list_tile.dart';

class TasksList extends StatelessWidget {
  final List<Task> tasksList;
  const TasksList({
    Key? key,
    required this.tasksList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: ExpansionPanelList.radio(
          children: tasksList
              .map((task) => ExpansionPanelRadio(
                  value: task.id,
                  headerBuilder: (context, isOpen) => TaskListTile(task: task),
                  body: Container(
                    padding: const EdgeInsets.only(left: 20),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Title',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(task.title),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Description',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(task.description),
                      ],
                    ),
                  )))
              .toList(),
        ),
      ),
    );
  }
}
