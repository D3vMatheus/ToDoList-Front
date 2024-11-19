import 'package:flutter/material.dart';
import 'package:todoapp/constants/colors.dart';
import 'package:todoapp/controllers/todo_controller.dart';
import 'package:get/get.dart';

class TodoItem extends StatelessWidget {
  const TodoItem({super.key});

  @override
  Widget build(BuildContext context) {
    final ToDoController todoController = Get.put(ToDoController()); 

    return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: todoController.todos.value.length,
                itemBuilder:(context, index){
                final currentTodo = todoController.todos.value[index];

                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: ListTile(
                    onTap: () {
                      todoController.updateToDo(currentTodo.id,
                                                currentTodo.name, 
                                                currentTodo.isCompleted);
                    },
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    leading: Transform.scale(
                      scale: 1.5,
                      child:Checkbox(
                          side: const BorderSide(
                            color: primary, 
                            width: 1.5,
                          ),
                          activeColor: taskcheckbox,
                          
                          value: currentTodo.isCompleted
                            ? true
                            : false,
                          onChanged:(value) async{
                            await todoController.updateToDo(currentTodo.id, currentTodo.name, value!);
                    }),
                    ),
                    tileColor: currentTodo.isCompleted ? primary: secondary,
                    title: Text(currentTodo.name, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: text),),
                    trailing: Container(
                    padding: const EdgeInsets.all(0),
                    height: 32,
                    width: 32,
                    decoration: BoxDecoration(
                      color: delete,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.delete),
                      iconSize: 16,
                      onPressed: () {
                        todoController.deleteToDo(currentTodo.id);
                      },
                      color: Colors.white,
                    ),
                  ),
                )
              );
            });
  }
}
