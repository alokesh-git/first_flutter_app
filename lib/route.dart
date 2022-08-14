import 'package:flutter/material.dart';
import 'features/auth/screen/auth_screen.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings){
  switch (routeSettings.name) {
    case AuthScreen.routeName: 
    return MaterialPageRoute(
       settings: routeSettings,
       builder: (_) => AuthScreen(),
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