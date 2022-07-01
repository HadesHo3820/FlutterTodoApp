import 'package:flutter/material.dart';
import 'package:project_todos_test/blocs/bloc_exports.dart';
import 'package:project_todos_test/models/task_model.dart';
import 'package:uuid/uuid.dart';

class AddTaskWidget extends StatefulWidget {
  const AddTaskWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<AddTaskWidget> createState() => _AddTaskWidgetState();
}

class _AddTaskWidgetState extends State<AddTaskWidget> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          const Text(
            'Add Task',
            style: TextStyle(fontSize: 24),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
            child: TextField(
              controller: titleController,
              autofocus: true,
              maxLength: 40,
              maxLines: 2,
              decoration: const InputDecoration(
                  hintText: 'Add title text',
                  label: Text('Title'),
                  border: OutlineInputBorder()),
            ),
          ),
          TextField(
            controller: descriptionController,
            autofocus: true,
            maxLength: 200,
            maxLines: 5,
            decoration: const InputDecoration(
                hintText: 'Add description text',
                label: Text('Description'),
                border: OutlineInputBorder()),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 80,
                height: 40,
                child: TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Cancel')),
              ),
              SizedBox(
                width: 100,
                height: 40,
                child: ElevatedButton(
                    onPressed: () {
                      var uuid = const Uuid();
                      var task = Task(
                          title: titleController.text,
                          id: uuid.v1(),
                          description: descriptionController.text);
                      context.read<TasksBloc>().add(AddTask(task: task));
                      titleController.text = "";
                      Navigator.pop(context);
                    },
                    child: const Text('Add')),
              )
            ],
          ),
        ],
      ),
    );
  }
}
