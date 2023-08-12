import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:note_app/controller/core/constant.dart';
import 'package:note_app/controller/provider/splash_provider.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Provider.of<SplashProvider>(context, listen: false)
          .navigateToHome(context: context);
    });
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LottieBuilder.asset("assets/animation.json"),
            Text(
              "N O T E A P P",
              style: CustomFuction.texttStyle(
                  weight: FontWeight.w600, color: CustomClr.kblack, size: 14),
            )
          ],
        ),
      ),
    );
  }
}
