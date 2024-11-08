// import 'package:flutter/material.dart';
// import 'task.dart';
//task 1
// import 'task_service.dart';

// void main() {
//   runApp(const ToDoApp());
// }

// class ToDoApp extends StatelessWidget {
//   const ToDoApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'To-Do List',
//       theme: ThemeData(
//         primarySwatch: Colors.teal, // Changed to teal for a fresher look
//         scaffoldBackgroundColor: const Color(0xFFF1F5F9), // Light background
//         appBarTheme: const AppBarTheme(
//           backgroundColor: Colors.teal,
//           titleTextStyle: TextStyle(
//             fontSize: 20,
//             fontWeight: FontWeight.bold,
//             color: Colors.white,
//           ),
//         ),
//         floatingActionButtonTheme: const FloatingActionButtonThemeData(
//           backgroundColor: Colors.tealAccent,
//         ),
//         textTheme: const TextTheme(
//           bodyMedium: TextStyle(fontSize: 16),
//         ),
//       ),
//       home: const ToDoListPage(),
//     );
//   }
// }

// class ToDoListPage extends StatefulWidget {
//   const ToDoListPage({super.key});

//   @override
//   _ToDoListPageState createState() => _ToDoListPageState();
// }

// class _ToDoListPageState extends State<ToDoListPage> {
//   final TaskService _taskService = TaskService();
//   List<Task> _tasks = [];
//   final TextEditingController _taskController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     _loadTasks();
//   }

//   // Load tasks from SharedPreferences
//   void _loadTasks() async {
//     List<Task> loadedTasks = await _taskService.loadTasks();
//     setState(() {
//       _tasks = loadedTasks;
//     });
//   }

//   // Add a new task
//   void _addTask(String title) {
//     if (title.isEmpty) return;
//     setState(() {
//       _tasks.add(Task(title: title));
//       _taskController.clear();
//     });
//     _taskService.saveTasks(_tasks);
//   }

//   // Update task completion status
//   void _toggleTask(Task task) {
//     setState(() {
//       task.isDone = !task.isDone;
//     });
//     _taskService.saveTasks(_tasks);
//   }

//   // Delete a task
//   void _deleteTask(int index) {
//     setState(() {
//       _tasks.removeAt(index);
//     });
//     _taskService.saveTasks(_tasks);
//   }

//   // Edit a task title
//   void _editTask(Task task, String newTitle) {
//     if (newTitle.isEmpty) return;
//     setState(() {
//       task.title = newTitle;
//     });
//     _taskService.saveTasks(_tasks);
//   }

//   // Show a dialog to add or edit a task
//   Future<void> _showTaskDialog({Task? task}) async {
//     String dialogTitle = task == null ? 'Add Task' : 'Edit Task';
//     String initialText = task == null ? '' : task.title;

//     await showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text(dialogTitle),
//           content: TextField(
//             controller: _taskController..text = initialText,
//             autofocus: true,
//             decoration: InputDecoration(
//               hintText: 'Enter task title',
//               filled: true,
//               fillColor: Colors.grey[200],
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(10),
//                 borderSide: BorderSide.none,
//               ),
//             ),
//           ),
//           actions: [
//             TextButton(
//               child: const Text('Cancel'),
//               onPressed: () {
//                 _taskController.clear();
//                 Navigator.of(context).pop();
//               },
//             ),
//             ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.teal,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//               ),
//               child: const Text('Save'),
//               onPressed: () {
//                 if (task == null) {
//                   _addTask(_taskController.text);
//                 } else {
//                   _editTask(task, _taskController.text);
//                 }
//                 Navigator.of(context).pop();
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('To-Do List'),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(12.0),
//         child: Column(
//           children: [
//             Expanded(
//               child: ListView.builder(
//                 itemCount: _tasks.length,
//                 itemBuilder: (context, index) {
//                   Task task = _tasks[index];
//                   return Card(
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(15),
//                     ),
//                     elevation: 2,
//                     margin: const EdgeInsets.symmetric(vertical: 8),
//                     child: ListTile(
//                       contentPadding: const EdgeInsets.symmetric(
//                         vertical: 10,
//                         horizontal: 16,
//                       ),
//                       title: Text(
//                         task.title,
//                         style: TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.w500,
//                           decoration:
//                               task.isDone ? TextDecoration.lineThrough : null,
//                         ),
//                       ),
//                       trailing: Row(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           IconButton(
//                             icon: const Icon(Icons.edit, color: Colors.teal),
//                             onPressed: () => _showTaskDialog(task: task),
//                           ),
//                           IconButton(
//                             icon: const Icon(Icons.delete, color: Colors.red),
//                             onPressed: () => _deleteTask(index),
//                           ),
//                         ],
//                       ),
//                       leading: Checkbox(
//                         value: task.isDone,
//                         activeColor: Colors.teal,
//                         onChanged: (value) => _toggleTask(task),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         child: const Icon(Icons.add),
//         onPressed: () => _showTaskDialog(),
//       ),
//     );
//   }
// }

