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


dynamic fun(value){
  if (value!.isEmpty) {
    return 'Please enter your first name';
  } else {
    return null;
  }
}

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
      color: Colors.grey,
      blurRadius: 20,
      offset: Offset.fromDirection(20, 20)
  )
]);

Container NameContainer({required validator, required action, required type, required text,}) => Container(
  decoration: BoxDecoration(boxShadow: [
    BoxShadow(
        color: Colors.grey,
        blurRadius: 20,
        offset: Offset.fromDirection(20, 20)
    )
  ]),
  child: TextFormField(
    validator: validator,
    textInputAction: action,
    keyboardType: type,
    decoration: InputDecoration(
      hoverColor: Colors.black38,
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.grey),
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
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.red),
        borderRadius: BorderRadius.circular(40),
      ),
      filled: true,
      fillColor: Colors.white,
      labelText: text,
      labelStyle: GoogleFonts.handlee(
          textStyle: const TextStyle(fontSize: 20)),
    ),
  ),
);


