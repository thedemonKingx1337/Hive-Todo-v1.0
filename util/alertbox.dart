import 'package:flutter/material.dart';
import 'package:project_march/ui_ux_works/DataBase/hivee/hive_todo/util/s_c_button.dart';

class DialogueBox extends StatelessWidget {
  final passed_controller;
  VoidCallback passed_onSave;
  VoidCallback passed_onCancel;
  DialogueBox(
      {super.key,
      required this.passed_controller,
      required this.passed_onSave,
      required this.passed_onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color.fromARGB(255, 214, 124, 255),
      content: Container(
          height: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextField(
                controller: passed_controller,
                decoration: InputDecoration(
                    labelText: "Add new task",
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(10))),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  S_C_Buttons(
                      passed_text: "Save", passed_onPressed: passed_onSave),
                  SizedBox(width: 20),
                  S_C_Buttons(
                      passed_text: "Cancel", passed_onPressed: passed_onCancel)
                ],
              )
            ],
          )),
    );
  }
}
