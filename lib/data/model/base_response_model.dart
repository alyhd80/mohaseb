


import 'error_response_model.dart';

class BaseResponseModel<T>{
  bool isSuccess=true;
  T? data;
  ErrorResponseModel? errorResponseModel;
  BaseResponseModel();
}