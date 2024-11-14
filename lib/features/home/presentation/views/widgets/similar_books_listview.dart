import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/features/home/presentation/manager/similar%20books/similar_books_cubit.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SimiarBooksListview extends StatelessWidget {
  const SimiarBooksListview({
    super.key,
  });
  // final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (context, state) {
        if (state is SimilarBooksSuccess) {
          return SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.15,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: state.books.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    GoRouter.of(context).push(
                      AppRouter.kBookDetailsView,
                      extra: state.books[index],
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: CustomBookImage(
                      imageUrl: state
                              .books[index].volumeInfo.imageLinks?.thumbnail ??
                          "https://buffer.com/library/content/images/size/w1200/2023/10/free-images.jpg",
                    ),
                  ),
                );
              },
            ),
          );
        } else if (state is SimilarBooksFailure) {
          return ErrorWidget(state.errMessage);
        } else {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          );
        }
      },
    );
  }
}
