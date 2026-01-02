import 'package:flutter/material.dart';
import 'package:online_shop/core/app_images.dart';
import 'package:online_shop/core/app_styles.dart';
import 'package:online_shop/presentation/screens/login_screen.dart';
import 'package:online_shop/presentation/widgets/custom_elvat_bt.dart';
import 'package:online_shop/presentation/widgets/custom_row_data.dart';
import 'package:online_shop/presentation/widgets/custom_text_field.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.backGround),
            fit: BoxFit.cover,
          ),
        ),
        child: Form(
          key: formKey,

          child: Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 50),
                  Center(
                    child: Image(image: AssetImage("assets/images/logo.png")),
                  ),
                  SizedBox(height: 80),
                  Text("Sign up", style: AppStyles.style24bold),
                  SizedBox(height: 5),
                  Text(
                    "Enter your credentials to continue",
                    style: AppStyles.stylehint,
                  ),
                  SizedBox(height: 30),
                  CustomTextField(
                    controller: emailController,
                    label: Text("Email"),
                  ),
                  SizedBox(height: 20),
                  CustomTextField(
                    controller: passwordController,
                    label: Text("Password"),
                    isPassword: true,
                  ),
                  SizedBox(height: 20),
                  CustomTextField(
                    controller: confirmPasswordController,
                    label: Text("Confirm Password"),
                    isPassword: true,
                  ),
                  SizedBox(height: 100),
                  CustomElvatBt(text: "Sign up", onPressed: () {}),
                  SizedBox(height: 20),
                  CustomRowData(
                    text: "Already have an account ? ",
                    textButton: "Login",
                    screenName: LoginScreen(),
                  ),
                  SizedBox(height: 50),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
