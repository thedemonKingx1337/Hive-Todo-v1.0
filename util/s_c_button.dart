import 'package:flutter/material.dart';

class S_C_Buttons extends StatelessWidget {
  final String passed_text;
  VoidCallback passed_onPressed;

  S_C_Buttons(
      {super.key, required this.passed_text, required this.passed_onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        textColor: Colors.white,
        color: Theme.of(context).primaryColor,
        child: Text(passed_text),
        onPressed: passed_onPressed);
  }
}
