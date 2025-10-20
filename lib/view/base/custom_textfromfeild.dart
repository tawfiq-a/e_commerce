import 'package:flutter/material.dart';

class CustomTextFromField extends StatelessWidget {
  CustomTextFromField({
    super.key,
    this.controller,
    this.hintText,
    this.labelText,
    this.obscureText=false,
    this.validator
  }) ;

  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  bool obscureText;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      obscureText: obscureText,
      decoration:InputDecoration(
        hintText: hintText,
        labelText: labelText,
        border: UnderlineInputBorder(
          borderSide: BorderSide(color:Colors.grey),
        ),
        enabledBorder:  UnderlineInputBorder(
          borderSide: BorderSide(color:Colors.grey),
        ),
        focusedBorder:  UnderlineInputBorder(
          borderSide: BorderSide(color:Colors.grey),
        ),

      ),



    );
  }
}