import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/constants/colors.dart';
import 'package:todoapp/controllers/todo_controller.dart';
import 'package:todoapp/widgets/todo_item.dart';

class HomePage extends StatelessWidget{
  const HomePage({super.key});

  @override
  Widget build(BuildContext context){
  final ToDoController todoController = Get.put(ToDoController());
  final TextEditingController textController = TextEditingController();

  return Scaffold(
    backgroundColor: background,
    appBar: AppBar(
      backgroundColor: background,
      title: const Text('To do List',
      style: TextStyle(color: text, fontSize: 32, fontWeight: FontWeight.w900),),
      elevation: 0,
      centerTitle: true,

    ),
    body: SingleChildScrollView(
      child: Column(
        children: [
          Row(children: [
          Expanded(
            child: TextField(
              controller: textController,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: secondary),
                  borderRadius: BorderRadius.circular(30),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: primary),
                  borderRadius: BorderRadius.circular(30),
                ),
                hintText: 'Type a new to do',
                hintStyle: const TextStyle(color: text),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Obx((){
              return todoController.loading.value == true 
              ? const CircularProgressIndicator() 
              : ElevatedButton(
                style: const ButtonStyle( 
                  backgroundColor: WidgetStatePropertyAll<Color>(primary),
                  foregroundColor: WidgetStatePropertyAll<Color>(text),
                  ),
                onPressed: () async {
                  await todoController.addToDo(
                    name: textController.text.trim(),);
                  textController.clear();
                  todoController.getAllToDo();
                },
                child: const Text('Add'));
            }
          ),
          ],),
          Obx((){
            return todoController.loading.value ?
            const Center(child: CircularProgressIndicator(),) : 
            const TodoItem();
          }),
        ],)
    )
  );
  }
}