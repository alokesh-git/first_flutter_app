import 'package:flutter/material.dart';
import 'package:flutter_start/constants/globals_variables.dart';
import 'package:flutter_start/features/auth/screen/auth_screen.dart';
import 'package:flutter_start/route.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Amazon demo',
      theme: ThemeData(
        scaffoldBackgroundColor: GlobalVariables.backgroundColor,
        colorScheme: const ColorScheme.light(
          primary: GlobalVariables.secondaryColor,
        ),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.black,
          )
        )
      ),
      onGenerateRoute: (setting)=> generateRoute(setting),
      home: AuthScreen(),
    );
  }
}