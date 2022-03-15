// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_validator/form_validator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:z_tech/bloc/cubit.dart';
import 'package:z_tech/bloc/states.dart';
import 'package:z_tech/models/component.dart';
import 'package:z_tech/modules/login_screen.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);
  var formLoginKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<ZTechCubit, ZTechStates>(
      listener: (context, state) {},
      builder: (context, state) => SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Form(
          key: formLoginKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 270,
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 95,
                      right: 40,
                      child: Transform.rotate(
                        angle: -4.0,
                        child: Container(
                          width: 200,
                          height: 300,
                          decoration: BoxDecoration(
                              color: Colors.black87,
                              borderRadius: BorderRadius.circular(50)),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 160,
                      right: 250,
                      child: Transform.rotate(
                        angle: -4.0,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 90),
                          child: Container(
                            width: 300,
                            height: 300,
                            decoration: BoxDecoration(
                                color: Colors.deepOrangeAccent,
                                borderRadius: BorderRadius.circular(50)),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 140,
                      right: 190,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.of(context).pushReplacement(
                                  PageRouteBuilder(
                                    transitionDuration:
                                        const Duration(milliseconds: 500),
                                    pageBuilder: (context, animation, _) {
                                      return FadeTransition(
                                        opacity: animation,
                                        child: LoginScreen(),
                                      );
                                    },
                                  ),
                                );
                              },
                              icon: const Icon(
                                Icons.arrow_back_ios,
                                color: Colors.deepOrange,
                              )),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            'welcome  !',
                            style: GoogleFonts.handlee(
                                textStyle: const TextStyle(
                                    fontSize: 50,
                                    color: Colors.deepOrangeAccent)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: NameContainer(
                            validator: validator2,
                            action: TextInputAction.next,
                            type: TextInputType.name,
                            text: "First Name",
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: NameContainer(
                            validator: validator3,
                            action: TextInputAction.next,
                            type: TextInputType.name,
                            text: "Last Name",
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Container(
                      decoration: decoration,
                      child: TextFormField(
                        validator: ValidationBuilder().email().build(),
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.red),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          labelText: "E-mail",
                          labelStyle: GoogleFonts.handlee(
                              textStyle: const TextStyle(fontSize: 20)),
                          suffixIcon: const Icon(
                            Icons.email_rounded,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      decoration: decoration,
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your password';
                          } else {
                            return null;
                          }
                        },
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: ZTechCubit.get(context).isVisible1,
                        decoration: InputDecoration(
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.red),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          labelText: 'Password',
                          labelStyle: GoogleFonts.handlee(
                              textStyle: const TextStyle(fontSize: 20)),
                          suffixIcon: IconButton(
                            icon: Icon(ZTechCubit.get(context).icon1),
                            onPressed: () {
                              ZTechCubit.get(context).visible1();
                            },
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      decoration: decoration,
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please confirm your password';
                          } else {
                            return null;
                          }
                        },
                        textInputAction: TextInputAction.go,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: ZTechCubit.get(context).isVisible2,
                        decoration: InputDecoration(
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.red),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          labelText: 'Confirm Password',
                          labelStyle: GoogleFonts.handlee(
                              textStyle: const TextStyle(fontSize: 20)),
                          suffixIcon: IconButton(
                            icon: Icon(ZTechCubit.get(context).icon2),
                            onPressed: () {
                              ZTechCubit.get(context).visible2();
                            },
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Align(
                      alignment: Alignment.center,
                      child: TextButton(
                          onPressed: () {
                            if (formLoginKey.currentState!.validate()) {
                              FocusScope.of(context).unfocus();
                            } else {
                              FocusScope.of(context).unfocus();
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: gradient,
                              borderRadius: BorderRadius.circular(50),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 10,
                                    offset: Offset.fromDirection(20, 20))
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 80),
                              child: Text(
                                'signup'.toUpperCase(),
                                style: GoogleFonts.handlee(
                                    textStyle: const TextStyle(
                                        fontSize: 30, color: Colors.white)),
                              ),
                            ),
                          )),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
