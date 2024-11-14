import 'package:bookly/core/errors/failures.dart';
import 'package:bookly/core/utils/api_service.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/search/data/repos/search_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImpl implements SearchRepo {
    final ApiService apiService;

  SearchRepoImpl( this.apiService);
  @override
  Future<Either<Failures, List<BookModel>>> fetchSearchBooks({required String category}) async{
    
    try {
      var data = await apiService.get(
          endPoint:
              "volumes?Filtering=free-ebooks&Sorting=relevance &q=subject:$category");

      List<BookModel> books = [];
      for (var element in data['items']) {
        books.add(BookModel.fromJson(element));
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

}