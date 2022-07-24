import 'package:flutter/material.dart';
import 'package:paka/core/style/theme.dart';
import 'package:paka/core/widgets/pick_up_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController _pageController;
  int _pageIndex = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: _pageIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 20),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Good Morning Tayo!',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: PakaTheme.primaryBlack,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  'How can we help you today?',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: PakaTheme.greyScale,
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 190,
                  child: PageView.builder(
                    pageSnapping: false,
                    itemCount: 3,
                    controller: _pageController,
                    onPageChanged: (index) {
                      setState(() {
                        _pageIndex = index;
                      });
                    },
                    itemBuilder: (_, index) {
                      return Container(
                        margin: const EdgeInsets.only(right: 10),
                        child: Image.asset(
                          'assets/images/banner1.png',
                          fit: BoxFit.contain,
                        ),
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
                Text(
                  'Upcoming Pick-ups',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: PakaTheme.primaryBlack,
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: size.height * 0.5,
                  child: ListView.separated(
                    itemCount: 5,
                    itemBuilder: (_, context) {
                      return const PickUpCard();
                    },
                    separatorBuilder: (_, context) {
                      return const Divider();
                    },
                  ),
                ),
              ],
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
        color: _pageIndex == index
            ? const Color(0xFFFE8343)
            : const Color(0xFFD2D0D0),
      ),
    );
  }
}
