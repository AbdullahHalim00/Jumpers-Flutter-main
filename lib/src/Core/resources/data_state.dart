import 'package:jumper/src/Bloc/models/pagination.dart';

enum ErrorType {
  serverSide,
  networkConnection,
  dataEmpty,
  unKnown,
  message,
}

class ErrorModel {
  ErrorType? errorType;
  String? errorTitle;

  ErrorModel({
    this.errorType,
    this.errorTitle,
  });
}

abstract class DataState<T> {
  final T? data;
  final T? searchData;
  final Pagination? pagination;
  final ErrorModel? error;
  final String? message;

  const DataState({
    this.data,
    this.pagination,
    this.error,
    this.message,
    this.searchData,
  });

  @override
  String toString() {
    return 'DataState{data: $data, pagination: $pagination, error: $error}';
  }
}

class DataSuccess<T> extends DataState<T> {
  const DataSuccess(T data,
      {String? message, T? searchData, Pagination? pagination})
      : super(
            data: data,
            message: message,
            pagination: pagination,
            searchData: searchData);
}

class DataFailed<T> extends DataState<T> {
  const DataFailed(ErrorModel error) : super(error: error);
}

class DataInitial<T> extends DataState<T> {
  const DataInitial() : super();
}

class DataLoading<T> extends DataState<T> {
  const DataLoading() : super();
}

class DataSearchLoading<T> extends DataState<T> {
  const DataSearchLoading() : super();
}

extension DataReady on DataState {
  bool ready() {
    return this is DataSuccess;
  }

  bool unReady() {
    return this is! DataSuccess;
  }
}
