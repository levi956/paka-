import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:paka/app/pages/core/homepage.dart';
import 'package:paka/app/pages/core/pickup_page.dart';
import 'package:paka/app/pages/report_refuse/report_refuse.dart';
import 'package:paka/core/style/theme.dart';

import '../../../core/system/status_bar.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  // experiment of a tab provider here to manipulate the value
  int tabIndex = 0;
  final List<Widget> _screens = const [
    HomePage(),
    PickUpPage(),
    Text('Hello'),
    ReportRefusePage(),
    Text('Hello'),
  ];

  @override
  Widget build(BuildContext context) {
    setStatusBarColor(color: BarColor.black);
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        elevation: 5,
        backgroundColor: PakaTheme.lightGrey,
        currentIndex: tabIndex,
        onTap: (index) {
          setState(() {
            HapticFeedback.lightImpact();
            tabIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: PakaTheme.primaryGreen,
        unselectedItemColor: PakaTheme.hintTextColor,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedLabelStyle: const TextStyle(fontSize: 10),
        unselectedLabelStyle: const TextStyle(fontSize: 10),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(LineAwesomeIcons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(LineAwesomeIcons.trash),
            label: 'Pick-up',
          ),
          BottomNavigationBarItem(
              icon: Icon(LineAwesomeIcons.calendar), label: 'Calender'),
          BottomNavigationBarItem(
            icon: Icon(LineAwesomeIcons.comment_dots),
            label: 'Report',
          ),
          BottomNavigationBarItem(
            icon: Icon(LineAwesomeIcons.cog),
            label: 'Settings',
          ),
        ],
      ),
      body: IndexedStack(
        index: tabIndex,
        children: _screens,
      ),
    );
  }
}