// task 2
// import 'package:flutter/material.dart';
// import 'task.dart';
// import 'task_service.dart';

// void main() {
//   runApp(const ToDoApp());
// }

// class ToDoApp extends StatelessWidget {
//   const ToDoApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'To-Do List',
//       theme: ThemeData(
//         primarySwatch: Colors.teal,
//         scaffoldBackgroundColor: const Color(0xFFF1F5F9),
//       ),
//       home: const ToDoListPage(),
//     );
//   }
// }

// class ToDoListPage extends StatefulWidget {
//   const ToDoListPage({super.key});

//   @override
//   _ToDoListPageState createState() => _ToDoListPageState();
// }

// class _ToDoListPageState extends State<ToDoListPage> {
//   final TaskService _taskService = TaskService();
//   List<Task> _tasks = [];
//   final TextEditingController _taskController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     _loadTasks();
//   }

//   // Load tasks from SharedPreferences
//   void _loadTasks() async {
//     List<Task> loadedTasks = await _taskService.loadTasks();
//     setState(() {
//       _tasks = loadedTasks;
//     });
//   }

//   // Add a new task
//   void _addTask(String title) {
//     if (title.isEmpty) return;
//     setState(() {
//       _tasks.add(Task(title: title));
//       _taskController.clear();
//     });
//     _taskService.saveTasks(_tasks); // Save the tasks list
//   }

//   // Update task completion status
//   void _toggleTask(Task task) {
//     setState(() {
//       task.isDone = !task.isDone;
//     });
//     _taskService.saveTasks(_tasks); // Save the tasks list
//   }

//   // Delete a task
//   void _deleteTask(int index) {
//     setState(() {
//       _tasks.removeAt(index);
//     });
//     _taskService.saveTasks(_tasks); // Save the tasks list
//   }

//   // Edit a task title
//   void _editTask(Task task, String newTitle) {
//     if (newTitle.isEmpty) return;
//     setState(() {
//       task.title = newTitle;
//     });
//     _taskService.saveTasks(_tasks); // Save the tasks list
//   }

//   // Show a dialog to add or edit a task
//   Future<void> _showTaskDialog({Task? task}) async {
//     String dialogTitle = task == null ? 'Add Task' : 'Edit Task';
//     String initialText = task == null ? '' : task.title;

//     await showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text(dialogTitle),
//           content: TextField(
//             controller: _taskController..text = initialText,
//             autofocus: true,
//             decoration: InputDecoration(
//               hintText: 'Enter task title',
//               filled: true,
//               fillColor: Colors.grey[200],
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(10),
//                 borderSide: BorderSide.none,
//               ),
//             ),
//           ),
//           actions: [
//             TextButton(
//               child: const Text('Cancel'),
//               onPressed: () {
//                 _taskController.clear();
//                 Navigator.of(context).pop();
//               },
//             ),
//             ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.teal,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//               ),
//               child: const Text('Save'),
//               onPressed: () {
//                 if (task == null) {
//                   _addTask(_taskController.text);
//                 } else {
//                   _editTask(task, _taskController.text);
//                 }
//                 Navigator.of(context).pop();
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('To-Do List'),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(12.0),
//         child: Column(
//           children: [
//             Expanded(
//               child: ListView.builder(
//                 itemCount: _tasks.length,
//                 itemBuilder: (context, index) {
//                   Task task = _tasks[index];
//                   return Card(
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(15),
//                     ),
//                     elevation: 2,
//                     margin: const EdgeInsets.symmetric(vertical: 8),
//                     child: ListTile(
//                       contentPadding: const EdgeInsets.symmetric(
//                         vertical: 10,
//                         horizontal: 16,
//                       ),
//                       title: Text(
//                         task.title,
//                         style: TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.w500,
//                           decoration:
//                               task.isDone ? TextDecoration.lineThrough : null,
//                         ),
//                       ),
//                       trailing: Row(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           IconButton(
//                             icon: const Icon(Icons.edit, color: Colors.teal),
//                             onPressed: () => _showTaskDialog(task: task),
//                           ),
//                           IconButton(
//                             icon: const Icon(Icons.delete, color: Colors.red),
//                             onPressed: () => _deleteTask(index),
//                           ),
//                         ],
//                       ),
//                       leading: Checkbox(
//                         value: task.isDone,
//                         activeColor: Colors.teal,
//                         onChanged: (value) => _toggleTask(task),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         child: const Icon(Icons.add),
//         onPressed: () => _showTaskDialog(),
//       ),
//     );
//   }
// }

