import 'package:flutter/material.dart';
import 'package:paka/app/pages/authentication/sign_up.dart';
import 'package:paka/core/system/status_bar.dart';

import '../../../core/navigation/navigation.dart';
import '../../../core/style/theme.dart';
import '../../../core/widgets/button.dart';
import '../../../core/widgets/textfield.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool isVisible = true;
  String email = '';
  String password = '';

  List<TextSpan> textSpans = [
    const TextSpan(text: 'Fill in the details below to log into\nyour'),
    TextSpan(
      text: ' paka',
      style: TextStyle(
        color: PakaTheme.primaryGreen,
        fontWeight: FontWeight.w700,
      ),
    ),
    const TextSpan(text: ' account'),
  ];

  tooglePassword() {
    setState(() {
      isVisible = !isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    setStatusBarColor(color: BarColor.black);
    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 20),
        child: ListView(
          children: [
            Column(
              children: [
                Text(
                  "Welcome Back Tayo!",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: PakaTheme.primaryBlack,
                  ),
                ),
                const SizedBox(height: 10),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: TextStyle(
                      color: PakaTheme.primaryBlack,
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    ),
                    children: textSpans,
                  ),
                ),
                const SizedBox(height: 50),
                CustomTextField(
                  label: 'Email Address',
                  hintText: 'john@example.com',
                  keyboardType: TextInputType.emailAddress,
                  isHidden: false,
                  onChanged: (v) {
                    setState(() {
                      email = v.trim();
                    });
                  },
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  label: 'Password',
                  hintText: 'Your password',
                  keyboardType: TextInputType.visiblePassword,
                  isHidden: isVisible,
                  onChanged: (v) {
                    setState(() {
                      password = v.trim();
                    });
                  },
                ),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () => tooglePassword(),
                    child: Text(
                      'Show Password',
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w300,
                          color: PakaTheme.primaryBlack),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 60),
            CustomButton(
              text: 'Log in',
              buttonWidth: double.maxFinite,
              onPressed: () {},
            ),
            const SizedBox(height: 40),
            Center(
              child: GestureDetector(
                onTap: () => pushReplacementTo(context, const SignUp()),
                child: const Text(
                  "Dont't have an account? Sign up",
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
