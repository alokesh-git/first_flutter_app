import 'package:flutter/material.dart';

void main()=> runApp(MaterialApp(
  home: MyApp(),
));


class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int number = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: const Text('Flutter demo'),
        centerTitle: true,
        backgroundColor: Colors.grey[800],
        elevation: 25.0,
      ),
      body: Center(
        child: Text('$number',
        style: TextStyle(
          fontSize: 50,
          fontWeight: FontWeight.bold,
          color: Colors.grey[500],
        ),),
      ),
      floatingActionButton: FloatingActionButton(onPressed: ()=>{
        setState(()=>{number += 1})
      },
      child: Icon(Icons.add),
      backgroundColor: Colors.grey[800],
      elevation: 10.0,
      ),
    );
  }
}