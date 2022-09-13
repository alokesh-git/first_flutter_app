import 'package:flutter/material.dart';
import 'package:flutter_start/common/Widgets/custom_button.dart';
import 'package:flutter_start/common/Widgets/custom_textfield.dart';
import 'package:flutter_start/constants/globals_variables.dart';
import '../services/auth_service.dart';

enum Auth { signin, signup }

class AuthScreen extends StatefulWidget {
  static const String routeName = "/auth-screen";
  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth = Auth.signup;
  final _signUpFormKey = GlobalKey<FormState>();
  final _signInFormKey = GlobalKey<FormState>();
  final AuthService authScreen = AuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
  }

  void signUp() {
    authScreen.signUpUser(
        context: context,
        email: _emailController.text,
        name: _nameController.text,
        password: _passwordController.text);
  }

  void signIn() {
    authScreen.signInUser(
        context: context,
        email: _emailController.text,
        password: _passwordController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.greyBackgroundCOlor,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              // margin: EdgeInsets.fromLTRB(0.0, 0.0,10.0, 10.0),
              padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 15.0),
              width: double.infinity,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Colors.deepPurpleAccent,
                      Colors.purpleAccent,
                    ],
                  )),
              child: const Center(
                child: Text(
                  'Welcome',
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ListTile(
                        title: const Text(
                          'Create Account',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        leading: Radio(
                          activeColor: GlobalVariables.secondaryColor,
                          value: Auth.signup,
                          groupValue: _auth,
                          onChanged: (Auth? val) {
                            setState(() {
                              _auth = val!;
                            });
                          },
                        ),
                      ),
                      if (_auth == Auth.signup)
                        Form(
                          child: Column(
                            children: [
                              CustomTextField(
                                controller: _nameController,
                                hintText: "Name",
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              CustomTextField(
                                controller: _emailController,
                                hintText: "Email Address",
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              CustomTextField(
                                controller: _passwordController,
                                hintText: "Password",
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              CustomButton(
                                  text: "Sign Up",
                                  onTap: () {
                                    if (_signUpFormKey.currentState!
                                        .validate()) {
                                      signUp();
                                    }
                                  })
                            ],
                          ),
                          key: _signUpFormKey,
                        ),
                      ListTile(
                        title: const Text(
                          'Sign-in.',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        leading: Radio(
                          activeColor: GlobalVariables.secondaryColor,
                          value: Auth.signin,
                          groupValue: _auth,
                          onChanged: (Auth? val) {
                            setState(() {
                              _auth = val!;
                            });
                          },
                        ),
                      ),
                      if (_auth == Auth.signin)
                        Form(
                          child: Column(
                            children: [
                              CustomTextField(
                                controller: _emailController,
                                hintText: "Email Address",
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              CustomTextField(
                                controller: _passwordController,
                                hintText: "Password",
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              CustomButton(
                                  text: "Sign In",
                                  onTap: () {
                                    if (_signInFormKey.currentState!
                                        .validate()) {
                                      signIn();
                                    }
                                  })
                            ],
                          ),
                          key: _signInFormKey,
                        ),
                    ])),
          ],
        ),
      )),
    );
  }
}
