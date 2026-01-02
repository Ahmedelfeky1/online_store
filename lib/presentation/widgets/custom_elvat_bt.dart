import 'package:flutter/material.dart';
import 'package:online_shop/core/app_colors.dart';
import 'package:online_shop/core/app_styles.dart';

class CustomElvatBt extends StatelessWidget {
  const CustomElvatBt({
    super.key,
    required this.text,
    required this.onPressed,
    this.width = double.infinity,
  });

  final String text;
  final Function() onPressed;
  final double width;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(width, 50),
        backgroundColor: AppColors.primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: AppStyles.style24bold.copyWith(color: Colors.white),
      ),
    );
  }
}
