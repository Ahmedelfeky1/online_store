import 'package:flutter/material.dart';
import 'package:online_shop/core/app_images.dart';
import 'package:online_shop/core/app_styles.dart';
import 'package:online_shop/presentation/widgets/custom_elvat_bt.dart';

class OnBordingScreen extends StatelessWidget {
  const OnBordingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.backGroundBoarding),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(height: 100),
            Image.asset(AppImages.logoWhite),
            SizedBox(height: 30),
            Text(
              "Welcome\n to our store",
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Text(
              "Ger your groceries in as fast as one hour",
              style: AppStyles.style14,
            ),
            SizedBox(height: 60),
            CustomElvatBt(text: "Get Started", onPressed: () {}, width: 300),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
