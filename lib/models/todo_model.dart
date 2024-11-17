import 'dart:convert';

ToDo toDoFromJson(String str) => ToDo.fromJson(json.decode(str));

String toDoToJson(ToDo data) => json.encode(data.toJson());

class ToDo {
    int id;
    String name;
    bool isCompleted;

    ToDo({
        required this.id,
        required this.name,
        required this.isCompleted,
    });

    factory ToDo.fromJson(Map<String, dynamic> json) => ToDo(
        id: json["id"],
        name: json["name"],
        isCompleted: json["is_completed"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "is_completed": isCompleted,
    };
}