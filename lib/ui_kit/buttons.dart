import 'package:flutter/material.dart';
 Widget button(void Function() buttonMethod, BuildContext context, String text , {Color? bgColor,Color? fgColor} )
{
  return
ElevatedButton(onPressed: buttonMethod,  style: ElevatedButton.styleFrom(backgroundColor: bgColor?? Theme.of(context).colorScheme.primary , foregroundColor: fgColor?? Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3),), minimumSize: const Size(double.infinity, 50) ,),child: Text(text, style: const TextStyle(fontSize: 17,), ));
}
