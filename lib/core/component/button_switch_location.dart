import 'package:flutter/material.dart';

class LocationInputSwitch extends StatefulWidget {
  final Function(bool) onSwitchChanged;

  const LocationInputSwitch({
    super.key,
    required this.onSwitchChanged,
  });

  @override
  State<LocationInputSwitch> createState() => _LocationInputSwitch();
}

class _LocationInputSwitch extends State<LocationInputSwitch> {
  final String fontPoppins = 'FontPoppins';

  bool _isLocationInputEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Aktifkan Input Lokasi:',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            fontFamily: fontPoppins
          ),
        ),
        Switch(
          value: _isLocationInputEnabled,
          onChanged: (value) {
            setState(() {
              _isLocationInputEnabled = value;
            });
            widget.onSwitchChanged(value);
          },
        ),
      ],
    );
  }
}