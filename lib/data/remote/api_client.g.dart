
part of 'api_client.dart';

// **************************************************************************
// RetrofitGenerator
// ***************************

class _ApiClient implements ApiClient {
  final Dio _dio;
  AppPreferencesHelper appPreferencesHelper;
  String baseUrl;

  _ApiClient(this._dio, this.appPreferencesHelper, {required this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    baseUrl = Urls.apiUrl;
    _dio.interceptors.add(LogInterceptor());
    _dio.options.baseUrl = baseUrl;
    _dio.options.followRedirects = true;
    _dio.options.receiveTimeout = Duration(milliseconds: 20000);
    _dio.options.connectTimeout = Duration(milliseconds:
    5000

    );

    _dio.options.headers['content-Type'] = 'application/json';
    _dio.options.headers['accept'] = 'application/json';
  }

}