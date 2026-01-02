import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shop/core/app_colors.dart';
import 'package:online_shop/core/app_images.dart';
import 'package:online_shop/core/app_styles.dart';
import 'package:online_shop/cubit/cubit/appauth_cubit.dart';
import 'package:online_shop/presentation/screens/home_screen.dart';
import 'package:online_shop/presentation/screens/login_screen.dart';
import 'package:online_shop/presentation/widgets/custom_elvat_bt.dart';
import 'package:online_shop/presentation/widgets/custom_row_data.dart';
import 'package:online_shop/presentation/widgets/custom_text_field.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppauthCubit, AppauthState>(
      listener: (context, state) {
        if (state is AppauthError) {
          Fluttertoast.showToast(
            msg: state.errorMessage,
            gravity: ToastGravity.CENTER,
            backgroundColor: AppColors.error,
          );
        }
        if (state is AppauthSuccess) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => HomeScreen()),
          );
        }
      },
      builder: (context, state) {
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
                        child: Image(
                          image: AssetImage("assets/images/logo.png"),
                        ),
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
                        controller: userNameController,
                        label: "Username",
                      ),
                      SizedBox(height: 20),
                      CustomTextField(
                        controller: emailController,
                        label: "Email",
                      ),
                      SizedBox(height: 20),
                      CustomTextField(
                        controller: passwordController,
                        label: "Password",
                        isPassword: true,
                      ),
                      SizedBox(height: 20),
                      SizedBox(height: 100),
                      state is AppauthLoading
                          ? Center(
                              child: CircularProgressIndicator(
                                color: AppColors.primaryColor,
                              ),
                            )
                          : CustomElvatBt(
                              text: "Sign up",
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  BlocProvider.of<AppauthCubit>(context).signUp(
                                    email: emailController.text.trim(),
                                    password: passwordController.text,
                                    userName: userNameController.text,
                                  );
                                }
                              },
                            ),
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
      },
    );
  }
}