// task3
// import 'package:flutter/material.dart';
// import 'task.dart';
// import 'task_service.dart';

// void main() {
//   runApp(const ToDoApp());
// }

// class ToDoApp extends StatelessWidget {
//   const ToDoApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'To-Do List',
//       theme: ThemeData(
//         primarySwatch: Colors.teal,
//         scaffoldBackgroundColor: const Color.fromARGB(255, 12, 46, 83),
//       ),
//       home: const ToDoListPage(),
//     );
//   }
// }

// class ToDoListPage extends StatefulWidget {
//   const ToDoListPage({super.key});

//   @override
//   _ToDoListPageState createState() => _ToDoListPageState();
// }

// class _ToDoListPageState extends State<ToDoListPage> {
//   final TaskService _taskService = TaskService();
//   List<Task> _tasks = [];
//   final TextEditingController _taskController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     _loadTasks();
//   }

//   // Load tasks from SharedPreferences
//   void _loadTasks() async {
//     List<Task> loadedTasks = await _taskService.loadTasks();
//     setState(() {
//       _tasks = loadedTasks;
//     });
//   }

//   // Add a new task
//   void _addTask(String title) {
//     if (title.isEmpty) return;
//     setState(() {
//       _tasks.add(Task(title: title));
//       _taskController.clear();
//     });
//     _taskService.saveTasks(_tasks); // Save the tasks list
//   }

//   // Update task completion status
//   void _toggleTask(Task task) {
//     setState(() {
//       task.isDone = !task.isDone;
//     });
//     _taskService.saveTasks(_tasks); // Save the tasks list
//   }

//   // Delete a task
//   void _deleteTask(int index) {
//     setState(() {
//       _tasks.removeAt(index);
//     });
//     _taskService.saveTasks(_tasks); // Save the tasks list
//   }

//   // Edit a task title
//   void _editTask(Task task, String newTitle) {
//     if (newTitle.isEmpty) return;
//     setState(() {
//       task.title = newTitle;
//     });
//     _taskService.saveTasks(_tasks); // Save the tasks list
//   }

//   // Show a dialog to add or edit a task
//   Future<void> _showTaskDialog({Task? task}) async {
//     String dialogTitle = task == null ? 'Add Task' : 'Edit Task';
//     String initialText = task == null ? '' : task.title;

