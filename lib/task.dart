//task 1 and 2
// class Task {
//   String title;
//   bool isDone;

//   Task({required this.title, this.isDone = false});

//   // Convert a Task object to JSON
//   Map<String, dynamic> toJson() => {
//         'title': title,
//         'isDone': isDone,
//       };

//   // Create a Task object from JSON
//   factory Task.fromJson(Map<String, dynamic> json) {
//     return Task(
//       title: json['title'],
//       isDone: json['isDone'],
//     );
//   }
// }

//task3
// class Task {
//   String title;
//   bool isDone;

//   Task({required this.title, this.isDone = false});

//   // Convert a Task object into a Map object
//   Map<String, dynamic> toJson() {
//     return {
//       'title': title,
//       'isDone': isDone,
//     };
//   }

//   // Convert a Map object into a Task object
//   factory Task.fromJson(Map<String, dynamic> json) {
//     return Task(
//       title: json['title'],
//       isDone: json['isDone'],
//     );
//   }
// }

//task4
class Task {
  String title;
  bool isDone;

  Task({required this.title, this.isDone = false});

  // Convert a Task object to JSON format
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'isDone': isDone,
    };
  }

  // Create a Task object from JSON data
  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      title: json['title'],
      isDone: json['isDone'],
    );
  }
}
