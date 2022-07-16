import 'package:flutter/material.dart';
import 'package:paka/core/style/theme.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final Color? buttonTextColor;
  final double? buttonWidth;
  final bool Function()? validator;

  const CustomButton(
      {required this.text,
      required this.onPressed,
      this.buttonWidth,
      this.buttonTextColor,
      this.validator,
      Key? key})
      : super(key: key);

  final double borderRadius = 8;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: buttonWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        color: (validator == null ? true : validator!())
            ? PakaTheme.primaryGreen
            : PakaTheme.primaryGreen.withOpacity(0.7),
      ),
      child: ElevatedButton(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          alignment: Alignment.center,
          padding: MaterialStateProperty.all(
            const EdgeInsets.only(top: 15, bottom: 15),
          ),
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
        ),
        onPressed: (validator == null ? true : validator!()) ? onPressed : null,
        child: Text(
          text,
          style: TextStyle(
              color: buttonTextColor,
              fontSize: 14,
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
