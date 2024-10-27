import 'package:flutter/material.dart';

snackbar(BuildContext context, String text , {Color? bgColor} )
{
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text), backgroundColor: bgColor ?? Theme.of(context).colorScheme.primary , duration: const Duration(seconds: 2), ));
}