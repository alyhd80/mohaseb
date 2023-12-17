import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mohaseb/application/data_provider.dart';
import 'package:mohaseb/data/model/user_profile_model.dart';
import 'package:mohaseb/service/show_toast.dart';
import 'package:mohaseb/utils/app_constant/strings.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';

class ProfileViewModel extends ChangeNotifier {
  bool _isLoading = true;
  bool _isSuccess = false;

  bool get isLoading => _isLoading;
  bool _isEditable = false;

  bool get isEditable => _isEditable;
  TextEditingController firstNameTextEditingController =
      TextEditingController(text: "امیر");
  TextEditingController lastNameTextEditingController =
      TextEditingController(text: "امیر");
  TextEditingController bioTextEditingController =
      TextEditingController(text: "امیر");
  TextEditingController emailEditingController =
      TextEditingController(text: "booleannemati@gmail.com");
  TextEditingController numberEditingController =
      TextEditingController(text: "09116163941");
  String birthData = "1402.05.10";
  String province = "گیلان";
  String city = "رشت";

  late UserProfileModel _userProfileModel = UserProfileModel();

  UserProfileModel get userProfileModel => _userProfileModel;

  set isEditable(bool value) {
    _isEditable = value;
    notifyListeners();
  }

  void _setData() {
    firstNameTextEditingController.text =
        _userProfileModel.data!.firstName ?? "";
    lastNameTextEditingController.text = _userProfileModel.data!.lastName ?? "";
    emailEditingController.text = _userProfileModel.data!.email ?? "";
  }

  Future<void> selectDateTime({required BuildContext context}) async {
    Jalali? picked = await showPersianDatePicker(
      context: context,
      initialDate: Jalali.now(),
      firstDate: Jalali(1320, 8),
      lastDate: Jalali(1450, 9),
      errorFormatText: "ŁŲ±Ł…ŲŖ ŲŖŲ§Ų±ŪŲ® ŲµŲ­ŪŲ­ Ł†Ł…Ū ŲØŲ§Ų´ŲÆ",
    );

    if (picked != null) {
      Jalali jalali = Jalali(
        picked.year,
        picked.month,
        picked.day,
      );
      Gregorian gregorian = Gregorian.fromJalali(jalali);
    }
  }

  Future<void> callApiToGetUserProfile(
      {required BuildContext context, required WidgetRef ref}) async {
    _isLoading = true;
    notifyListeners();

    final response =
        await ref.read(apiClientProvider).getUserProfile(context: context);

    if (response.isSuccess) {
      _userProfileModel = response.data!;
      _setData();
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

    _isSuccess = response.isSuccess;
    _isLoading = false;
    notifyListeners();
  }

  bool get isSuccess => _isSuccess;
}

var profileViewModelProvider =
    ChangeNotifierProvider.autoDispose<ProfileViewModel>(
        (ref) => ProfileViewModel());

final profileWrapperPageCount = StateProvider.autoDispose<int>((ref) => 0);
