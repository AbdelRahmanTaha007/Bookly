import 'package:bookly/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';

class SimiarBooksListview extends StatelessWidget {
  const SimiarBooksListview({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.15,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        itemBuilder: (BuildContext context, int index) {
          return const Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.0),
            child: CustomBookImage(imageUrl: "https://buffer.com/library/content/images/size/w1200/2023/10/free-images.jpg",),
          );
        },
      ),
    );
  }
}
