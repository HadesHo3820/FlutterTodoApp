import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:project_todos_test/blocs/bloc_exports.dart';
import 'package:project_todos_test/models/task_model.dart';
import 'package:uuid/uuid.dart';

void main() {
  group('TaskBloc', () {
    TasksBloc? taskBloc;
    Uuid uuid = const Uuid();

    final Task task =
        Task(title: "Test 1", description: "Hello Test 1", id: uuid.v1());

    setUp(() {
      taskBloc = TasksBloc();
    });
    tearDown(() {
      taskBloc?.close();
    });
    test(
        'The initial state for Task Bloc is TaskState(allTasks: [], removedTask: [])',
        () {
      expect(taskBloc?.state, const TasksState(allTasks: [], removedTask: []));
    });

    blocTest<TasksBloc, TasksState>(
        'emits [TaskState(allTask: [Task()])] when AddTask is added',
        build: () => taskBloc!,
        act: (bloc) => bloc.add(AddTask(task: task)),
        expect: () => <TasksState>[
              TasksState(allTasks: [task], removedTask: const [])
            ]);

    blocTest<TasksBloc, TasksState>(
        'emits [TaskState(allTask: [Task.copyWith(isDone: true)])] when UpdateTask is added',
        build: () => taskBloc!,
        act: (bloc) {
          bloc.add(AddTask(task: task));
          bloc.add(UpdateTask(task: task));
        },
        expect: () => [
              TasksState(allTasks: [task], removedTask: const []),
              TasksState(
                  allTasks: [task.copyWith(isDone: true)],
                  removedTask: const []),
            ]);

    blocTest<TasksBloc, TasksState>(
        'emits [TaskState(allTask: [], removedTask: [Task.copyWith(isDeleted: true)])] when RemoveTask is added',
        build: () => taskBloc!,
        act: (bloc) {
          bloc.add(AddTask(task: task));
          bloc.add(RemoveTask(task: task));
        },
        expect: () => [
              TasksState(allTasks: [task], removedTask: const []),
              TasksState(
                  allTasks: const [],
                  removedTask: [task.copyWith(isDeleted: true)]),
            ]);

    blocTest<TasksBloc, TasksState>(
        'emits [TaskState(allTask: [], removedTask: [] when DeleteTask is added',
        build: () => taskBloc!,
        act: (bloc) {
          bloc.add(AddTask(task: task));
          bloc.add(RemoveTask(task: task));
          bloc.add(DeleteTask(task: task.copyWith(isDeleted: true)));
        },
        expect: () => [
              TasksState(allTasks: [task], removedTask: const []),
              TasksState(
                  allTasks: const [],
                  removedTask: [task.copyWith(isDeleted: true)]),
              const TasksState(allTasks: [], removedTask: [])
            ]);
  });
}
