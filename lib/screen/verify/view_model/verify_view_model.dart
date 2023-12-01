import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mohaseb/application/data_provider.dart';
import 'package:mohaseb/service/show_toast.dart';
import 'package:mohaseb/utils/app_constant/strings.dart';

class VerifyViewModel extends ChangeNotifier {
  bool _changeSizeHeight = true;
  TextEditingController pinCodeTextEditingController=TextEditingController();
  bool _isLoading=false;


  bool get isLoading => _isLoading;

  bool get changeSizeHeight => _changeSizeHeight;

  Future<void> findNavigationPage(
    BuildContext context,
    WidgetRef ref,
  ) async {
    if (_changeSizeHeight) {
      _changeSizeHeight = false;
    } else {
      _changeSizeHeight = true;
    }

    print(_changeSizeHeight);
    notifyListeners();
  }

  Future<void> callApiToVerify(
      BuildContext context,
      WidgetRef ref,{required String phoneNumber,required String token}
      )async{
    _isLoading=true;
    notifyListeners();


    final response = await ref.read(apiClientProvider).verifyLogin(
        context: context, map: {    "signature":token,
      "code":pinCodeTextEditingController.text,
      "phone":phoneNumber});




    if (response.isSuccess) {
      showToast(
          context: context,
          title: "موفقیت",
          detail: "ورود موفقعیت امیز - ابول بقیشو درست کنه اوک می کنم",
          isSuccess: true);

    } else {
      showToast(
          context: context,
          title: "خطا",
          detail: response.errorResponseModel != null &&
              response.errorResponseModel!.message!.isNotEmpty
              ? response.errorResponseModel!.message!
              : Strings.unknownError,
          isSuccess: false);
    }







    _isLoading=false;
    notifyListeners();
  }




}

final verifyViewModelProvider =
    ChangeNotifierProvider.autoDispose<VerifyViewModel>(
  (ref) => VerifyViewModel(),
);
