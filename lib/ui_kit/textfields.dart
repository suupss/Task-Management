import 'package:flutter/material.dart';
Widget textFields(String hintText,{IconData? icon, bool? obscureText, void Function()? iconButtonPress, String? Function(String?)? validator, TextEditingController? controller}  ){
 return           TextFormField(
  controller: controller,
            validator: validator,     
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(13),
                borderSide: BorderSide.none
                ),
                filled: true,
                fillColor: Colors.white,
                hintText: hintText,
                hintStyle: const TextStyle(color: Colors.grey),
                suffixIcon: IconButton(onPressed: iconButtonPress , icon: Icon(icon)),
                
                
            ),
            obscureText: obscureText ?? false,
            
          );

}