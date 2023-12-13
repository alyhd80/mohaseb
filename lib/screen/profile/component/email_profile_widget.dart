import 'package:boxicons/boxicons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mohaseb/screen/profile/view_model/profile_view_model.dart';
import 'package:mohaseb/utils/app_constant/colors.dart';

class EmailProfileWidget extends ConsumerWidget {
  final Size size;

  const EmailProfileWidget({super.key, required this.size});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var viewModel = ref.watch(profileViewModelProvider);

    return Container(
      width: size.width,
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.1),
          spreadRadius: 5,
          blurRadius: 7,
          offset: const Offset(0, 3), // changes position of shadow
        ),
      ]),
      padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.06 > 20 ? 20 : size.width * 0.06,
          vertical: size.height * 0.015 > 12 ? 12 : size.height * 0.015),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            "ایمیل",
            style: Theme.of(context).textTheme.headline2!.copyWith(
                color: titleColor1,
                fontSize: size.width * 0.05 > 15 ? 15 : size.width * 0.05),
          ),
          SizedBox(
            height: size.height * 0.02 > 10
                ? 10
                : size.height * 0.02 < 5
                    ? 5
                    : size.width * 0.02,
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              "booleannemati@gmail.com",
              style: Theme.of(context).textTheme.headline2!.copyWith(
                  color: titleColor1,
                  fontSize: size.width * 0.05 > 15 ? 15 : size.width * 0.05),
            ),
          ),
          SizedBox(
            height: size.height * 0.02 > 10
                ? 10
                : size.height * 0.02 < 5
                    ? 5
                    : size.width * 0.02,
          ),
        ],
      ),
    );
  }
}
