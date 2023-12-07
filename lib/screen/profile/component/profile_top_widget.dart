import 'package:flutter/material.dart';

class ProfileTopWidget extends StatelessWidget {
  final Size size;

  const ProfileTopWidget({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.06 > 20 ? 20 : size.width * 0.06,
          vertical: size.height * 0.01 > 10 ? 10 : size.height * 0.01),
      width: size.width,
      height: size.height * 0.35 > 350 ? 350 : size.height * 0.35,
      decoration: BoxDecoration(
          color: Colors.red, borderRadius: BorderRadius.circular(20)),
      child: Row(
        children: [
          Expanded(
              child: Column(
            children: [
              Expanded(child: Container()),
              Container(
                height: size.height * 0.04 > 40 ? 40 : size.height * 0.04,
                decoration: BoxDecoration(),
                child: Row(
                  children: [
                    Expanded(
                        child: Container(
                      color: Colors.white,
                    )),
                    Expanded(child: Container()),
                  ],
                ),
              )
            ],
          )),
          Expanded(child: Container()),
        ],
      ),
    );
  }
}
