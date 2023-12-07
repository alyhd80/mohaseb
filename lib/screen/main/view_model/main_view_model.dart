
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainViewModel extends ChangeNotifier {
  PageController _pageController=PageController();
  PageController get pageController => _pageController;
int _pageSelected=0;

  int get pageSelected => _pageSelected;

  set pageSelected(int value) {
    if(value==_pageSelected)return;
    _pageSelected = value;
    _pageController.jumpToPage(value);
    notifyListeners();
  }
}
var mainViewModelProvider =
ChangeNotifierProvider.autoDispose<MainViewModel>(
        (ref) => MainViewModel());