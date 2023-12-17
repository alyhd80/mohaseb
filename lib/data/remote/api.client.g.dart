
part of 'api.client.dart';

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
    _dio.options.receiveTimeout = Duration(seconds: 60);
    _dio.options.connectTimeout = Duration(seconds: 60);

    // _dio.options.headers['content-Type'] = 'application/json';
    _dio.options.headers['accept'] = 'application/json';
  }

  Future<void> handleToken() async {
    _dio.options.headers.remove('Authorization');
    String? token = await appPreferencesHelper.getAccessToken();
    if (token != null && token.isNotEmpty) {
      _dio.options.headers['Authorization'] = "Bearer $token";
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

      context.router.pushAndPopUntil(Login(),predicate: (t){
        return false;
      });
    }
  }

  @override
  Future<BaseResponseModel<LoginModel>> login({required BuildContext context, required Map<String,dynamic> map}) async {
    await handleToken();

    BaseResponseModel<LoginModel> value = BaseResponseModel();

    try {
      final _result = await _dio.post(Urls.login, data: map);
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
  Future<BaseResponseModel<LoginEndModel>> verifyLogin({required BuildContext context, required Map<String, dynamic> map}) async {
    await handleToken();

    BaseResponseModel<LoginEndModel> value = BaseResponseModel();
    print("map---------------------------");
print(map);
    try {
      final _result = await _dio.post(Urls.loginOtp, data: map);
      print("data------------------------");
      print(_result.data);

      value.data=LoginEndModel.fromJson(_result.data);

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
  Future<BaseResponseModel<LoginEndModel>> loginPassword({required BuildContext context, required Map<String, dynamic> map}) async {
    await handleToken();

    BaseResponseModel<LoginEndModel> value = BaseResponseModel();

    try {
      final _result = await _dio.post(Urls.loginPassword, data: map);

      value.data=LoginEndModel.fromJson(_result.data);
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
  Future<BaseResponseModel> logOut({required BuildContext context}) async {
    await handleToken();

    BaseResponseModel value = BaseResponseModel();

    try {
      final _result = await _dio.post(Urls.logOut);
      print(_result.data);

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
  Future<BaseResponseModel<UserProfileModel>> getUserProfile({required BuildContext context}) async {


    await handleToken();

    BaseResponseModel<UserProfileModel> value = BaseResponseModel();

    try {
      final _result = await _dio.get(Urls.userProfile);
      value.data=UserProfileModel.fromJson(_result.data);
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
  Future<BaseResponseModel> setNewPassword({required BuildContext context, required Map<String, dynamic> map}) async {
    await handleToken();

    BaseResponseModel value = BaseResponseModel();

    try {
      final _result = await _dio.post(Urls.resetPassword,data: map);
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