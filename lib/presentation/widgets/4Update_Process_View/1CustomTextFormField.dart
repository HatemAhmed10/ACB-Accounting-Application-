import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextFormFieldByinitialValue extends StatelessWidget {
  CustomTextFormFieldByinitialValue(
      {super.key,
      required this.textEditingController,
      required this.HintText,
      required this.icons,
      required this.validatorFunctoion,
      this.onChangedFunctoion,
      required this.keyboardType});
  TextEditingController textEditingController;
  String HintText;
  IconData icons;
  final String? Function(String?)? validatorFunctoion;
  final String? Function(String)? onChangedFunctoion;

  TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChangedFunctoion,
      keyboardType: keyboardType,
      cursorColor: Colors.yellow,
      style: TextStyle(color: Colors.blue),
      controller: textEditingController,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        hintText: HintText,
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 15, right: 10),
          child: Icon(
            icons,
            color: Colors.amber,
          ),
        ),
        hintStyle: TextStyle(color: Colors.grey, fontSize: 15),

        fillColor:
            Colors.black.withOpacity(0.3), // Set the background color here
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.0),
          borderSide: BorderSide(
            color: Colors.blue
                .withOpacity(0.3), // Set the normal border color here
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.0),
          borderSide: BorderSide(
            color: Colors.blue, // Set the focused border color here
            width: 2.0,
          ),
        ),

        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.0),
          borderSide: BorderSide(
            color: Colors.red, // Set the error border color here
            width: 2.0,
          ),
        ),
      ),

      // validator: (String? value) {
      //   if (value == null || value.isEmpty) {
      //     return 'Please enter Text';
      //   }
      //   return null;
      // },
      validator: validatorFunctoion,
    );
  }
}
