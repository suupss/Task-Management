import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_mgmt/Services/auth_service.dart';
import 'package:task_mgmt/provider/validation_provider.dart';
import 'package:task_mgmt/screens/login_screen.dart';
import 'package:task_mgmt/ui_kit/buttons.dart';
import 'package:task_mgmt/ui_kit/snackbar.dart';
import 'package:task_mgmt/ui_kit/textfields.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
    final _formKey = GlobalKey<FormState>();
    TextEditingController userNamecontroller = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmController = TextEditingController();
    bool displaySnackbar = false;
    final _auth = AuthService();

    void showSnackBar()
    {
      if(!displaySnackbar)
      {
        displaySnackbar = true;
      
      snackbar(context, 'Enter your detail'); 
      }    
    }

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
String? validateUsername(value)
{
  if(value.isEmpty || value==null)
  {
    return 'Enter your username';
  }
  return null;
}
String? confirmPassword(value)
{
  if(value.isEmpty|| value == null)
  {
    return 'Enter the password again';
  }
  if(passwordController.text!=confirmController)
  {
return 'The password doesn\' match';
  }
return null;
}


  @override
  Widget build(BuildContext context) {
    final showPassword = context.watch<ValidationProvider>();
    return Form(
      key: _formKey,
  child: Column(
    children: [
textFields('Username',
controller: userNamecontroller,
validator: (value) {
  return validateUsername(value);
},
) ,
const SizedBox(height: 12,),
     textFields(
      controller: emailController,
      validator: (value) {
       return validateEmail(value);
      },
      'email'),
    const SizedBox(height: 12,),
    textFields(
      controller: passwordController,
      validator: (value) {
return validatePassword(value);
      },
      'password',icon: showPassword.obscureText? Icons.visibility: Icons.visibility_off,obscureText: showPassword.obscureText? true: false,iconButtonPress: showPassword.showPasswordPress ),
    const SizedBox(
                    height: 10,
                    
                ),
                textFields('Confirm password',
                controller: confirmController,
                validator:(value){
                  return confirmPassword(value);
                } ),
                 const SizedBox(
                    height: 10,
                    
                
                ),
    button((){_signup();}, context, 'Login'),]),
    );

  }
  _signup() async
  {
   
    if(_formKey.currentState!.validate())
    { 
 final user = await _auth.createUserWithEmailAndPassword(emailController.text, passwordController.text);
 if(user!=null)
 { Navigator.push(context, MaterialPageRoute(builder: (context){
        return const LoginScreen();
 }));
    }
    else{
      snackbar(context, 'Error Occured ');
    }
    }

  }
  }
