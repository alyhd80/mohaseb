import 'package:boxicons/boxicons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mohaseb/screen/component/custom_textfield.dart';
import 'package:mohaseb/screen/profile/view_model/profile_view_model.dart';
import 'package:mohaseb/utils/app_constant/colors.dart';

class ProfileNumberWidget extends ConsumerWidget {
  final Size size;

  const ProfileNumberWidget({super.key, required this.size});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var viewModel = ref.watch(profileViewModelProvider);
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 500),
      child: Container(
        key: Key(viewModel.isSuccess ? "true" : "off"),
        decoration: BoxDecoration(
            color: viewModel.isLoading
                ? blueDevider
                : viewModel.isSuccess
                    ? Colors.white
                    : redColor2,
            borderRadius: BorderRadius.circular(14),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ]),
        padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.06 > 20 ? 20 : size.width * 0.06,
            vertical: size.height * 0.015 > 12 ? 12 : size.height * 0.015),
        child: Row(
          children: [
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "استان",
                  style: Theme.of(context).textTheme.headline2!.copyWith(
                      color: viewModel.isSuccess
                          ? textColorGrey1
                          : Colors.transparent,
                      fontSize:
                          size.width * 0.035 > 13 ? 13 : size.width * 0.035),
                ),
                SizedBox(height: 3),
                AnimatedSwitcher(
                  duration: Duration(milliseconds: 500),
                  switchInCurve: Curves.ease,
                  switchOutCurve: Curves.ease,
                  child: Container(
                    key: Key(viewModel.isEditable ? "on" : "off"),
                    decoration: BoxDecoration(
                        color: viewModel.isEditable
                            ? scaffoldColor
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                            color: viewModel.isEditable
                                ? borderColor2
                                : Colors.transparent)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (viewModel.isEditable) ...[
                          Container(
                            padding: EdgeInsets.only(left: 8),
                            child: Icon(
                              Boxicons.bx_chevron_down,
                              color: viewModel.isSuccess
                                  ? iconsLight
                                  : Colors.transparent,
                              size: 16,
                            ),
                          ),
                        ] else ...[
                          Container()
                        ],
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            SizedBox(
                              height: 3,
                            ),
                            Text(
                              "${viewModel.userProfileModel.data?.location?.stateId?.name ?? ""}" +
                                  " , " +
                                  "${viewModel.userProfileModel.data?.location?.city?.name ?? ""}",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline2!
                                  .copyWith(
                                      color: viewModel.isSuccess
                                          ? textColorGrey2
                                          : Colors.transparent,
                                      fontSize: size.width * 0.045 > 14
                                          ? 14
                                          : size.width * 0.045),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
              ],
            )),
            SizedBox(
              width: 5,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "تلفن",
                  style: Theme.of(context).textTheme.headline2!.copyWith(
                      color: viewModel.isSuccess
                          ? textColorGrey1
                          : Colors.transparent,
                      fontSize:
                          size.width * 0.035 > 13 ? 13 : size.width * 0.035),
                ),
                SizedBox(height: 3),
                Container(
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.transparent)),
                    child: Row(
                      children: [
                        Expanded(child: Container()),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            SizedBox(
                              height: 3,
                            ),
                            Text(
                              viewModel.userProfileModel.data?.phone ?? "",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline2!
                                  .copyWith(
                                      color: viewModel.isSuccess
                                          ? textColorGrey2
                                          : Colors.transparent,
                                      fontSize: size.width * 0.045 > 14
                                          ? 14
                                          : size.width * 0.045),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 3,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
