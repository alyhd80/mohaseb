import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mohaseb/application/data_provider.dart';
import 'package:mohaseb/data/local/app_perfrence.dart';
import 'package:mohaseb/route/AppRouter.gr.dart';
import 'package:mohaseb/service/show_toast.dart';
import 'package:mohaseb/utils/app_constant/strings.dart';
import 'package:auto_route/auto_route.dart';

class SettingViewModel extends ChangeNotifier {
  bool _isLoadingLogOut = false;

  bool get isLoadingLogOut => _isLoadingLogOut;

  Future<void> callApiToLogOut(
    BuildContext context,
    WidgetRef ref,
  ) async {
    _isLoadingLogOut = true;
    notifyListeners();

    final response = await ref.read(apiClientProvider).logOut(
          context: context,
        );
    if (response.isSuccess) {
showToast(context: context, title: "موفق", detail: "خروج با موفقیت انجام شد", isSuccess: true);
      final pref = ref.watch(appPreferenceHelperProvider);
      await pref.userClear();
      context.router.pushAndPopUntil(Login(), predicate: (t) {
        return false;
      });
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

    _isLoadingLogOut = false;
    notifyListeners();
  }
}

var settingViewModelProvider =
    ChangeNotifierProvider.autoDispose<SettingViewModel>(
        (ref) => SettingViewModel());
