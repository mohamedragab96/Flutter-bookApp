import 'package:book_app/core/utils/app_router.dart';
import 'package:book_app/core/utils/assets_data.dart';
import 'package:book_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  late AnimationController animationController;
  var dimension = 1.0;
  late int value;

  @override
  void initState() {
    super.initState();
    navigateToHome(context);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(AssetsData.logo, height: 200, width: 200),
        const Text(
          'Read Free Books Now',
          textAlign: TextAlign.center,
          style: Styles.body16,
        ),
        const SizedBox(height: 20),
        TweenAnimationBuilder(
            tween: IntTween(begin: 0, end: 100),
            duration: const Duration(seconds: 2),
            builder: (context, value, child) {
              return Text(
                'Loading $value%',
                style: Styles.body16,
                textAlign: TextAlign.center,
              );
            }),
      ],
    );
  }
}

void navigateToHome(BuildContext context) {
  Future.delayed(const Duration(seconds: 4), () {
    GoRouter.of(context).pushReplacement(AppRouter.kHomeView);
  });
}
