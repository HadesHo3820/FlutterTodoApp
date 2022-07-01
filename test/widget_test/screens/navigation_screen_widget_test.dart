import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:project_todos_test/blocs/bloc_exports.dart';
import 'package:project_todos_test/screens/all_todos_screen.dart';
import 'package:project_todos_test/screens/completed_todos_screen.dart';
import 'package:project_todos_test/screens/incompleted_todos_screen.dart';
import 'package:project_todos_test/screens/navigation_screen.dart';
import 'package:mocktail/mocktail.dart';
import '../../hanlder_test/router_help.dart' as setRoute;

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

class MyFakeType extends Fake implements Route {}

void main() async {
  NavigatorObserver mockObserver = MockNavigatorObserver();
  setUp(() => {registerFallbackValue(MyFakeType())});
  final bloc = TasksBloc();
  final _widget = MaterialApp(
    home: BlocProvider.value(
      value: bloc,
      child: const NavigationScreen(),
    ),
    onGenerateRoute: setRoute.Router.generateRoute,
    navigatorObservers: [mockObserver],
    //
  );
  testWidgets("Should render bottom navigation bar",
      (WidgetTester tester) async {
    //Build widget to test for
    await tester.pumpWidget(_widget);
    final bottomNaviationBarFinder = find.byType(BottomNavigationBar);
    expect(bottomNaviationBarFinder, findsOneWidget);
  });

  testWidgets("Should render AllTodoScreen first", (WidgetTester tester) async {
    await tester.pumpWidget(_widget);
    final _screenFinder = find.descendant(
        of: find.byType(Scaffold), matching: find.byType(AllTodosScreen));
    print(_screenFinder);
    expect(_screenFinder, findsOneWidget);
  });

  testWidgets('Should render Icons.list, Icons.incomplete_circle, Icons.check',
      (tester) async {
    const iconDataList = Icons.list;
    const iconDataIncomplete = Icons.incomplete_circle;
    const iconDataCheck = Icons.check;
    await tester.pumpWidget(_widget);
    final bottomNavigationBarFinder = find.byType(BottomNavigationBar);
    final iconFinder = find.descendant(
        of: bottomNavigationBarFinder, matching: find.byType(Icon));
    final List<Icon> _listIcon = tester.widgetList<Icon>(iconFinder).toList();
    expect(_listIcon[0].icon, iconDataList);
    expect(_listIcon[1].icon, iconDataIncomplete);
    expect(_listIcon[2].icon, iconDataCheck);
  });

  testWidgets(
      'Should render icon have correct color Colors.blue and navigate to IncompletedTodosScreen when tap Incompleted icon',
      (tester) async {
    await tester.pumpWidget(_widget);
    await tester.tap(find.text('Incompleted'));
    await tester.pump();
    final bottomNavitationBarFinder = find.byType(BottomNavigationBar);

    final iconFinder = find.descendant(
        of: bottomNavitationBarFinder, matching: find.byType(Icon));
    final List<Icon> listIcon = tester.widgetList<Icon>(iconFinder).toList();
    final _screenFinder = find.descendant(
        of: find.byType(Scaffold),
        matching: find.byType(IncompletedTodosScreen));
    expect(_screenFinder, findsOneWidget);
    expect(listIcon[0].color, Colors.black12);
    expect(listIcon[1].color, Colors.blue);
    expect(listIcon[2].color, Colors.black12);
  });

  testWidgets(
      'Should render icon have correct color Colors.blue and navigate to CompletedTodosScreen when tap check icon',
      (tester) async {
    await tester.pumpWidget(_widget);
    await tester.tap(find.text('Completed'));
    await tester.pump();
    final bottomNavitationBarFinder = find.byType(BottomNavigationBar);

    final iconFinder = find.descendant(
        of: bottomNavitationBarFinder, matching: find.byType(Icon));
    final List<Icon> listIcon = tester.widgetList<Icon>(iconFinder).toList();
    final _screenFinder = find.descendant(
        of: find.byType(Scaffold), matching: find.byType(CompletedTodosScreen));
    expect(_screenFinder, findsOneWidget);
    expect(listIcon[0].color, Colors.black12);
    expect(listIcon[1].color, Colors.black12);
    expect(listIcon[2].color, Colors.blue);
  });

  testWidgets(
      'Should render icon have correct color Colors.blue and navigate to AllTodosScreen when tap list icon',
      (tester) async {
    await tester.pumpWidget(_widget);
    await tester.tap(find.text('Todos'));
    await tester.pump();
    final bottomNavitationBarFinder = find.byType(BottomNavigationBar);

    final iconFinder = find.descendant(
        of: bottomNavitationBarFinder, matching: find.byType(Icon));
    final List<Icon> listIcon = tester.widgetList<Icon>(iconFinder).toList();
    final _screenFinder = find.descendant(
        of: find.byType(Scaffold), matching: find.byType(AllTodosScreen));
    expect(_screenFinder, findsOneWidget);
    expect(listIcon[0].color, Colors.blue);
    expect(listIcon[1].color, Colors.black12);
    expect(listIcon[2].color, Colors.black12);
  });
}
