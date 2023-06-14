import 'package:flutter/material.dart';
class CustomFormTextField extends StatelessWidget {
  CustomFormTextField({this.label,this.onChanged});
  String? label;
Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      validator: (data) {
        if(data!.isEmpty){
          return 'field is required';
        }
      },
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
        filled: true,
          fillColor: Colors.blueGrey[50],
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                  color: Colors.grey,
              )
          ),
          border: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.white
              ),
          )
      ),
    );
  }
}
