import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({
    super.key,
    this.onSubmitted,
    this.onPressed,
  });
  // String controller;
  // final String value;
  final void Function(String)? onSubmitted;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return TextField(
      onSubmitted: onSubmitted,
      decoration: InputDecoration(
          enabledBorder: buildOutlinedInputBorder(),
          focusedBorder: buildOutlinedInputBorder(),
          hintText: "Search",
          suffixIcon: IconButton(
              onPressed: onPressed,
              icon: const Opacity(
                opacity: 0.8,
                child: Icon(
                  FontAwesomeIcons.magnifyingGlass,
                  size: 24,
                  color: Colors.white,
                ),
              ))),
    );
  }

  OutlineInputBorder buildOutlinedInputBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(color: Colors.white));
  }
}
