import 'package:flutter/material.dart';
import 'package:paka/app/models/onboard.dart';
import 'package:paka/app/pages/authentication/sign_up.dart';
import 'package:paka/core/navigation/navigation.dart';
import 'package:paka/core/widgets/button.dart';

import '../../../core/system/status_bar.dart';

class Onboard extends StatefulWidget {
  const Onboard({Key? key}) : super(key: key);

  @override
  State<Onboard> createState() => _OnboardState();
}

class _OnboardState extends State<Onboard> {
  int pageIndex = 0;

  late PageController? pageController;

  toogleButtonText() {
    if (pageIndex == 0 || pageIndex == 1) {
      return 'Next';
    } else {
      return 'Get Started';
    }
  }

  buttonOnPressed() {
    if (pageIndex == 0 || pageIndex == 1) {
      setState(() {
        pageController?.nextPage(
          duration: const Duration(milliseconds: 500),
          curve: Curves.ease,
        );
      });
    } else {
      pushTo(context, const SignUp());
    }
  }

  @override
  void initState() {
    pageController = PageController(initialPage: pageIndex);
    super.initState();
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
            pageIndex != 2
                ? Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      onTap: () => pushTo(context, const SignUp()),
                      child: const Text(
                        'Skip',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  )
                : const SizedBox(height: 17),
            SizedBox(
              height: 400,
              child: PageView.builder(
                itemCount: onboardList.length,
                controller: pageController,
                onPageChanged: (index) {
                  setState(() {
                    pageIndex = index;
                  });
                },
                itemBuilder: (_, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 100),

                      // image widget goes here

                      Text(
                        onboardList[index].title!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 24,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            CustomButton(
              text: toogleButtonText(),
              onPressed: () => buttonOnPressed(),
            ),
            const SizedBox(height: 50),
            const Text(
              "Join 1k+ people today to save the world!",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13,
                color: Color(0xFF8D8D8D),
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
