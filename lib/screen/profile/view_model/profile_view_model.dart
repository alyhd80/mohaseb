


import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



class ProfileViewModel extends ChangeNotifier {
  bool _isEditable= false;
  bool get isEditable => _isEditable;

  set isEditable(bool value) {
    _isEditable = value;
    notifyListeners();
  }





}

var profileViewModelProvider = ChangeNotifierProvider.autoDispose<ProfileViewModel>(
        (ref) => ProfileViewModel());


final profileWrapperPageCount =
StateProvider.autoDispose<int>((ref) => 0);