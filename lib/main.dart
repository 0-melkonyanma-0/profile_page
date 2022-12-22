import 'package:flutter/material.dart';
import 'package:profile_page/screen/ProfileScreen.dart';
import 'package:profile_page/screen/LoginScreen.dart';


void main() => runApp(MaterialApp(
      initialRoute: "/",
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => const LoginScreen(),
        "/profile": (context) => const ProfileScreen()
      },
    ));