import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mohaseb/screen/splash/view_model/splash_view_model.dart';

class SplashBody extends ConsumerStatefulWidget {
  const SplashBody({super.key});

  @override
  ConsumerState<SplashBody> createState() => _SplashBodyState();
}

class _SplashBodyState extends ConsumerState<SplashBody> {
  late SplashViewModel splashViewModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      splashViewModel.findNavigationPage(context, ref);
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    splashViewModel = ref.watch(splashViewModelProvider);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [Center(child: Text("splash test"))],
    );
  }
}
