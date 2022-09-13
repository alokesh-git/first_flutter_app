import 'package:flutter/material.dart';
import 'package:flutter_start/constants/globals_variables.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 3.0,
      borderRadius: BorderRadius.circular(20.0),
      shadowColor: GlobalVariables.secondaryColor,
      borderOnForeground: true,
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
           hintStyle: TextStyle(color: Colors.deepPurple[700],fontWeight: FontWeight.bold),
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        validator: (val) {
          if(val == null || val.isEmpty){
            return 'Enter your $hintText';
          }
          return null;
        },
      ),
    );
  }
}
