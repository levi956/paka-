import 'package:flutter/material.dart';
import 'package:paka/app/pages/request_pickup/request_pickup.dart';
import 'package:paka/core/navigation/navigation.dart';
import 'package:paka/core/widgets/pick_up_botton.dart';

import '../../../core/style/theme.dart';
import '../../../core/widgets/pick_up_card.dart';

class PickUpPage extends StatefulWidget {
  const PickUpPage({Key? key}) : super(key: key);

  @override
  State<PickUpPage> createState() => _PickUpPageState();
}

class _PickUpPageState extends State<PickUpPage> with TickerProviderStateMixin {
  int currentIndex = 0;
  late TabController _tabController;

  _listenToTabController() {
    _tabController.addListener(() {
      setState(() {
        currentIndex = _tabController.index;
      });
    });
  }

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    _listenToTabController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 10),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Pick-up',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            color: PakaTheme.primaryBlack,
                          ),
                        ),
                        Text(
                          'See all instant and scheduled pickup',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: PakaTheme.greyScale,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    PickUpButton(
                      onTap: () => pushTo(context, const RequestPickUpPage()),
                    ),
                  ],
                ),
                const SizedBox(height: 2),
              ],
            ),
            const SizedBox(height: 20),
            Center(
              child: TabBar(
                padding: EdgeInsets.zero,
                overlayColor: MaterialStateProperty.all(Colors.transparent),
                isScrollable: true,
                controller: _tabController,
                labelColor: PakaTheme.primaryBlack,
                indicatorColor: PakaTheme.primaryGreen,
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorWeight: 1.1,
                labelStyle: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: PakaTheme.primaryBlack,
                  fontSize: 13,
                ),
                unselectedLabelStyle: TextStyle(
                  fontWeight: FontWeight.w300,
                  color: PakaTheme.primaryBlack,
                  fontSize: 12,
                ),
                tabs: const [
                  Tab(
                    text: 'Instant pick-up',
                  ),
                  Tab(
                    child: Text('Scheduled pick-up'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.70,
              child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                controller: _tabController,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.69,
                    child: ListView.separated(
                      itemCount: 9,
                      itemBuilder: (_, context) {
                        return const PickUpCard();
                      },
                      separatorBuilder: (_, context) {
                        return const Divider();
                      },
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.69,
                    child: ListView.separated(
                      itemCount: 9,
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
            ),
          ],
        ),
      ),
    );
  }
}
