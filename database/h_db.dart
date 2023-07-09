import 'package:hive/hive.dart';

class ToDo_DB {
  List toDoList = [];
  final mybox = Hive.box("my_box");

  // void createInitialData() {
  //   toDoList = [
  //     ["Make Money", false],
  //     ["Get Power", false],
  //   ];
  // }

  void loadData() {
    toDoList = mybox.get("TODOLIST");
  }

  void updateDataBase() {
    mybox.put("TODOLIST", toDoList);
  }
}
