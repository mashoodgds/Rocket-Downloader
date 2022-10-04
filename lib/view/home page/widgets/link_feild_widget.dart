import 'package:downloader/constant/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LinkFeild extends StatefulWidget {
  const LinkFeild({Key? key, required this.linkController}) : super(key: key);
  final TextEditingController linkController;

  @override
  State<LinkFeild> createState() => _LinkFeildState();
}

class _LinkFeildState extends State<LinkFeild> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(
          MediaQuery.of(context).size.width * 0.07,
          MediaQuery.of(context).size.height * 0.02,
          MediaQuery.of(context).size.width * 0.07,
          0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
            Radius.circular(MediaQuery.of(context).size.width * 0.015)),
      ),
      child: TextFormField(
          controller: widget.linkController,
          autovalidateMode: AutovalidateMode.onUserInteraction,

          ///////Validator
          validator: (value) {
            if (value!.isEmpty) {
              return ("Feild Cannot be Empty");
            }
            return null;
          },
          onSaved: (value) {
            widget.linkController.text = value!;
          },

          //////////////////

          style: TextStyle(color: AppTheme.myHintTestColor),
          decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey, width: 0.5)),
            fillColor: Colors.grey.withOpacity(0.25),
            filled: true,
            border: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 12.0)),
            hintText: 'Paste your link here ',
            focusColor: Colors.black,
            hintStyle: const TextStyle(color: Colors.grey),
          )),
    );
  }
}
