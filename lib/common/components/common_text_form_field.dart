import 'package:flutter/material.dart';

class CommonTextFormField extends StatelessWidget {
  const CommonTextFormField({super.key, this.text, this.hintText});
  final String? text;
  final String? hintText;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (text != null)
          Text(
            text!,
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        TextFormField(
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
            isDense: true,
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[600]!),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[600]!),
            ),
          ),
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
