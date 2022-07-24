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
import 'package:paka/app/pages/authentication/sign_in.dart';
import 'package:paka/app/pages/core/dashboard.dart';
import 'package:paka/core/navigation/navigation.dart';
import 'package:paka/core/style/theme.dart';
import 'package:paka/core/system/status_bar.dart';
import 'package:paka/core/widgets/button.dart';
import 'package:paka/core/widgets/drop_down.dart';
import 'package:paka/core/widgets/textfield.dart';
import 'package:nigerian_states_and_lga/nigerian_states_and_lga.dart';

enum SignUpStage { one, two }

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  SignUpStage signUpStage = SignUpStage.one;
  bool isVisible = true;

// proably make this a provider later on
  List<String> genderOptions = ['Select your gender', 'Male', 'Female'];
  List<String> stateOptions = ['Select your state', 'Lagos', 'Abuja'];
  List<String> lgaOptions = ['Select your LGA', 'Kosofe', 'Yaba'];

  String firstName = '';
  String lastName = '';
  String email = '';
  String password = '';
  String address = '';
  String state = NigerianStatesAndLGA.allStates[0];
  String gender = 'Select your gender';
  String lga = 'Select your LGA';

  tooglePassword() {
    setState(() {
      isVisible = !isVisible;
    });
  }

  toogleButtonText() {
    if (signUpStage == SignUpStage.one) {
      return 'Continue';
    } else {
      return 'Verify account';
    }
  }

  backButtonOnPressed() {
    if (signUpStage == SignUpStage.one) {
      pop(context);
    } else {
      setState(() {
        signUpStage = SignUpStage.one;
      });
    }
  }

  mainButtonOnpressed() {
    if (signUpStage == SignUpStage.one) {
      setState(() {
        signUpStage = SignUpStage.two;
      });
    } else {
      // method that registers users goes here
      pushTo(context, const Dashboard());
    }
  }

  List<TextSpan> textSpans = [
    const TextSpan(text: 'Fill in the details below to create\nyour'),
    TextSpan(
      text: ' paka',
      style: TextStyle(
        color: PakaTheme.primaryGreen,
        fontWeight: FontWeight.w700,
      ),
    ),
    const TextSpan(text: ' account'),
  ];

  @override
  Widget build(BuildContext context) {
    setStatusBarColor(color: BarColor.black);
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              // sign up text with steps
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  padding: EdgeInsets.zero,
                  iconSize: 19,
                  color: PakaTheme.primaryGreen,
                  onPressed: () => backButtonOnPressed(),
                  icon: const Icon(Icons.arrow_back),
                ),
              ),
              Column(
                children: [
                  Text(
                    "Let's get your account setup",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: PakaTheme.primaryBlack),
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
                  const SizedBox(height: 15),
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
                  ],
                ),
              //
              if (signUpStage == SignUpStage.two)
                Column(
                  children: [
                    CustomDropDown(
                      label: 'Gender',
                      items: genderOptions
                          .map(
                              (e) => DropdownMenuItem(value: e, child: Text(e)))
                          .toList(),
                      onChanged: (v) {
                        setState(() {
                          gender = v!;
                        });
                      },
                      value: gender,
                    ),
                    const SizedBox(height: 20),
                    CustomTextField(
                      label: 'Address',
                      hintText: 'Enter your address',
                      keyboardType: TextInputType.streetAddress,
                      isHidden: false,
                      onChanged: (v) {
                        setState(() {
                          address = v;
                        });
                      },
                    ),
                    const SizedBox(height: 20),
                    CustomDropDown(
                      label: 'State',
                      items: NigerianStatesAndLGA.allStates
                          .map(
                              (e) => DropdownMenuItem(value: e, child: Text(e)))
                          .toList(),
                      onChanged: (v) {
                        setState(() {
                          state = v!;
                        });
                      },
                      value: state,
                    ),
                    const SizedBox(height: 20),
                    CustomDropDown(
                      label: 'LGA',
                      items: lgaOptions
                          .map(
                              (e) => DropdownMenuItem(value: e, child: Text(e)))
                          .toList(),
                      onChanged: (v) {
                        setState(() {
                          lga = v!;
                        });
                      },
                      value: lga,
                    ),
                  ],
                ),

              const SizedBox(height: 60),
              CustomButton(
                text: toogleButtonText(),
                buttonWidth: double.maxFinite,
                onPressed: () => mainButtonOnpressed(),
              ),
              const SizedBox(height: 40),
              Center(
                child: GestureDetector(
                  onTap: () => pushReplacementTo(context, const SignIn()),
                  child: const Text(
                    "Already registered? Log in",
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
      ),
    );
  }
}
