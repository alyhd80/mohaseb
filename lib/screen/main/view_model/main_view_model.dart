
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainViewModel extends ChangeNotifier {
  PageController _pageController=PageController();
  PageController get pageController => _pageController;
int _pageSelected=0;

  int get pageSelected => _pageSelected;

  set pageSelected(int value) {
    if(value==_pageSelected)return;
    print(value);
    _pageSelected = value;
    _pageController.animateToPage(value, duration: Duration(milliseconds: 500), curve: Curves.ease);
    notifyListeners();
  }
}
var mainViewModelProvider =
ChangeNotifierProvider.autoDispose<MainViewModel>(
        (ref) => MainViewModel());