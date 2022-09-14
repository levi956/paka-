import 'package:flutter/material.dart';
import 'package:paka/app/models/onboard.dart';
import 'package:paka/app/pages/authentication/sign_up.dart';
import 'package:paka/core/navigation/navigation.dart';
import 'package:paka/core/widgets/button.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    var screenSize = MediaQuery.of(context).size;
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
              height: screenSize.height * 0.57,
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
                      const SizedBox(height: 50),

                      Text(
                        onboardList[index].title!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 24,
                        ),
                      ),
                      const SizedBox(height: 40),
                      // image widget goes here
                      SizedBox(
                        height: screenSize.height * 0.3,
                        width: screenSize.width * 0.8,
                        child: Image.asset(
                          onboardList[index].imagePath!,
                          // fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                3,
                (index) => buildDot(index, context),
              ),
            ),
            const SizedBox(height: 40),
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

  // dot notifier widget
  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 9.2,
      width: 12.87,
      margin: const EdgeInsets.only(left: 2),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: pageIndex == index
            ? const Color(0xFFFE8343)
            : const Color(0xFFD2D0D0),
      ),
    );
  }
}
