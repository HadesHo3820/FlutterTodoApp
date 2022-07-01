## Getting Started - project_todos_test
- A simple minimalist that's works totally offline, made for the users who just want to have a simple app for storing their to do task and hate to have the fancy alarms and all functionality that they never use.
- As it don't require any account sign in or anything so in general it is the simplest work ticker without any compromise on privacy.
- This app works totally offline so no worries about data leaks or something.

## Tech Stacks Used

| Need             | Tech Used                    |
| ---------------- | ---------------------------- |
| UI               | Inspired from a dribble post |
| framework        | Flutter                      |
| state management | BLoC Package                 |

## Features

- View both complete and incomplete Todo
- View complete Todo
- View incomplete Todo
- Add a task by clicking the plus button
- Delete any task and move selected task to Recycle Bin by clicking the bin button
- Remove any task permantly by clicking the remove button
- Check each task with the check box to change its status between complete and incomplete

## How to Use 

**Step 1:**

Download or clone this repo by using the link below:

```
Not Updated
```

**Step 2:**

Go to project root and execute the following command in console to get the required dependencies: 

```
flutter pub get 
```
**Step 3: Run the project**
- Plug-in your device or start your emulator. 
- From the command line, navigate to the project's root directory and enter the following command:
```
$ flutter run lib/main.dart
```
**Step 4: Run Unit Test (For Testing Purpose)**
- If your app is running in your emulator or device, close it before continuing. 
- From the command line, navigate to the project's root directory and enter the following command:
```
$ flutter test test/unit_test/task_bloc_test.dart 
```

**Step 5: Run Widget Test (For Testing Purpose)**
- Plug-in your device or start your emulator. 
- From the command line, navigate to the project's root directory and enter the following command:
```
$ flutter test test/widget_test/screens/navigation_screen_widget_test.dart 
```