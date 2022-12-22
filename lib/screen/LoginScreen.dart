// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:profile_page/bloc/login_page/login_page_cubit.dart';
import 'package:profile_page/bloc/login_page/login_page_state.dart';
import 'package:profile_page/screen/ProfileScreen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:profile_page/custom/button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _LoginScreen();
  }
}

class _LoginScreen extends State<LoginScreen> {
  final LoginPageCubit cubit = LoginPageCubit();

  final TextEditingController _login = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext ctx) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        body: BlocBuilder<LoginPageCubit, LoginPageState>(
          bloc: cubit,
          builder: (context, state) {
            // return Container(
              padding: const EdgeInsets.all(40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Center(
                      child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Image(
                      image: AssetImage('assets/icons/favicon_mrsu192x192.png'),
                    ),
                  )),
                  SizedBox(
                    height: 70,
                    width: 400,
                    child: TextField(
                      style: const TextStyle(color: Colors.black),
                      controller: _login,
                      cursorColor: Colors.grey,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color.fromARGB(15, 237, 214, 214),
                        labelText: 'Username or email',
                        labelStyle: const TextStyle(color: Colors.grey),
                        hintText: 'Enter login',
                        hintStyle: const TextStyle(color: Colors.grey),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                            color: Colors.grey,
                            width: 2.0,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                            color: Colors.black38,
                            width: 2.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 70,
                    width: 400,
                    child: TextField(
                      style: const TextStyle(color: Colors.black),
                      cursorColor: Colors.grey,
                      obscureText: state.passVisible,
                      controller: _password,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color.fromARGB(15, 237, 214, 214),
                        hintStyle: const TextStyle(color: Colors.grey),
                        hintText: 'Enter password',
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                            color: Colors.grey,
                            width: 2.0,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                            color: Colors.black38,
                            width: 2.0,
                          ),
                        ),
                        labelText: 'Password',
                        labelStyle: const TextStyle(color: Colors.grey),
                        suffixIcon: IconButton(
                          icon: Icon(
                            state.passVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            cubit.passVisible();
                          },
                        ),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 40,
                        width: 300,
                        child: TextButton(
                          onPressed: () {
                            if (_login.text != "" && _password.text != "") {
                              Navigator.pushReplacementNamed(ctx, '/profile',
                                  arguments: ProfileScreenArguments(
                                      _login.text, _password.text));
                            }
                          },
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25)),
                            ),
                            backgroundColor: MaterialStateProperty.all<Color>(
                              const Color.fromARGB(255, 207, 25, 63),
                            ),
                          ),
                          child: const Text(
                            'LOGIN',
                            style: TextStyle(
                                fontSize: 15.0,
                                color: Color.fromARGB(255, 255, 255, 255)),
                          ),
                        ),
                      ),
                      CustomButton("Forgot password?"),
                      CustomButton("Don't have an account? Sign Up"),
                    ],
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

