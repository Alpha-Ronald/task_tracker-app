import 'package:flutter/material.dart';

class CustomCheckBox extends StatefulWidget {
  const CustomCheckBox(
      {super.key, required this.value, required this.onChanged});

  final bool value;
  final ValueChanged<bool>? onChanged;

  @override
  State<CustomCheckBox> createState() => CustomCheckBoxState();
}

class CustomCheckBoxState extends State<CustomCheckBox> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (widget.onChanged != null) {
          widget.onChanged!(!widget.value);
        }
      },
      child: Container(
        width: 22.0, // Set your preferred size
        height: 22.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: const Color(0xFF1D364D), // Set the border color
            width: 2.0, // Set the border width
          ),
        ),
        child: widget.value
            ? const Icon(
                Icons.circle,
                size: 14.0, // Set the check icon size
                color: Color(0xFF1D364D), // Set the check icon color
              )
            : Container(), // Empty container when not checked
      ),
    );
  }
}
