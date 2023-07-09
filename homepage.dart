import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:project_march/ui_ux_works/DataBase/hivee/hive_todo/database/h_db.dart';
import 'package:project_march/ui_ux_works/DataBase/hivee/hive_todo/util/alertbox.dart';
import 'package:project_march/ui_ux_works/DataBase/hivee/hive_todo/util/todoTile.dart';

class HomePg extends StatefulWidget {
  const HomePg({super.key});

  @override
  State<HomePg> createState() => _HomePgState();
}

class _HomePgState extends State<HomePg> {
  final myBox = Hive.box("my_box");
  ToDo_DB db = ToDo_DB();
  bool hasTask = false;

  @override
  void initState() {
    if (myBox.get("TODOLIST") != null) {
      db.loadData();
    }

    // TODO: implement initState
    super.initState();
  }

  final controller = TextEditingController();

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateDataBase();
  }

  void saveNewTask() {
    setState(() {
      db.toDoList.add([controller.text, false]);
      controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDataBase();
  }

  void createNewTask() {
    hasTask = true;
    showDialog(
      context: context,
      builder: (context) {
        return DialogueBox(
          passed_controller: controller,
          passed_onCancel: () => Navigator.of(context).pop(),
          passed_onSave: saveNewTask,
        );
      },
    );
  }

  void updateTask(int index) {
    if (index >= 0 && index < db.toDoList.length) {
      controller.text = db.toDoList[index][0];
      showDialog(
        context: context,
        builder: (context) {
          return DialogueBox(
            passed_controller: controller,
            passed_onCancel: () => Navigator.of(context).pop(),
            passed_onSave: () {
              setState(() {
                db.toDoList[index][0] = controller.text;
                controller.clear();
              });
              Navigator.of(context).pop();
            },
          );
        },
      );
    }
  }

  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDataBase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent[200],
      appBar: AppBar(
        centerTitle: true,
        title: Text("To-do"),
        elevation: 0,
      ),
      body: hasTask
          ? ListView.builder(
              itemCount: db.toDoList.length,
              itemBuilder: (context, index) {
                return TodoTile(
                  taskName: db.toDoList[index][0],
                  taskComplete: db.toDoList[index][1],
                  onChangedFn: (value) => checkBoxChanged(value, index),
                  updateFunction: (context) => updateTask(index),
                  deleteFunction: (context) => deleteTask(index),
                );
              },
            )
          : Center(
              child: Text(
                "No Tasks. Be a Chad Get an Aim",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple[300],
        child: Icon(Icons.add),
        onPressed: createNewTask,
      ),
    );
  }
}
