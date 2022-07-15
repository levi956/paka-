// use an index of steps [1,2,3] to get track of sign up stages
// or an enum

// places to listen
// - back button
// - (step {stage} index number)
// - field of sign up as a widget
// - Step 1 sign up widget
// -- step 2 sign up widgets
// onPressed button changes the state from one to two

import 'package:flutter/material.dart';
import 'package:paka/core/style/theme.dart';
import 'package:paka/core/system/status_bar.dart';
import 'package:paka/core/widgets/button.dart';
import 'package:paka/core/widgets/textfield.dart';

enum SignUpStage { one, two }

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  SignUpStage signUpStage = SignUpStage.one;
  bool isVisible = true;

  int stage = 1;

  String firstName = '';
  String lastName = '';
  String email = '';
  String password = '';

  tooglePassword() {
    setState(() {
      isVisible = !isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    setStatusBarColor(color: BarColor.black);
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        body: Padding(
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 20),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              // sign up text with steps
              Column(
                children: [
                  Text(
                    'Sign Up',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: PakaTheme.primaryBlack),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Fill in the details below to create\nyour paka account.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        height: 1.5,
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: PakaTheme.primaryBlack),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    'STEP $stage OF 3',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: PakaTheme.primaryBlack),
                  ),
                ],
              ),

              const SizedBox(height: 50),
              // step one column

              if (signUpStage == SignUpStage.one)
                Column(
                  // text field and stuff here
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                            label: 'First Name',
                            hintText: 'John',
                            keyboardType: TextInputType.name,
                            isHidden: false,
                            onChanged: (v) {
                              setState(() {
                                firstName = v.trim();
                              });
                            },
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: CustomTextField(
                            label: 'Last Name',
                            hintText: 'Doe',
                            keyboardType: TextInputType.name,
                            isHidden: false,
                            onChanged: (v) {
                              setState(() {
                                lastName = v.trim();
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
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
                    const SizedBox(height: 20),
                    CustomTextField(
                      label: 'Phone number',
                      keyboardType: TextInputType.phone,
                      hintText: '123 456 789',
                      isHidden: false,
                      onChanged: (v) {
                        setState(() {
                          password = v.trim();
                        });
                      },
                    ),
                    const SizedBox(height: 60),
                    CustomButton(
                      text: 'Continue',
                      buttonWidth: double.maxFinite,
                      onPressed: () {},
                    ),
                    const SizedBox(height: 40),
                    GestureDetector(
                      onTap: () {},
                      child: const Text(
                        "Already registered? Log in",
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
