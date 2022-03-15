// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:z_tech/bloc/cubit.dart';
import 'package:z_tech/bloc/states.dart';
import 'package:z_tech/models/component.dart';
import 'package:z_tech/modules/signup_screen.dart';
import 'package:form_validator/form_validator.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
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
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Hi there  !',
                            style: GoogleFonts.handlee(
                                textStyle: const TextStyle(
                                    fontSize: 50,
                                    color: Colors.deepOrangeAccent)),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Welcome Back',
                            style: GoogleFonts.handlee(
                                textStyle: const TextStyle(
                                    fontSize: 20, color: Colors.black)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                            color: Colors.grey,
                            blurRadius: 20,
                            offset: Offset.fromDirection(20, 20)
                        )
                      ]),
                      child: TextFormField(
                        validator: ValidationBuilder().email().build(),
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
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
                          prefixIcon: const Icon(
                            Icons.email_rounded,
                            color: Colors.grey,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          labelText: "E-mail",
                          labelStyle: GoogleFonts.handlee(
                              textStyle: const TextStyle(fontSize: 20)),
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
                        textInputAction: TextInputAction.go,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: ZTechCubit.get(context).isVisible,
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
                          prefixIcon: const Icon(
                            Icons.lock,
                            color: Colors.grey,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          labelText: 'Password',
                          labelStyle: GoogleFonts.handlee(
                              textStyle: const TextStyle(fontSize: 20)),
                          suffixIcon: IconButton(
                            icon: Icon(ZTechCubit.get(context).icon),
                            onPressed: () {
                              ZTechCubit.get(context).visible();
                            },
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'Forget Password?',
                            style: GoogleFonts.handlee(
                                textStyle: const TextStyle(
                                    fontSize: 15,
                                    color: Colors.deepOrangeAccent)),
                          )),
                    ),
                    const SizedBox(height: 20),
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
                                      offset: Offset.fromDirection(20, 20)
                                  )
                                ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 80),
                              child: Text(
                                'login'.toUpperCase(),
                                style: GoogleFonts.handlee(
                                    textStyle: const TextStyle(
                                        fontSize: 30, color: Colors.white)),
                              ),
                            ),
                          )),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                text: 'Don\'t have an account?  ',
                                style: GoogleFonts.handlee(
                                    textStyle: const TextStyle(
                                        fontSize: 15, color: Colors.black)),
                              ),
                            ]),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
                                PageRouteBuilder(
                                  transitionDuration:
                                      const Duration(milliseconds: 500),
                                  pageBuilder: (context, animation, _) {
                                    return FadeTransition(
                                      opacity: animation,
                                      child: SignUpScreen(),
                                    );
                                  },
                                ),
                              );
                            },
                            child: Text(
                              'Sign up',
                              style: GoogleFonts.handlee(
                                  textStyle: const TextStyle(
                                      fontSize: 15,
                                      color: Colors.deepOrangeAccent)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
