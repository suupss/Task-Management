import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_mgmt/provider/validation_provider.dart';
import 'package:task_mgmt/screens/register_form.dart';


class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context)=> ValidationProvider())],
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        body: const Padding(
          padding: EdgeInsets.only(top: 120,left: 20,right: 20),
          child: Column(children: [
            Text('Hello! Register to get started', style: TextStyle(fontSize: 30,color: Colors.black,fontWeight: FontWeight.w500),),
            SizedBox(height: 20,),
      RegisterForm()
      
          ],),
        ),
      ),
    );
  }
}