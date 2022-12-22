
// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextBlock extends StatefulWidget {
  String text = "";

  TextBlock(this.text, {super.key});

  @override
  State<TextBlock> createState() => _TextBlockState();
}

class _TextBlockState extends State<TextBlock> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text,
      style: const TextStyle(
          fontSize: 12.5, color: Color.fromARGB(255, 255, 255, 255)),
      textAlign: TextAlign.center,
    );
  }
}

class CustomButton extends StatelessWidget {
  String text = "";
  String login = "";
  String password = "";

  CustomButton(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: 300,
      child: TextButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          ),
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        ),
        onPressed: () {},
        child: Text(
          text,
          style: const TextStyle(
              fontSize: 12.5, color: Color.fromARGB(255, 207, 25, 63)),
        ),
      ),
    );
  }
}
