import 'package:flutter/material.dart';
import 'package:online_shop/core/app_styles.dart';

// ignore: must_be_immutable
class CustomTextField extends StatefulWidget {
  CustomTextField({
    super.key,
    this.text,
    required this.controller,
    this.onChanged,
    this.suffixIcon,
    this.validator,
    this.isPassword = false,
    this.hintText = "",
    this.fillColor,
    this.filled,
    this.label,
    this.labelStyle,
  });

  final String? text;
  final TextEditingController? controller;
  void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final bool isPassword;
  final String hintText;
  final Widget? suffixIcon;
  final Color? fillColor;
  final bool? filled;
  final Text? label;
  final TextStyle? labelStyle;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.text != null && widget.text!.isNotEmpty) ...[
          Text(
            widget.text!,
            textAlign: TextAlign.left,
            style: AppStyles.style24bold,
          ),
          SizedBox(height: 5),
        ],
        TextFormField(
          obscureText: widget.isPassword ? !isVisible : false,
          controller: widget.controller,
          onChanged: widget.onChanged,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "${widget.label ??'Field'} is required";
            }
            return null;
          },
          decoration: InputDecoration(
            hintText: widget.hintText,
            suffixIcon: widget.isPassword
                ? IconButton(
                    icon: Icon(
                      isVisible ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      isVisible = !isVisible;
                      setState(() {});
                    },
                  )
                : widget.suffixIcon,
            filled: widget.filled,
            prefixIconColor: AppStyles.style16.color,
            label: widget.label,
            labelStyle: widget.labelStyle,
            fillColor: widget.fillColor,
            border: UnderlineInputBorder(
              borderSide: BorderSide(
                color: AppStyles.style14.color!.withValues(alpha: 0.2),
                width: 1,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
