
import 'dart:async';

import 'package:flutter/material.dart';
import '../../constant/textstyle.dart';

class TextFieldss extends StatelessWidget {
   TextFieldss({Key? key, required this.title, required this.hint, this.Controller}) : super(key: key);

  final String title;
  final String hint;
  final TextEditingController? Controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,style: subtext,),
        TextField(
          controller: Controller,
          decoration: InputDecoration(
              hintText: hint,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color:Colors.black))),
        ),
      ],
    );
  }
}
