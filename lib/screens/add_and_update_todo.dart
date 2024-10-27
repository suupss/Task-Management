import 'package:flutter/material.dart';
import 'package:task_mgmt/Models/get_todos.dart';

import 'package:task_mgmt/Services/api_service.dart';
import 'package:task_mgmt/screens/todo_list_screen.dart';
import 'package:task_mgmt/ui_kit/snackbar.dart';

class AddAndUpdateTodo extends StatefulWidget {
  final Items? item;
  const AddAndUpdateTodo({super.key, this.item});

  @override
  State<AddAndUpdateTodo> createState() => _AddAndUpdateTodoState();
}

class _AddAndUpdateTodoState extends State<AddAndUpdateTodo> {
    bool isOn = false;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  bool isLoading = false;


void onFloatingPress () 
{
  if(titleController.text.isEmpty )
  {
     snackbar(context, 'Enter the title ',);
  }
  else if(descriptionController.text.isEmpty){
snackbar(context, 'Enter the description ');
  }
  else {
     setState(() {
       isLoading = true; 
     });
    if(widget.item == null){
     
  ApiService().postTodo(titleController.text.toString(), descriptionController.text.toString(), isOn).then((value){
    setState(() {
      isLoading = false;
    });

          Navigator.pop(context,true);
          snackbar(context, 'Todo Added successfully');

  
}).onError((error, stackTrace) {
  debugPrint(error.toString());
  snackbar(context, 'Something went wrong');
},);
}
else {
  ApiService().updateTodo(titleController.text.toString(), descriptionController.text.toString(), isOn, widget.item!.sId!).then((value){
    setState(() {
      isLoading = false;
    });
    
        snackbar(context, 'Todo updated');
    
  }
  
  ).onError((error, stackTrace) {
    debugPrint(error.toString());
    snackbar(context, 'Failed to update todo');
  },
  
  );
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const TodoListScreen()));


  
}

  }
}
@override
  void initState() {
    if(widget.item != null)
    {
    titleController.text = widget.item?.title ?? '';
    descriptionController.text = widget.item?.description ?? '';
    isOn = widget.item?.isCompleted ?? false;
    setState(() {
      
    });
    
    }
    
    super.initState();
  }



  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        appBar: AppBar(
          title: Text(widget.item == null ? 'Add Todo' : 'Update Todo'),
          centerTitle: true,
         
        ),
        body:  Center(
          child: SizedBox(
            height: 400,
            width: 350,
            child: Card(
            elevation: 8,
              child:  Column(
            children: [
               TextField(
                controller: titleController,
                autofocus: widget.item != null? true :false,
        decoration: const InputDecoration(
          labelText: 'Title',
          labelStyle: TextStyle(color:Color.fromARGB(255, 147, 145, 145) )
          
        ),
      
              ),
               TextField(
          controller: descriptionController,
          decoration: const InputDecoration(
          labelText: 'Description',
          labelStyle: TextStyle(color: Color.fromARGB(255, 147, 145, 145),),
      
        ),
        maxLines: null,
              ),
              Row(
                children: [
                  Text('Complete' , style: Theme.of(context).textTheme.titleMedium,), const Spacer(),  Switch(value: isOn , onChanged: (bool value)=>{ 
      setState(() {
        
        isOn = value;
      
      }
      
      ),

      },
      inactiveThumbColor: Theme.of(context).colorScheme.primary,)
                ],
              )
            ],

              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton( onPressed: onFloatingPress, backgroundColor: Theme.of(context).colorScheme.primary, child: isLoading? const CircularProgressIndicator.adaptive(): const Icon(Icons.add)
        ),
      ),
    );
  }
}