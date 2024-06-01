import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final fontPoppins = 'FontPoppins';

  final bool isNonPasswordField;
  final bool obscureText;
  final Icon? prefIcon;
  final String labelText;
  final String label;
  final TextEditingController controller;
  final VoidCallback? toggleObscureText;
  final TextInputAction textInputAction;

  const CustomInputField({
    super.key,
    required this.controller,
    required this.toggleObscureText,
    this.prefIcon,
    required this.labelText,
    required this.label,
    required this.textInputAction,
    this.obscureText = false,
    this.isNonPasswordField = true,
    TextInputType? keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            fontFamily: fontPoppins
          ),
        ),
        const SizedBox(height: 12.0),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4.0)),
            ),
            labelText: labelText,
            prefixIcon: prefIcon,
            floatingLabelBehavior: FloatingLabelBehavior.never,
            suffixIcon: IconButton(
              onPressed: toggleObscureText,
              icon: isNonPasswordField
                ? const Icon(null)
                : obscureText
                    ?  const Icon(Icons.visibility)
                    :  const Icon(Icons.visibility_off),
            ),
          ),
          textInputAction: textInputAction,
          obscureText: obscureText,
        ),
      ],
    );
  }
}