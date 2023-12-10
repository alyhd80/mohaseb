import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mohaseb/screen/profile/component/selected_wrapper_page_widget.dart';
import 'package:mohaseb/screen/profile/view_model/profile_view_model.dart';

class ProfileWrapperWidget extends StatelessWidget {
  final Size size;

  const ProfileWrapperWidget({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
          borderRadius: BorderRadius.circular(16)
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 5,
        vertical: 5
      ),
      child: Consumer(builder: (context, ref, widget) {
        int pageSelected = ref.watch(profileWrapperPageCount);
        return Row(

          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SelectedWrapperPageWidget(
              size: size,
              title: "  درباره  ",
              isSelected: pageSelected == 2,
              onTap: () {
                ref.read(profileWrapperPageCount.notifier).state = 2;
              },
            ),
            SelectedWrapperPageWidget(
              size: size,
              title: "  گزارش  ",
              isSelected: pageSelected == 1,      onTap: () {
              ref.read(profileWrapperPageCount.notifier).state = 1;
            },
            ),
            SelectedWrapperPageWidget(
              size: size,
              title: "فعالیت ها",
              isSelected: pageSelected == 0,      onTap: () {
              ref.read(profileWrapperPageCount.notifier).state = 0;
            },
            ),
          ],
        );
      }),
    );
  }
}
