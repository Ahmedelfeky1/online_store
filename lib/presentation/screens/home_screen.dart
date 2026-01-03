import 'package:flutter/material.dart';
import 'package:online_shop/core/app_colors.dart';
import 'package:online_shop/core/app_images.dart';
import 'package:online_shop/core/app_styles.dart';
import 'package:online_shop/presentation/widgets/custom_text_field.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final TextEditingController searchcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final users = Supabase.instance.client.auth.currentUser!;
    final String userName = users.userMetadata?['userName'] ?? 'Guest';
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 60),
          Center(child: Image(image: AssetImage(AppImages.logo), width: 30)),
          SizedBox(height: 20),
          Text("Welcome, $userName!"),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: CustomTextField(
              controller: searchcontroller,
              hintText: "Search Store",
              hintStyle: AppStyles.style14,
              filled: true,
              fillColor: AppColors.border,
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
