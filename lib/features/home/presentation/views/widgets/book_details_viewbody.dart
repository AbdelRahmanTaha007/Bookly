import 'package:bookly/features/home/presentation/views/widgets/books_details_section.dart';
import 'package:bookly/features/home/presentation/views/widgets/similar_books_section.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                children: [
                  BookDetailsSection(),
                    Expanded(
          child: SizedBox(
            height: 50,
          ),
        ),
                  SimilarBookSection(),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            )),
      ],
    );
  }
}
