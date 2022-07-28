import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:paka/app/pages/onboard/onboard.dart';
import 'package:paka/core/navigation/navigation.dart';
import 'package:paka/core/style/theme.dart';
import 'package:paka/core/widgets/settings_tile.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

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
                Text(
                  'Tayo Adedokun',
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w600,
                    color: PakaTheme.primaryBlack,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  'tayo@gmail.com',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: PakaTheme.greyScale,
                  ),
                ),
                const SizedBox(height: 60),
                const SettingsTile(
                  label: 'Edit Profile',
                  tileIcon: LineAwesomeIcons.edit,
                ),
                const SettingsTile(
                  label: 'Help & Support',
                  tileIcon: LineAwesomeIcons.question,
                ),
                const SettingsTile(
                  label: 'Invite a friend',
                  tileIcon: LineAwesomeIcons.user_friends,
                ),
                const SettingsTile(
                    label: 'Terms and condition',
                    tileIcon: LineAwesomeIcons.exclamation_circle),
                GestureDetector(
                  onTap: () => pushToAndClearStack(context, const Onboard()),
                  child: const SettingsTile(
                    label: 'Sign out',
                    tileIcon: LineAwesomeIcons.door_open,
                    labelColor: Colors.red,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
