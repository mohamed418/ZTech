// ignore_for_file: non_constant_identifier_names, prefer_function_declarations_over_variables

import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:google_fonts/google_fonts.dart';

LinearGradient gradient = const LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: <Color>[
    Colors.orange,
    Colors.deepOrange,
  ],
);

final validator1 = ValidationBuilder().email().maxLength(50).build();
final validator2 = (value) {
  if (value!.isEmpty) {
    return 'Please enter your first name';
  } else {
    return null;
  }
};
final validator3 = (value) {
  if (value!.isEmpty) {
    return 'Please enter your last name';
  } else {
    return null;
  }
};
final validator4 = (value) {
  if (value!.isEmpty) {
    return 'Please enter your password';
  } else {
    return null;
  }
};
final validator5 = (value) {
  if (value!.isEmpty) {
    return 'Please confirm your password';
  } else {
    return null;
  }
};

BoxDecoration decoration = BoxDecoration(boxShadow: [
  BoxShadow(
      color: Colors.grey, blurRadius: 20, offset: Offset.fromDirection(20, 20))
]);

Container container({
  required validator,
  required action,
  required TextInputType? type,
  required String text,
  IconData? prefix,
  IconData? suffix,
  bool secure = false,
  suffixPressed,
  Function? onSubmit,
}) =>
    Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: Colors.grey,
            blurRadius: 20,
            offset: Offset.fromDirection(20, 20))
      ]),
      child: TextFormField(
        validator: validator,
        textInputAction: action,
        keyboardType: type,
        obscureText: secure,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(40),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(40),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          prefixIcon: Icon(
            prefix,
            color: Colors.grey,
          ),
          filled: true,
          fillColor: Colors.white,
          labelText: text,
          labelStyle:
              GoogleFonts.handlee(textStyle: const TextStyle(fontSize: 20)),
          suffixIcon: IconButton(
            icon: Icon(suffix),
            onPressed: () {
              suffixPressed();
            },
          ),
        ),
      ),
    );
