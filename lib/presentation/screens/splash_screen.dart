import 'package:flutter/material.dart';
import 'package:online_shop/core/app_colors.dart';
import 'package:online_shop/core/app_images.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: AppColors.primaryColor,
        child: Center(child: Image(image: AssetImage(AppImages.logoSplash))),
      ),
    );
  }
}
