import 'package:flutter/material.dart';
import 'package:paka/core/style/theme.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final TextInputType? keyboardType;

  final ValueChanged<String>? onChanged;
  final bool? isHidden;
  final String? hintText;

  const CustomTextField(
      {Key? key,
      required this.label,
      this.hintText,
      this.keyboardType,
      this.isHidden,
      this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.w300,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          padding:
              const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
          decoration: BoxDecoration(
            color: PakaTheme.lightGrey,
            borderRadius: BorderRadius.circular(3),
          ),
          child: TextField(
            autocorrect: false,
            obscureText: isHidden!,
            cursorColor: PakaTheme.primaryGreen,
            keyboardType: keyboardType,
            onChanged: onChanged,
            decoration: InputDecoration.collapsed(
              hintText: hintText,
              hintStyle: TextStyle(
                color: PakaTheme.hintTextColor,
                fontSize: 14,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
