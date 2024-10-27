import 'package:flutter/material.dart';
import 'package:task_mgmt/screens/login_form.dart';
import 'package:task_mgmt/provider/validation_provider.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {


    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: MultiProvider(
        providers: [ChangeNotifierProvider(create: (context)=> ValidationProvider())],
        child: Scaffold(
          backgroundColor: Theme.of(context).colorScheme.secondary,
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.secondary,
          leading: IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon: const Icon(Icons.arrow_back, color: Colors.black,)),),
          body:   Padding(
            padding:  const EdgeInsets.only( left: 20,top: 10, right: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                
                children: [
                  const Text('Welcome back! Glad \nto see you. Again',style: TextStyle(fontSize: 30,color: Colors.black,fontWeight:FontWeight.w500 ),),
                  
                  const SizedBox(
                    height: 50,
                  ),
              const LoginForm(),
  
                 const SizedBox(
                    height: 50,
                  ),const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 135, vertical: 10 ),
                    child:  Text('Or Login with',)),
                    Row(children: [IconButton(onPressed: (){}, icon: const Icon(Icons.facebook, color: Color(0xFF4267B2),size: 35,),),
                    IconButton(onPressed: (){}, icon: const Icon(Icons.facebook, color: Color.fromARGB(255, 178, 152, 66),size: 35,),),
                    ],
                    ),
                ],),
            )
        
        
          ,
              
            ),
          ),
      ),
      )
    ;
  }
}