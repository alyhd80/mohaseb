import 'package:flutter/material.dart';
import 'package:mohaseb/screen/profile/component/profile_top_widget.dart';
import 'package:mohaseb/screen/profile/component/profile_wrapper_widget.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: size.width*0.05>15?15:size.width*0.05),
        child: Column(
          children: [
            SafeArea(child: Container()),
            SizedBox(height: size.height*0.02>10?10:size.height*0.02<5?5:size.width*0.02,),
            ProfileTopWidget(
              size: size,
            ),
            SizedBox(height: size.height*0.06>30?30:size.height*0.06<20?20:size.width*0.06,),

            ProfileWrapperWidget(size: size)
          ],
        ),
      ),
    );
  }
}
