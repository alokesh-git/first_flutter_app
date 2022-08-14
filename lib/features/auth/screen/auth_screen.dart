import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
 static const String routeName = "/auth-screen";
  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('auth Screen'),
      ),
      body: Center(
        child:  Text("center Wedgits"),
      ),
    );
  }
}