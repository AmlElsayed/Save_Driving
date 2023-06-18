import 'package:flutter/material.dart';
class CustomFormTextField extends StatelessWidget {
  CustomFormTextField({this.label,this.onChanged,required this.onController});
  String? label;
 Function(String)? onChanged;
 TextEditingController onController;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: onController,
      onChanged: onChanged,
      validator: (data) {
        if(data!.isEmpty){
          return 'field is required';
        }
      },
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(10),
        //contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 5),
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
