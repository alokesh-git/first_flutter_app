import 'package:flutter/material.dart';
import 'package:flutter_start/features/home/screens/home_screen.dart';
import 'features/auth/screen/auth_screen.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings){
  switch (routeSettings.name) {
    case AuthScreen.routeName: 
    return MaterialPageRoute(
       settings: routeSettings,
       builder: (_) => AuthScreen(),
    );
    case HomeScreen.routeName: 
    return MaterialPageRoute(
       settings: routeSettings,
       builder: (_) => HomeScreen(),
    );
    default:
    return MaterialPageRoute(
      settings: routeSettings,
      builder: (_)=> const Scaffold(
      body: Center(
        child: Text("error 404"),
      ),
    ),
    );
  }
}