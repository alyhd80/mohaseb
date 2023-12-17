


import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mohaseb/application/data_provider.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';



class ProfileViewModel extends ChangeNotifier {
  bool _isLoading=false;
  bool _isSuccess=false;


  bool get isLoading => _isLoading;
  bool _isEditable= false;
  bool get isEditable => _isEditable;
  TextEditingController firstNameTextEditingController=TextEditingController(text: "امیر");
  TextEditingController lastNameTextEditingController=TextEditingController(text: "امیر");
  TextEditingController bioTextEditingController=TextEditingController(text: "امیر");
  TextEditingController emailEditingController=TextEditingController(text: "booleannemati@gmail.com");
  TextEditingController numberEditingController=TextEditingController(text: "09116163941");
  String birthData="1402.05.10";
  String province="گیلان";
  String city="رشت";


  set isEditable(bool value) {
    _isEditable = value;
    notifyListeners();
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


  Future<void> callApiToGetUserProfile({required BuildContext context,required WidgetRef ref}) async {
_isLoading=true;
notifyListeners();



// final response = await ref
//     .read(apiClientProvider).getUserProfile(context: context);



_isLoading=false;
notifyListeners();

  }

  bool get isSuccess => _isSuccess;
}

var profileViewModelProvider = ChangeNotifierProvider.autoDispose<ProfileViewModel>(
        (ref) => ProfileViewModel());


final profileWrapperPageCount =
StateProvider.autoDispose<int>((ref) => 0);