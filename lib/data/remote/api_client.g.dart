
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

  Future<void> handleToken() async {
    _dio.options.headers.remove('Authorization');
    String? token = await appPreferencesHelper.getAccessToken();
    if (token != null && token.isNotEmpty) {
      _dio.options.headers['Authorization'] = "JWT $token";
    }
  }

  Future<void> handleError(
      DioException dioError,
      BuildContext context,
      ) async {
    if (dioError.response?.statusCode == 401) {
      await appPreferencesHelper.userClear();
      await appPreferencesHelper.setUserLoggedInMode(0);
      _dio.options.headers.remove('Authorization');

      ///        bad dorost knm
      // Navigator.pushNamedAndRemoveUntil(
      //     context,
      //     Urls.isMentor ? AppRout.loginConsultant : AppRout.login,
      //         (route) => false);
    }
  }

  @override
  Future<BaseResponseModel<LoginModel>> login({required BuildContext context, required Map<String,dynamic> map}) async {
    // TODO: implement login
    await handleToken();

    BaseResponseModel<LoginModel> value = BaseResponseModel();

    try {
      final _result = await _dio.get(Urls.login, queryParameters: map);
      value.data = LoginModel.fromJson(_result.data);
      value.isSuccess = true;
    } on DioException catch (e) {
      if (e.response != null) {
        value.errorResponseModel =
            ErrorResponseModel.fromJson(e.response?.data);
        await handleError(e, context);
      }
      value.isSuccess = false;
    }
    return value;
  }

  @override
  Future<BaseResponseModel> verifyLogin({required BuildContext context, required Map<String, dynamic> map}) async {
    // TODO: implement verifyLogin
    await handleToken();

    BaseResponseModel value = BaseResponseModel();

    try {
      final _result = await _dio.post(Urls.login, data: map);
      // value.data = LoginModel.fromJson(_result.data);
      value.isSuccess = true;
    } on DioException catch (e) {
      if (e.response != null) {
        value.errorResponseModel =
            ErrorResponseModel.fromJson(e.response?.data);
        await handleError(e, context);
      }
      value.isSuccess = false;
    }
    return value;
  }





}