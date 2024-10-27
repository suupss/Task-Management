import 'package:flutter/material.dart';
import 'package:task_mgmt/Models/get_todos.dart';
import 'package:task_mgmt/Services/api_service.dart';
import 'package:task_mgmt/screens/add_and_update_todo.dart';
import 'package:task_mgmt/screens/todo_screens.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {

  List<Items> isCompleted = []; 
  List<Items> isIncomplete = [];
  GetTodos getTodos = GetTodos();
//  late Future<GetTodos> fetchData;
 final ApiService _apiService = ApiService();
 bool isLoading = false;
  
  fetchDataTodo () async
  {
    getTodos.items?.clear();
    isCompleted.clear();
    isIncomplete.clear();

    isLoading = true;
    setState(() {});
await _apiService.fetchData().then((value)
{
getTodos = value;
for(var todo in value.items!)
{
  if(todo.isCompleted == true)
  {
isCompleted.add(todo);
  }
  else{
    isIncomplete.add(todo);
  }
  setState(() {});
}
isLoading = false;
setState(() {});
}


).onError((error, stackTrace) {
  debugPrint(error.toString()
  
  );

},);
  }



@override
  void initState() {
    fetchDataTodo();
  //  fetchData = _apiService.fetchData();
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
      length: 3,
      child: Scaffold(
      appBar: AppBar(
        
        centerTitle: true,
        title: const Text('Todo List',style: TextStyle(color: Colors.white),),

        bottom: const TabBar(
          labelStyle: TextStyle(fontSize: 17),
          indicatorColor: Colors.white,
          indicatorSize: TabBarIndicatorSize.label,
          indicatorWeight: 8,
          labelColor: Colors.white,

          tabs: [
          Text('All' ),
          Text('Complete'),
          Text('Incomplete')
        ]),
    

        
      ),
      body: isLoading? const Center(child:  CircularProgressIndicator.adaptive())  : TabBarView(children: [
        TodoScreens(todoList: getTodos.items ?? [],),
       TodoScreens(todoList: isCompleted,),
       TodoScreens(todoList: isIncomplete,)
      ]),
      backgroundColor: Theme.of(context).colorScheme.secondary,

      floatingActionButton: FloatingActionButton(onPressed: () async{
      await Navigator.push(context, MaterialPageRoute(builder: (context)=> const AddAndUpdateTodo()));

       fetchDataTodo();

      }, backgroundColor: Theme.of(context).colorScheme.primary,
      child: const Icon(Icons.add),),
      ),
      
    );
  }
}