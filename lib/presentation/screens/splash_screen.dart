import 'package:flutter/material.dart';
import 'package:online_shop/core/app_colors.dart';
import 'package:online_shop/core/app_images.dart';
import 'package:online_shop/presentation/screens/home_screen.dart';
import 'package:online_shop/presentation/screens/login_screen.dart';
import 'package:online_shop/presentation/screens/on_bording_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  Future<void> startTimer() async {
    await Future.delayed(Duration(seconds: 3));
    if (!mounted) return;

    final prefs = await SharedPreferences.getInstance();
    final bool isOnboardingSeen = prefs.getBool("onboarding") ?? false;
    if (!isOnboardingSeen) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => OnBordingScreen()),
      );
    } else {
      final users = Supabase.instance.client.auth.currentUser;
      if (users != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
      }
    }
  }

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
