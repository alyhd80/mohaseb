import 'package:flutter/material.dart';
import 'package:mohaseb/screen/profile/component/profile_body.dart';


class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: ProfileBody(),
    );
  }
}
