import 'package:flutter/material.dart';

class Auth_screen extends StatefulWidget {
  const Auth_screen({Key? key}) : super(key: key);

  @override
  State<Auth_screen> createState() => _Auth_screenState();
}

class _Auth_screenState extends State<Auth_screen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child:  Text("center Wedgits"),
      ),
    );
  }
}