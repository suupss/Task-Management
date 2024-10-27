import 'package:flutter/material.dart';
import 'package:task_mgmt/screens/login_screen.dart';
import 'package:task_mgmt/screens/register_screen.dart';
import 'package:task_mgmt/ui_kit/buttons.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 150, right: 15,left: 15),
        child: Column(children:[ Image.asset('assets/images/logo.png',
            ),
            const SizedBox(height: 80,),
          button((){
            Navigator.push(context, MaterialPageRoute(builder: (context){
return const LoginScreen();
            }));
          }, context, 'Login'),
          const SizedBox(height: 10),
          button((){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
              return const RegisterScreen();
            }));
          }, context, 'Sign Up', bgColor:Theme.of(context).colorScheme.secondary,fgColor: Colors.black ),
          const SizedBox(
            height: 18,
          ),
          Text('Continue as Guest',style: Theme.of(context).textTheme.bodyMedium,)
           
        ]),
      ),
    );
  }
}