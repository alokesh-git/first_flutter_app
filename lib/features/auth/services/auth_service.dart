import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_start/constants/utils.dart';
import 'package:flutter_start/features/home/screens/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constants/error_handling.dart';
import '../../../constants/globals_variables.dart';
import '../../home/screens/home_screen.dart';
import '../../../model/user.dart';
import 'package:http/http.dart' as http;

import '../../../providers/userProvider.dart';

class AuthService {
  /// 🔥🔥🔥🔥🔥 signup part is here 🔥🔥🔥🔥🔥🔥🔥

  void signUpUser({
    required BuildContext context,
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      User user = User(
          id: '',
          name: name,
          email: email,
          password: password,
          address: "",
          type: "",
          token: "");
      http.Response res = await http.post(Uri.parse('$uri/api/SignUp'),
          body: user.toJson(),
          headers: {"Content-Type": "application/json; charset=utf-8"});
      httpErrorHandle(
          context: context,
          response: res,
          onSuccess: () {
            showSnackBar(
                context, "Account created! Now Sign In with same credent");
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void signInUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      User user = User(
          id: '',
          name: '',
          email: email,
          password: password,
          address: "",
          type: "",
          token: "");
      http.Response res = await http.post(Uri.parse('$uri/api/SignIn'),
          body: user.toJson(),
          headers: {"Content-Type": "application/json; charset=utf-8"});
      httpErrorHandle(
          context: context,
          response: res,
          onSuccess: () async {
            SharedPreferences pref = await SharedPreferences.getInstance();
            Provider.of<UserProvider>(context, listen: false).setUser(res.body);
            await pref.setString(
                'user-auth-token', jsonDecode(res.body)['token']);
            Navigator.pushNamedAndRemoveUntil(
                context, HomeScreen.routeName, (route) => false);
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void getUserData(context)async{
   try {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString('user-auth-token');
    if(token == null){
      pref.setString('user-auth-token', '');
    }
     var tokenRes = await http.post(Uri.parse('$uri/tokenIsValid'),headers: <String, String>{
      'Content-Type': 'application/json; charset=utf-8',
      'user-auth-token': token!,
     },);

    var response = jsonDecode(tokenRes.body);
    if(response == true){
      // get user data
      http.Response userData = await http.get(Uri.parse('$uri/'),headers: <String, String>{
      'Content-Type': 'application/json; charset=utf-8',
      'user-auth-token': token,
     },);
      var userProvider = Provider.of<UserProvider>(context, listen: false);
      userProvider.setUser(userData.body);
    }
   } catch (e) {
      showSnackBar(context, e.toString());
   }
  }
}
