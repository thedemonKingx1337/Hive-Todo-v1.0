import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoTile extends StatelessWidget {
  final String taskName;
  final bool taskComplete;
  Function(bool?)? onChangedFn;
  Function(BuildContext)? updateFunction;
  Function(BuildContext)? deleteFunction;

  TodoTile({
    super.key,
    required this.taskName,
    required this.taskComplete,
    required this.onChangedFn,
    required this.updateFunction,
    required this.deleteFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
      child: Slidable(
        endActionPane: ActionPane(motion: StretchMotion(), children: [
          SlidableAction(
            onPressed: updateFunction,
            icon: Icons.update,
            backgroundColor: Colors.purple.shade300,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(5), topLeft: Radius.circular(5)),
          ),
          SlidableAction(
            onPressed: deleteFunction,
            icon: Icons.delete,
            backgroundColor: Colors.purple.shade300,
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(5), topRight: Radius.circular(5)),
          )
        ]),
        child: Container(
          padding: EdgeInsets.all(25),
          child: Row(
            children: [
              Checkbox(
                  activeColor: Colors.white,
                  checkColor: Colors.deepPurpleAccent,
                  value: taskComplete,
                  onChanged: onChangedFn),
              Text(
                taskName,
                style: TextStyle(
                    decoration: taskComplete
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                    color: taskComplete ? Colors.deepPurple : Colors.white),
              ),
            ],
          ),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 89, 188, 245),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
