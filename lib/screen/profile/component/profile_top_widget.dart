import 'package:boxicons/boxicons.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:mohaseb/route/AppRouter.gr.dart';
import 'package:mohaseb/screen/component/custom_textfield.dart';
import 'package:mohaseb/screen/profile/view_model/profile_view_model.dart';
import 'package:mohaseb/utils/app_constant/colors.dart';
import 'package:auto_route/auto_route.dart';

class ProfileTopWidget extends ConsumerWidget {
  final Size size;

  const ProfileTopWidget({super.key, required this.size});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var viewModel = ref.watch(profileViewModelProvider);

    return AnimatedSwitcher(
      duration: Duration(milliseconds: 500),
      switchInCurve: Curves.ease,
      switchOutCurve: Curves.ease,
      child: Container(
        key: Key(viewModel.isSuccess ? "true" : "off"),
        padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.06 > 20 ? 20 : size.width * 0.06,
            vertical: size.height * 0.015 > 12 ? 12 : size.height * 0.015),
        width: size.width,
        height: (size.height * 0.35 > 350
                ? 350
                : size.height * 0.35 < 280
                    ? 280
                    : size.height * 0.35) *
            1.1,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: viewModel.isLoading
                ? blueDevider
                : viewModel.isSuccess
                    ? Colors.white
                    : redColor2,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ]),
        child: viewModel.isLoading
            ? Container()
            : viewModel.isSuccess
                ? Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              viewModel.isEditable = !viewModel.isEditable;
                            },
                            child: AnimatedSwitcher(
                              duration: Duration(milliseconds: 500),
                              switchOutCurve: Curves.ease,
                              switchInCurve: Curves.ease,
                              child: Container(
                                key: Key(viewModel.isEditable ? "on" : "off"),
                                decoration:
                                    BoxDecoration(color: Colors.transparent),
                                child: Icon(
                                  viewModel.isEditable
                                      ? Boxicons.bxs_message_square_check
                                      : Boxicons.bxs_edit_alt,
                                  color: viewModel.isEditable
                                      ? darkBlue4
                                      : textColorGrey1,
                                  size: 25,
                                  weight: 25,
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              context.router.push(Setting());
                            },
                            child: Container(
                              color: Colors.transparent,
                              child: Icon(
                                Boxicons.bx_cog,
                                color: textColorGrey1,
                                size: 25,
                                weight: 25,
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 1,
                        width: size.width,
                        color: dividerColor1,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Container(
                              width: size.width * 0.4 > 250
                                  ? 250
                                  : size.width * 0.4,
                              child: Stack(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(16)),
                                    alignment: Alignment.center,
                                    child: CachedNetworkImage(
                                      imageUrl: viewModel
                                              .userProfileModel.data!.avatar ??
                                          "",
                                      imageBuilder: (context, imageProvider) =>
                                          Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(16),
                                            image: DecorationImage(
                                                image: imageProvider,
                                                fit: BoxFit.cover)),
                                      ),
                                      placeholder: (context, url) =>
                                          const CircularProgressIndicator(),
                                      errorWidget: (context, url, error) =>
                                          Container(
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                        child: Icon(Icons.person),
                                      ),
                                    ),
                                  ),
                                  AnimatedSwitcher(
                                    duration: Duration(milliseconds: 500),
                                    switchOutCurve: Curves.ease,
                                    switchInCurve: Curves.ease,
                                    child: viewModel.isEditable
                                        ? GestureDetector(
                                            onTap: () async {
                                              FilePickerResult? result =
                                                  await FilePicker.platform
                                                      .pickFiles(
                                                          allowMultiple: false,
                                                          type: FileType.image);

                                              if (result != null) {
                                                CroppedFile? croppedFile =
                                                    await ImageCropper()
                                                        .cropImage(
                                                            aspectRatio:
                                                                CropAspectRatio(
                                                                    ratioX: 4,
                                                                    ratioY: 5),
                                                            compressQuality:
                                                                100,
                                                            sourcePath: result
                                                                .files
                                                                .single
                                                                .path!,
                                                            uiSettings: [
                                                              AndroidUiSettings(
                                                                toolbarTitle:
                                                                    'برش دهنده',
                                                                toolbarColor:
                                                                    primaryColor,
                                                                toolbarWidgetColor:
                                                                    Colors
                                                                        .white,
                                                                initAspectRatio:
                                                                    CropAspectRatioPreset
                                                                        .ratio5x4,
                                                                lockAspectRatio:
                                                                    false,
                                                                // hideBottomControls: true,
                                                              )
                                                            ],
                                                            cropStyle: CropStyle
                                                                .rectangle);

                                                if (croppedFile != null) {}
                                              }
                                            },
                                            child: Container(
                                              key: Key(viewModel.isEditable
                                                  ? "on"
                                                  : "off"),
                                              decoration: BoxDecoration(
                                                  color: Colors.black
                                                      .withOpacity(0.4),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16)),
                                              child: Center(
                                                child: Icon(
                                                  Boxicons.bxs_camera_plus,
                                                  size: 20,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          )
                                        : Container(),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Expanded(
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      "نام",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline2!
                                          .copyWith(
                                              color: textColorGrey1,
                                              fontSize: size.width * 0.035 > 13
                                                  ? 13
                                                  : size.width * 0.035),
                                    ),
                                    SizedBox(height: 3),
                                    AnimatedSwitcher(
                                      duration: Duration(milliseconds: 500),
                                      child: Container(
                                        key: Key(viewModel.isEditable
                                            ? "on"
                                            : "off"),
                                        child: viewModel.isEditable
                                            ? Container(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 2),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    border: Border.all(
                                                        color: borderColor2)),
                                                child: CustomTextField(
                                                  hintTitle: "نام",
                                                  textEditingController: viewModel
                                                      .firstNameTextEditingController,
                                                  fontSize: 18,
                                                  hintColor: textColorGrey2,
                                                  textInputType:
                                                      TextInputType.text,
                                                ))
                                            : Row(
                                                children: [
                                                  Expanded(child: Container()),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      SizedBox(
                                                        height: 3,
                                                      ),
                                                      Text(
                                                        viewModel.userProfileModel.data!.firstName??"",
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .headline2!
                                                            .copyWith(
                                                                color:
                                                                    textColorGrey2,
                                                                fontSize: size.width *
                                                                            0.055 >
                                                                        18
                                                                    ? 18
                                                                    : size.width *
                                                                        0.055),
                                                      ),
                                                      SizedBox(
                                                        height: 3,
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    width: 4,
                                                  ),
                                                ],
                                              ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                  ],
                                ),

                                ///
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      "نام خانوادگی",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline2!
                                          .copyWith(
                                              color: textColorGrey1,
                                              fontSize: size.width * 0.035 > 13
                                                  ? 13
                                                  : size.width * 0.035),
                                    ),
                                    SizedBox(height: 3),
                                    AnimatedSwitcher(
                                        duration: Duration(milliseconds: 500),
                                        child: Container(
                                          key: Key(viewModel.isEditable
                                              ? "on"
                                              : "off"),
                                          child: viewModel.isEditable
                                              ? Container(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 2),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      border: Border.all(
                                                          color: borderColor2)),
                                                  child: CustomTextField(
                                                    hintTitle: "نام",
                                                    fontSize: 18,
                                                    hintColor: textColorGrey2,
                                                    textInputType:
                                                        TextInputType.text,
                                                    textEditingController: viewModel
                                                        .lastNameTextEditingController,
                                                  ))
                                              : Row(
                                                  children: [
                                                    Expanded(
                                                        child: Container()),
                                                    Column(
                                                      children: [
                                                        SizedBox(
                                                          height: 3,
                                                        ),
                                                        Text(
                                                          viewModel.userProfileModel.data!.lastName??"",
                                                          style: Theme.of(
                                                                  context)
                                                              .textTheme
                                                              .headline2!
                                                              .copyWith(
                                                                  color:
                                                                      textColorGrey2,
                                                                  fontSize: size.width *
                                                                              0.055 >
                                                                          18
                                                                      ? 18
                                                                      : size.width *
                                                                          0.055),
                                                        ),
                                                        SizedBox(
                                                          height: 3,
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      width: 4,
                                                    ),
                                                  ],
                                                ),
                                        )),
                                    SizedBox(
                                      height: 5,
                                    ),
                                  ],
                                ),

                                ///
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      "تولد",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline2!
                                          .copyWith(
                                              color: textColorGrey1,
                                              fontSize: size.width * 0.035 > 13
                                                  ? 13
                                                  : size.width * 0.035),
                                    ),
                                    SizedBox(height: 3),
                                    AnimatedSwitcher(
                                      duration: Duration(milliseconds: 500),
                                      switchInCurve: Curves.ease,
                                      switchOutCurve: Curves.ease,
                                      child: GestureDetector(
                                        onTap: () {
                                          if (viewModel.isEditable) {
                                            viewModel.selectDateTime(
                                                context: context);
                                          }
                                        },
                                        child: Container(
                                          key: Key(viewModel.isEditable
                                              ? "on"
                                              : "off"),
                                          decoration: BoxDecoration(
                                              color: viewModel.isEditable
                                                  ? scaffoldColor
                                                  : Colors.transparent,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              border: Border.all(
                                                  color: viewModel.isEditable
                                                      ? borderColor2
                                                      : Colors.transparent)),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              if (viewModel.isEditable) ...[
                                                Container(
                                                  padding:
                                                      EdgeInsets.only(left: 8),
                                                  child: Icon(
                                                    Boxicons.bx_calendar_alt,
                                                    color: iconsLight,
                                                    size: 15,
                                                  ),
                                                ),
                                              ] else ...[
                                                Container()
                                              ],
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  SizedBox(
                                                    height: 3,
                                                  ),
                                                  Text(
                                                    viewModel.birthData,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .headline2!
                                                        .copyWith(
                                                            color:
                                                                textColorGrey2,
                                                            fontSize: size.width *
                                                                        0.055 >
                                                                    18
                                                                ? 18
                                                                : size.width *
                                                                    0.055),
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
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                  ],
                                )
                              ],
                            )),
                          ],
                        ),
                      ),
                    ],
                  )
                : Container(),
      ),
    );
  }
}
