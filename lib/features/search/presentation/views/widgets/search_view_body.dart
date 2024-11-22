import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/home/presentation/views/widgets/best_seller_listview_item.dart';
import 'package:bookly/features/home/presentation/views/widgets/featured_listview_item.dart';
import 'package:bookly/features/search/presentation/manager/cubit/search_cubit.dart';
import 'package:bookly/features/search/presentation/views/widgets/custom_search_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({
    super.key,
  });
  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
  @override
  void initState() {
    super.initState();
  }

  TextEditingController? controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 16,
          ),
          CustomSearchTextField(
            onPressed: () {
              BlocProvider.of<SearchCubit>(context)
                  .fetchSearchBooks(category: controller?.text ?? "");
            },
            onSubmitted: (value) {
              controller!.text = value;
              BlocProvider.of<SearchCubit>(context)
                  .fetchSearchBooks(category: controller?.text ?? "");
            },
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            "Search Result",
            style: Styles.textStyle18.copyWith(fontFamily: kGtSectraFine),
          ),
          const SizedBox(
            height: 20,
          ),
          const Expanded(child: SearchResultsListView())
        ],
      ),
    );
  }
}

class SearchResultsListView extends StatelessWidget {
  const SearchResultsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchSuccess) {
          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount: state.books.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: BookListviewItem(
                  booksModel: state.books[index],
                ),
              );
            },
          );
        } else if (state is SearchFailure) {
          return Center(child: CustomErrorWidget(errMessage: state.errMessage));
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
