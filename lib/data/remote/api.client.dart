import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:mohaseb/data/local/app_perfrence.dart';
import 'package:mohaseb/data/model/base_response_model.dart';
import 'package:mohaseb/data/model/error_response_model.dart';
import 'package:mohaseb/data/model/login_end_model.dart';
import 'package:mohaseb/data/model/login_model.dart';
import 'package:mohaseb/data/model/user_profile_model.dart';
import 'package:mohaseb/route/AppRouter.gr.dart';
import 'package:mohaseb/utils/app_constant/urls.dart';
import 'package:auto_route/auto_route.dart';

part 'api.client.g.dart';

abstract class ApiClient {
  factory ApiClient(Dio dio, AppPreferencesHelper appPreferencesHelper,
      {required String baseUrl}) = _ApiClient;

  Future<BaseResponseModel<LoginModel>> login(
      {required BuildContext context, required Map<String,dynamic> map});

  Future<BaseResponseModel<LoginEndModel>> verifyLogin(
      {required BuildContext context, required Map<String,dynamic> map});

  Future<BaseResponseModel<LoginEndModel>> loginPassword(
      {required BuildContext context, required Map<String,dynamic> map});

  Future<BaseResponseModel> logOut(
      {required BuildContext context});

  Future<BaseResponseModel<UserProfileModel>> getUserProfile(
      {required BuildContext context});

  Future<BaseResponseModel> setNewPassword(
      {required BuildContext context, required Map<String,dynamic> map});



}
