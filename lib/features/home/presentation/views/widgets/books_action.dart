import 'package:bookly/core/widgets/csutom_button.dart';
import 'package:flutter/material.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: CustomButton(
            text: "19.99 €",
            backGroundColor: Colors.white,
            borderRaduis: BorderRadius.only(
                topLeft: Radius.circular(12), bottomLeft: Radius.circular(12)),
            textColor: Colors.black,
          ),
        ),
        Expanded(
          child: CustomButton(
            text: "Free Preview",
            backGroundColor: Color(0xFFEF8363),
            borderRaduis: BorderRadius.only(
                topRight: Radius.circular(12),
                bottomRight: Radius.circular(12)),
            textColor: Colors.white,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
