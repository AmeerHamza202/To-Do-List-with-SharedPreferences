//task 1 and 2
// import 'dart:convert';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'task.dart';

// class TaskService {
//   static const String _tasksKey = 'tasks';

//   // Save tasks list to SharedPreferences
//   Future<void> saveTasks(List<Task> tasks) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     List<String> jsonTasks =
//         tasks.map((task) => json.encode(task.toJson())).toList();
//     await prefs.setStringList(_tasksKey, jsonTasks);
//   }

//   // Retrieve tasks from SharedPreferences
//   Future<List<Task>> loadTasks() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     List<String>? jsonTasks = prefs.getStringList(_tasksKey);

//     if (jsonTasks != null) {
//       return jsonTasks
//           .map((jsonTask) => Task.fromJson(json.decode(jsonTask)))
//           .toList();
//     }
//     return [];
//   }
// }

//task 3
// import 'dart:convert';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'task.dart';

// class TaskService {
//   static const String _tasksKey = 'tasks';

//   // Save the tasks list to SharedPreferences
//   Future<void> saveTasks(List<Task> tasks) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     List<String> jsonTasks =
//         tasks.map((task) => json.encode(task.toJson())).toList();
//     prefs.setStringList(_tasksKey, jsonTasks);
//   }

//   // Load the tasks list from SharedPreferences
//   Future<List<Task>> loadTasks() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     List<String>? jsonTasks = prefs.getStringList(_tasksKey);

//     if (jsonTasks != null) {
//       return jsonTasks
//           .map((jsonTask) => Task.fromJson(json.decode(jsonTask)))
//           .toList();
//     } else {
//       return []; // Return an empty list if no tasks are stored
//     }
//   }
// }

//task4
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'task.dart';

class TaskService {
  static const String tasksKey = 'tasks';

  // Save tasks to SharedPreferences
  Future<void> saveTasks(List<Task> tasks) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> taskList =
        tasks.map((task) => jsonEncode(task.toJson())).toList();
    await prefs.setStringList(tasksKey, taskList);
  }

  // Load tasks from SharedPreferences
  Future<List<Task>> loadTasks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? taskList = prefs.getStringList(tasksKey);

    if (taskList != null) {
      return taskList.map((task) => Task.fromJson(jsonDecode(task))).toList();
    }
    return [];
  }
}
