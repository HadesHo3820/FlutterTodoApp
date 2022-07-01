import 'package:flutter/material.dart';
import 'package:project_todos_test/screens/all_todos_screen.dart';
import 'package:project_todos_test/screens/completed_todos_screen.dart';
import 'package:project_todos_test/screens/incompleted_todos_screen.dart';
import 'package:project_todos_test/widgets/add_task_widget.dart';
import 'package:project_todos_test/widgets/my_drawer.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({Key? key}) : super(key: key);

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int _currentIndex = 0;
  String _titleAppbar = "All Todo Tasks";
  List<Widget> listScreens = [
    AllTodosScreen(),
    IncompletedTodosScreen(),
    CompletedTodosScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          _titleAppbar,
          style: const TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
      body: listScreens[_currentIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addTask(context),
        tooltip: "Add Task",
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          items: [
            buildBottomNavigationBarItem("Todos", Icons.list, 0),
            buildBottomNavigationBarItem(
                "Incompleted", Icons.incomplete_circle, 1),
            buildBottomNavigationBarItem("Completed", Icons.check, 2)
          ],
          currentIndex: _currentIndex,
          onTap: (selectedIndex) {
            switch (selectedIndex) {
              case 0:
                _titleAppbar = "All Todo Tasks";
                break;
              case 1:
                _titleAppbar = "All Incompleted Tasks";
                break;
              case 2:
                _titleAppbar = "All Completed Tasks";
                break;
            }
            setState(() {
              _currentIndex = selectedIndex;
            });
          }),
    );
  }

  BottomNavigationBarItem buildBottomNavigationBarItem(
      String title, IconData iconData, int index) {
    return BottomNavigationBarItem(
        icon: Icon(
          iconData,
          color: _currentIndex == index ? Colors.blue : Colors.black12,
        ),
        backgroundColor: Colors.white,
        label: title);
  }

  void _addTask(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) => Container(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: const SingleChildScrollView(child: AddTaskWidget()),
            ));
  }
}
