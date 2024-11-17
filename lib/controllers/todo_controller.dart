import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:todoapp/constants/constants.dart';
import 'package:todoapp/models/todo_model.dart';

class ToDoController extends GetxController{
  RxBool loading = false.obs;
  Rx<List<ToDo>> todos = Rx<List<ToDo>>([]);
  
  @override
  void onInit(){
    super.onInit();
    getAllToDo();
  }


Future<void> getAllToDo() async {
  try {
    loading.value = true;

    var response = await http.get(
      baseurl,
      headers: {
        'Accept': 'Application/Json',
      },
    );

    if (response.statusCode == 200) {
      final content = json.decode(response.body)['data'];
      todos.value = content.map<ToDo>((item) => ToDo.fromJson(item)).toList(); // Update the entire listprint('Response Body: ${response.body}');

    } else {
      print('Failed to fetch data. Status code: ${response.statusCode}');
    }
  } catch (e) {
    print('Error: ${e.toString()}');
  } finally {
    loading.value = false;
  }
}
Future addToDo({required String name}) async{
  
  var data = {
    'name': name,
    'is_completed': false,
  };
  print(data);
try{
    loading.value = true;
  var request =  await http.post(baseurl,
      headers: {
        'Accept': 'Application/Json',
        'Content-Type': 'Application/json'
      },
      body: json.encode(data),);

    print(request.body);
    if(request.statusCode == 201){
      loading.value = false;
    }
}catch(e){
      loading.value = false;
}
}
Future updateToDo(id, String name, bool isCompleted) async{
  var data = {
    'name': name,
    'is_completed': isCompleted, 
  };
  
  var request = await http.put(Uri.parse('$baseurl/$id'),
      headers: {
        'Accept': 'Application/Json',
        'Content-Type': 'Application/json',
      },
      body: json.encode(data),);

  if(request.statusCode == 200){
    await getAllToDo();
  }
}

Future deleteToDo(id) async{

  var request = await http.delete(Uri.parse('$baseurl/$id'));

  if(request.statusCode == 200){
    await getAllToDo();
  }
}
}