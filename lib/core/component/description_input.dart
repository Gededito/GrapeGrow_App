import 'package:flutter/material.dart';

class DescriptionInput extends StatelessWidget {
  final String fontPoppins = 'FontPoppins';

  final String label;
  final TextEditingController controller;
  final int maxLines;

  const DescriptionInput({
    super.key,
    required this.label,
    required this.controller,
    this.maxLines = 5,
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
            fontFamily: fontPoppins,
          ),
        ),
        const SizedBox(height: 12),
        TextFormField(
          controller: controller,
          maxLines: maxLines,
          decoration: const InputDecoration(
            hintText: 'Silahkan Diisi',
            border: OutlineInputBorder(),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Wajib Diisi';
            }
            if (value.length < 10) {
              return 'Deskripsi minimal 10 karakter';
            }
            return null;
          },
        ),
      ],
    );
  }
}