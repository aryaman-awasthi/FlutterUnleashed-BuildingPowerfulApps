// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() => runApp(ProviderScope(child: MyApp()));

// Define a StateNotifierProvider called taskProvider
final taskProvider = StateNotifierProvider<TaskNotifier, List<Task>>((ref) {
  // Provide a TaskNotifier instance with initial tasks
  return TaskNotifier(tasks: [
    Task(id: 1, label: 'Product Management'),
    Task(id: 2, label: "Intro to HTML CSS"),
    Task(id: 3, label: "ReactJS"),
    Task(id: 4, label: "Design"),
    Task(id: 5, label: 'Futter'),
    Task(id: 6, label: 'AR/XR'),
  ]);
});

// Define the root widget of the application
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Configure the MaterialApp with title, theme, and initial screen
    return MaterialApp(
      title: "Road to Devsoc",
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

// Define the home page widget
class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Scaffold provides a basic app structure with an AppBar and body
    return Scaffold(
      appBar: AppBar(
        title: const Text("Road to DevSoc"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Include a Progress widget to show task completion progress
          Progress(),
          // Include a TaskList widget to display the list of tasks
          TaskList(),
        ],
      ),
    );
  }
}

// Widget that shows the progress of completed tasks
class Progress extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Obtain the tasks from the taskProvider
    var tasks = ref.watch(taskProvider);

    // Calculate the number of completed tasks
    var numCompletedTasks = tasks.where((task) {
      return task.completed == true;
    }).length;

    // Display the progress as a column with a text and progress indicator
    return Column(
      children: [
        const Text('DevSoc Approaching'),
        LinearProgressIndicator(value: numCompletedTasks / tasks.length),
      ],
    );
  }
}

// Widget that displays the list of tasks
class TaskList extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Obtain the tasks from the taskProvider
    var tasks = ref.watch(taskProvider);

    // Create a column of TaskItem widgets based on the tasks
    return Column(
      children: tasks
          .map(
            (task) => TaskItem(task: task),
          )
          .toList(),
    );
  }
}

// Widget that represents an individual task item
class TaskItem extends ConsumerWidget {
  final Task task;

  TaskItem({Key? key, required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Display a row with a checkbox and task label
    return Row(
      children: [
        Checkbox(
          onChanged: (newValue) =>
              ref.read(taskProvider.notifier).toggle(task.id),
          value: task.completed,
        ),
        Text(task.label),
      ],
    );
  }
}

// Define the Task class
@immutable
class Task {
  final int id;
  final String label;
  final bool completed;

  Task({required this.id, required this.label, this.completed = false});

  // Create a copy of the task with optional modifications
  Task copyWith({int? id, String? label, bool? completed}) {
    return Task(
      id: id ?? this.id,
      label: label ?? this.label,
      completed: completed ?? this.completed,
    );
  }
}

// Define the TaskNotifier class that extends StateNotifier
class TaskNotifier extends StateNotifier<List<Task>> {
  TaskNotifier({tasks}) : super(tasks);

  // Toggle the completion status of a task
  void toggle(int taskId) {
    state = [
      for (final item in state)
        if (taskId == item.id)
          item.copyWith(completed: !item.completed)
        else
          item
    ];
  }
}
