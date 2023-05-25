import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

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
var stringResponse;

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override

  Future apicall() async {
    http.Response response;
    response = await http.get(Uri.parse("https://reqres.in/api/users/2"));
    if (response.statusCode == 200) {
      setState(() { 
        stringResponse = response.body;
      });
    }
  }

  @override
  void initState() {
    apicall();
    super.initState();
  }

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
            child: Center(child: Text(stringResponse.toString())),
          ),
        ),
    );
  }
}

