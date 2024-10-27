import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_mgmt/provider/validation_provider.dart';

import 'package:task_mgmt/screens/todo_list_screen.dart';
import 'package:task_mgmt/ui_kit/buttons.dart';
import 'package:task_mgmt/ui_kit/snackbar.dart';
import 'package:task_mgmt/ui_kit/textfields.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
    final _formKey = GlobalKey<FormState>();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    String? validateEmail(value)
    {
      if(value.isEmpty|| value==null){
        return 'Enter your email';
      }
      RegExp emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
      if(!emailRegExp.hasMatch(value))
      {
return 'Enter valid email';
      }
      return null;
    
    
}

String? validatePassword(value)
{
  if(value.isEmpty || value==null)
  {
    return 'Enter your password';
  }
RegExp pwdRegExp = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
if(!pwdRegExp.hasMatch(value)){
  return 'password should consist of a symbol,digit,capital and small letter';
}
return null;
}
@override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();

  }
  @override
  Widget build(BuildContext context) {
    final showPassword = context.watch<ValidationProvider>();
    return Form(
      key: _formKey,
  child: Column(
    children: [textFields(
      controller:emailController ,
      validator: (value) {
       return validateEmail(value);
      },
      'Enter your email'),
    const SizedBox(height: 12,),
    textFields(
      controller: passwordController,
      validator: (value) {
return validatePassword(value);
      },
      'Enter your password',icon: showPassword.obscureText? Icons.visibility: Icons.visibility_off,obscureText: showPassword.obscureText? true: false,iconButtonPress: showPassword.showPasswordPress ),
    const SizedBox(
                    height: 10,
                    
                  ),
    button((){
      if(_formKey.currentState!.validate())
      {
 setState(() {
   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
return const TodoListScreen();
   }));
 });
      }
      else{
     
    snackbar(context, 'Enter your detail');      
      }    
                  
                  }, context, 'Login'),]),
    );
  }
}