import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(),
      );
  }
}

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Api Demo"),
      ),
      body: Center(
        child: Container(
          height: 200, width: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.blue),
            child: Center(child: Text("Hello World")),
          ),
        ),
    );
  }
}

