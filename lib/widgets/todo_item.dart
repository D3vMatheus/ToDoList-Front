import 'package:flutter/material.dart';
import 'package:todoapp/constants/colors.dart';
import 'package:todoapp/controllers/todo_controller.dart';
import 'package:get/get.dart';

class TodoItem extends StatelessWidget {
  const TodoItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ToDoController todoController = Get.put(ToDoController()); 

    return ListView.builder(
                shrinkWrap: true,
                itemCount: todoController.todos.value.length,
                itemBuilder:(context, index){
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: ListTile(
                    onTap: () {
                      // Add functionality for tapping the item here
                    },
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    leading: Icon(Icons.check_box, color: taskcheckbox),
                    tileColor: secondary,
                    title: Text(todoController.todos.value[index].name, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: text),),
                    trailing: Container(
                    padding: const EdgeInsets.all(0),
                    margin: const EdgeInsets.symmetric(vertical: 12),
                    height: 36,
                    width: 36,
                    decoration: BoxDecoration(
                      color: delete,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.delete),
                      iconSize: 18,
                      onPressed: () {
                        // Add delete functionality here
                      },
                      color: Colors.white,
                    ),
                  ),
                )
              );
            });
  }
}
