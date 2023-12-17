import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mohaseb/screen/profile/component/bio_profile_widget.dart';
import 'package:mohaseb/screen/profile/component/email_profile_widget.dart';
import 'package:mohaseb/screen/profile/component/profile_number_widget.dart';
import 'package:mohaseb/screen/profile/component/profile_top_widget.dart';
import 'package:mohaseb/screen/profile/component/profile_wrapper_widget.dart';
import 'package:mohaseb/screen/profile/view_model/profile_view_model.dart';

class ProfileBody extends ConsumerStatefulWidget {
  const ProfileBody({super.key});

  @override
  ConsumerState<ProfileBody> createState() => _ProfileBodyState();
}

class _ProfileBodyState extends ConsumerState<ProfileBody> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: size.width*0.05>15?15:size.width*0.05),
        child: Column(
          children: [
            SizedBox(height: size.height*0.02>10?10:size.height*0.02<5?5:size.width*0.02,),
            ProfileWrapperWidget(size: size),
            SizedBox(height: size.height*0.06>30?30:size.height*0.06<20?20:size.width*0.06,),
            ProfileTopWidget(size: size,),
            SizedBox(height: size.height*0.03>15?15:size.height*0.03<10?10:size.width*0.03,),
            ProfileNumberWidget(size: size),
            // SizedBox(height: size.height*0.03>15?15:size.height*0.03<10?10:size.width*0.03,),
            // BioProfileWidget(size: size),
            SizedBox(height: size.height*0.03>15?15:size.height*0.03<10?10:size.width*0.03,),
            EmailProfileWidget(size: size),
            SizedBox(height: (size.height * 0.07 > 65 ? 65 : size.height * 0.07<45?45:size.height * 0.07)*1.5,)
          ],
        ),
      ),
    );
  }
}
