import 'package:bookly/core/functions/launch_url.dart';
import 'package:bookly/core/widgets/csutom_button.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:flutter/material.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: CustomButton(
            text: "Free",
            backGroundColor: Colors.white,
            borderRaduis: BorderRadius.only(
                topLeft: Radius.circular(12), bottomLeft: Radius.circular(12)),
            textColor: Colors.black,
          ),
        ),
        Expanded(
          child: CustomButton(
            onPressed: () {
              urlLauncher(context, bookModel.volumeInfo.previewLink!);
            },
            text: getText(bookModel),
            backGroundColor: const Color(0xFFEF8363),
            borderRaduis: const BorderRadius.only(
                topRight: Radius.circular(12),
                bottomRight: Radius.circular(12)),
            textColor: Colors.white,
            fontSize: 16,
          ),
        ),
      ],
    );
  }

  String getText(BookModel bookModel) {
    if (bookModel.volumeInfo.previewLink == null) {
      return "Not Available";
    } else {
      return "Free Preview";
    }
  }
}
