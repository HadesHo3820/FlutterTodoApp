import 'package:flutter/material.dart';
import 'package:project_todos_test/blocs/bloc_exports.dart';
import 'package:project_todos_test/constants/constant_text.dart';
import 'package:project_todos_test/screens/navigation_screen.dart';
import 'package:project_todos_test/screens/recycle_bin_screen.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => TasksBloc()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: {
            RouteNames.onGenerateRouteName: (context) =>
                const NavigationScreen(),
            RouteNames.recycleBinScreen: (context) => const RecycleBinScreen()
          },
        ));
  }
}