//     await showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text(dialogTitle),
//           content: TextField(
//             controller: _taskController..text = initialText,
//             autofocus: true,
//             decoration: InputDecoration(
//               hintText: 'Enter task title',
//               filled: true,
//               fillColor: const Color.fromARGB(255, 173, 98, 98),
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(10),
//                 borderSide: BorderSide.none,
//               ),
//             ),
//           ),
//           actions: [
//             TextButton(
//               child: const Text('Cancel'),
//               onPressed: () {
//                 _taskController.clear();
//                 Navigator.of(context).pop();
//               },
//             ),
//             ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: const Color.fromARGB(255, 11, 15, 15),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//               ),
//               child: const Text('Save'),
//               onPressed: () {
//                 if (task == null) {
//                   _addTask(_taskController.text);
//                 } else {
//                   _editTask(task, _taskController.text);
//                 }
//                 Navigator.of(context).pop();
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('To-Do List'),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(12.0),
//         child: Column(
//           children: [
//             Expanded(
//               child: ListView.builder(
//                 itemCount: _tasks.length,
//                 itemBuilder: (context, index) {
//                   Task task = _tasks[index];
//                   return Card(
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(15),
//                     ),
//                     elevation: 2,
//                     margin: const EdgeInsets.symmetric(vertical: 8),
//                     child: ListTile(
//                       contentPadding: const EdgeInsets.symmetric(
//                         vertical: 10,
//                         horizontal: 16,
//                       ),
//                       title: Text(
//                         task.title,
//                         style: TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.w500,
//                           decoration:
//                               task.isDone ? TextDecoration.lineThrough : null,
//                         ),
//                       ),
//                       trailing: Row(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           IconButton(
//                             icon: const Icon(Icons.edit, color: Colors.teal),
//                             onPressed: () => _showTaskDialog(task: task),
//                           ),
//                           IconButton(
//                             icon: const Icon(Icons.delete, color: Colors.red),
//                             onPressed: () => _deleteTask(index),
//                           ),
//                         ],
//                       ),
//                       leading: Checkbox(
//                         value: task.isDone,
//                         activeColor: Colors.teal,
//                         onChanged: (value) => _toggleTask(task),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         child: const Icon(Icons.add),
//         onPressed: () => _showTaskDialog(),
//       ),
//     );
//   }
// }

//task4
import 'package:flutter/material.dart';
import 'task.dart';
import 'task_service.dart';

void main() {
  runApp(const ToDoApp());
}

class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-Do List',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: const Color.fromARGB(255, 25, 56, 87),
      ),
      home: const ToDoListPage(),
    );
  }
}

class ToDoListPage extends StatefulWidget {
  const ToDoListPage({super.key});

  @override
  _ToDoListPageState createState() => _ToDoListPageState();
}

class _ToDoListPageState extends State<ToDoListPage> {
  final TaskService _taskService = TaskService();
  List<Task> _tasks = [];
  final TextEditingController _taskController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadTasks();
  }

  // Load tasks from SharedPreferences
  void _loadTasks() async {
    List<Task> loadedTasks = await _taskService.loadTasks();
    setState(() {
      _tasks = loadedTasks;
    });
  }

  // Add a new task
  void _addTask(String title) {
    if (title.isEmpty) return;
    setState(() {
      _tasks.add(Task(title: title));
      _taskController.clear();
    });
    _taskService.saveTasks(_tasks); // Save tasks after adding
  }

  // Update task completion status
  void _toggleTask(Task task) {
    setState(() {
      task.isDone = !task.isDone;
    });
    _taskService.saveTasks(_tasks); // Save tasks after update
  }

  // Delete a task
  void _deleteTask(int index) {
    setState(() {
      _tasks.removeAt(index);
    });
    _taskService.saveTasks(_tasks); // Save tasks after deletion
  }

  // Edit a task title
  void _editTask(Task task, String newTitle) {
    if (newTitle.isEmpty) return;
    setState(() {
      task.title = newTitle;
    });
    _taskService.saveTasks(_tasks); // Save tasks after editing
  }

  // Show a dialog to add or edit a task
  Future<void> _showTaskDialog({Task? task}) async {
    String dialogTitle = task == null ? 'Add Task' : 'Edit Task';
    String initialText = task == null ? '' : task.title;

    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(dialogTitle),
          content: TextField(
            controller: _taskController..text = initialText,
            autofocus: true,
            decoration: InputDecoration(
              hintText: 'Enter task title',
              filled: true,
              fillColor: Colors.grey[200],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          actions: [
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                _taskController.clear();
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text('Save'),
              onPressed: () {
                if (task == null) {
                  _addTask(_taskController.text);
                } else {
                  _editTask(task, _taskController.text);
                }
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To-Do List'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _tasks.length,
                itemBuilder: (context, index) {
                  Task task = _tasks[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 2,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 16,
                      ),
                      title: Text(
                        task.title,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          decoration:
                              task.isDone ? TextDecoration.lineThrough : null,
                        ),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit, color: Colors.teal),
                            onPressed: () => _showTaskDialog(task: task),
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () => _deleteTask(index),
                          ),
                        ],
                      ),
                      leading: Checkbox(
                        value: task.isDone,
                        activeColor: Colors.teal,
                        onChanged: (value) => _toggleTask(task),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _showTaskDialog(),
      ),
    );
  }
}
