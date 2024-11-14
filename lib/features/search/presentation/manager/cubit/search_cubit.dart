// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:bookly/features/search/data/repos/search_repo.dart';
import 'package:equatable/equatable.dart';

import 'package:bookly/features/home/data/models/book_model/book_model.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(
    this.searchRepo,
  ) : super(SearchInitial());

  final SearchRepo searchRepo;

  Future<void> fetchSearchBooks({required String category}) async {
    emit(SearchLoading());
    var result = await searchRepo.fetchSearchBooks(category: category);
    result.fold((failure) {
      emit(SearchFailure(errMessage: failure.errMessage));
    }, (books) {
      emit(SearchSuccess(books: books));
    });
  }
}
