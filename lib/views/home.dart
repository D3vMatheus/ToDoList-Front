import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/constants/colors.dart';
import 'package:todoapp/controllers/todo_controller.dart';
// import 'package:todoapp/widgets/todo_item.dart';

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
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: secondary),
                  borderRadius: BorderRadius.circular(30),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: primary),
                  borderRadius: BorderRadius.circular(30),
                ),
                hintText: 'Type a new to do',
                hintStyle: TextStyle(color: text),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Obx((){
              return todoController.loading.value == true 
              ? CircularProgressIndicator() 
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
                child: Text('Add'));
            }
          ),
          ],),
          Obx((){
            print('Length: ${todoController.todos.value.length}');
            return todoController.loading.value ?
            const Center(child: CircularProgressIndicator(),) : 
            ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: todoController.todos.value.length,
                itemBuilder:(context, index){
                final currentTodo = todoController.todos.value[index];

                return Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: ListTile(
                    onTap: () {
                      todoController.updateToDo(currentTodo.id,
                                                currentTodo.name, 
                                                currentTodo.isCompleted);
                    },
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
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
                            ;
                    }),
                    ),
                    tileColor: currentTodo.isCompleted ? primary: secondary,
                    title: Text(currentTodo.name, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: text),),
                    trailing: Container(
                    padding: EdgeInsets.all(0),
                    height: 32,
                    width: 32,
                    decoration: BoxDecoration(
                      color: delete,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: IconButton(
                      icon: Icon(Icons.delete),
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
          }),
        ],)
    )
  );
  }
}