import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final bool isNonPasswordField;
  final bool obscureText;
  final Icon prefIcon;
  final String labelText;
  final TextEditingController controller;
  final VoidCallback? toggleObscureText;
  final TextInputAction textInputAction;

  const CustomInputField({
    super.key,
    required this.controller,
    required this.toggleObscureText,
    required this.prefIcon,
    required this.labelText,
    required this.textInputAction,
    this.obscureText = false,
    this.isNonPasswordField = true,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
        ),
        label: Text(labelText),
        prefixIcon: prefIcon,
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
    );
  }
}