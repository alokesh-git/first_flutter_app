import 'package:flutter/material.dart';
import 'package:flutter_start/constants/globals_variables.dart';
import 'package:flutter_start/features/auth/screen/auth_screen.dart';
import 'package:flutter_start/features/auth/services/auth_service.dart';
import 'package:flutter_start/features/home/screens/home_screen.dart';
import 'package:flutter_start/providers/userProvider.dart';
import 'package:flutter_start/route.dart';
import 'package:provider/provider.dart';

void main() => runApp(MultiProvider(
  providers:[
  ChangeNotifierProvider(create: ((context) => UserProvider())),
],child: const MyApp()));

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthService authService = AuthService();
  @override
  void initState() {
    super.initState();
    authService.getUserData(context);
  }
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
        home: Provider.of<UserProvider>(context).user.token.isNotEmpty? 
        const HomeScreen(): AuthScreen(),
      );
  }
}