import 'package:flutter/material.dart';

class DropdownInput extends StatefulWidget {
  final String label;
  final List<String> items;
  final String? initialValue;
  final ValueChanged<String?> onChanged;

  const DropdownInput({
    super.key,
    required this.label,
    required this.items,
    this.initialValue,
    required this.onChanged,
  });

  @override
  State<DropdownInput> createState() => _DropdownInputState();
}

class _DropdownInputState extends State<DropdownInput> {
  final String fontPoppins = 'FontPoppins';

  String? _selectedValue;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              fontFamily: fontPoppins
          ),
        ),
        const SizedBox(height: 12),
        DropdownButtonFormField<String>(
          value: _selectedValue,
          items: widget.items.map((item) {
            return DropdownMenuItem(
              value: item,
              child: Text(
                item,
                style: TextStyle(
                  fontFamily: fontPoppins
                ),
              ),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              _selectedValue = value;
            });
          },
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
          ),
        ),
      ],
    );
  }
}