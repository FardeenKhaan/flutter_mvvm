import 'package:flutter_mvvm/data/response/status.dart';

class ApiResponse<T> {
  Status? status;
  T? data;
  String? message;

  ApiResponse({this.status, this.data, this.message});

  ApiResponse.loading(this.message) : status = Status.LOADING;
  ApiResponse.success(this.data) : status = Status.SUCCESS;
  ApiResponse.error(this.message) : status = Status.ERROR;
  @override
  String toString() {
    return "Status: $status,\n Message: $message,\n Data: $data";
  }
}
