

import 'package:dio/dio.dart';
import 'package:mohaseb/data/local/app_perfrence.dart';
import 'package:mohaseb/utils/app_constant/strings.dart';

part 'api_client.g.dart';


abstract class ApiClient {
  factory ApiClient(Dio dio, AppPreferencesHelper appPreferencesHelper,
      {required String baseUrl}) = _ApiClient;

}