// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Road to Devsoc",
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Road to DevSoc"),
        centerTitle: true,
      ),
      

      body: Column(
        children: [
          Progress(),
          TaskList(),
        ]
        ),
    );
  }
}

class Progress extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text('DevSoc Approaching'),
        LinearProgressIndicator(value: 0.0),
      ],
    );
  }
}

class TaskList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          TaskItem(label: "Product Management"),
          TaskItem(label: "Intro to HTML CSS"),
          TaskItem(label: "ReactJS"),
          TaskItem(label: "Design"),
          TaskItem(label: "Flutter"),
          TaskItem(label: "XR/AR"),
          TaskItem(label: "Backend nodeJS"),
          
        ],
      ),
    );
  }
}

class TaskItem extends StatefulWidget {

  final String label;

  const TaskItem({Key? key, required this.label}) : super (key: key);

  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  bool? _val = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          onChanged: (newValue) => setState(() => _val = newValue), // To tell flutter that the state has changed we make a call setState which takes a function and makes change which we need
        value: _val,),
        Text(widget.label)
      ],
    );
  }
}
