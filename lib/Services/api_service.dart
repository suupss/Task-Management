import 'package:task_mgmt/Models/get_todos.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:task_mgmt/Models/todo_model.dart';
class ApiService {
  final String url = 'https://api.nstack.in/v1/todos';

  //get todos
  Future<GetTodos> fetchData() async{
    try{
final response = await  http.get(Uri.parse(url));
print(response.body);


if(response.statusCode == 200)
{ 
  

  final data = jsonDecode(response.body);
  
  return GetTodos.fromJson(data);
}
else {
  throw 'No response from API';
}

    }
    catch(e)
    {
      debugPrint('Error: $e');
      throw'An exception occured $e';
    }

  }

  Future<TodoModel> postTodo( String title , String description, bool isCompleted) async {
    try{
      final response = await http.post(Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode( {
  "title": title,
  "description": description,
  "is_completed": isCompleted,
})
      );

      if(response.statusCode == 201)
      {
        final data = jsonDecode(response.body);
        print(data);
        return TodoModel.fromJson(data);
      }
      else{
        throw 'No value from API';
      }
    }
    catch(e)
    {
      throw 'An error occured';
    }
  }

//Udate the todos

  Future<TodoModel> updateTodo( String title , String description, bool isCompleted, String id) async {
    try{
      final response = await http.put(Uri.parse('$url/$id'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode( {
  "title": title,
  "description": description,
  "is_completed": isCompleted,
})
      );

      if(response.statusCode == 201)
      {
        final data = jsonDecode(response.body);
        print(data);
        return TodoModel.fromJson(data);
      }
      else{
        throw 'No value from API';
      }
    }
    catch(e)
    {
      throw 'An error occured';
    }
  }
  //Detele Todos
  Future<GetTodos> deleteTodo(String id) async{
    try{
final response = await  http.delete(Uri.parse('$url/$id'));
print(response.body);


if(response.statusCode == 200)
{ 
  

  final data = jsonDecode(response.body);
  
  return GetTodos.fromJson(data);
}
else {
  throw 'No response from API';
}

    }
    catch(e)
    {
      debugPrint('Error: $e');
      throw'An exception occured $e';
    }

  }
 
}