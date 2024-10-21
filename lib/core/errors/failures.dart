import 'package:dio/dio.dart';

abstract class Failures {
  final String errMessage;

  const Failures(this.errMessage);
}

class ServerFailure extends Failures {
  ServerFailure(super.errMessage);

  factory ServerFailure.fromDioException(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.sendTimeout:
        return ServerFailure("Send Timeout with API Server");
      case DioExceptionType.connectionTimeout:
        return ServerFailure("Connection Timeout with API Server");
      case DioExceptionType.receiveTimeout:
        return ServerFailure("Receive Timeout with API Server");
      case DioExceptionType.cancel:
        return ServerFailure("Request is Cancelled");
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioError.response!.statusCode, dioError.response!.data);
      default:
        return ServerFailure("Oops! There was an Error, Please Try again");
    }
  }

  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 500) {
      return ServerFailure("Internal Server error, Please Try Again later!");
    } else if (statusCode == 404) {
      return ServerFailure(
          "Your request not found!!, Please Try again later !");
    } else {
      return ServerFailure("Oops, There was an Error, Please Try Again");
    }
  }
}
