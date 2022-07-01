import 'package:flutter/material.dart';
import 'package:project_todos_test/app.dart';
import 'package:project_todos_test/blocs/bloc_exports.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // final storage = await HydratedStorage.build(
  //     storageDirectory: await getApplicationDocumentsDirectory());
  // HydratedBlocOverrides.runZoned(() => runApp(const App()), storage: storage);
  BlocOverrides.runZoned(() => runApp(const App()));
}
