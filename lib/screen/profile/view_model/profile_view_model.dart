


import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



class ProfileViewModel extends ChangeNotifier {
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





}

var profileViewModelProvider = ChangeNotifierProvider.autoDispose<ProfileViewModel>(
        (ref) => ProfileViewModel());


final profileWrapperPageCount =
StateProvider.autoDispose<int>((ref) => 0);