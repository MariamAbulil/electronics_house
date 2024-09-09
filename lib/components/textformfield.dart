import 'package:flutter/material.dart';
class CustomTextForm extends StatelessWidget {
  final String hintText;
    final TextEditingController mycontroller;
  const CustomTextForm({super.key, required this.hintText, required this.mycontroller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: mycontroller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(fontSize: 14,color: Colors.brown[500]),
        contentPadding: EdgeInsets.symmetric(vertical: 2,horizontal: 20),
        filled: true,
        fillColor: Colors.brown[100],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}

