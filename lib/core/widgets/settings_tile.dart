import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class SettingsTile extends StatelessWidget {
  final IconData tileIcon;
  final String label;
  final Color? labelColor;

  const SettingsTile(
      {Key? key, required this.label, this.labelColor, required this.tileIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                tileIcon,
                color: labelColor,
              ),
              const SizedBox(width: 5),
              Text(
                label,
                style: TextStyle(
                  color: labelColor,
                ),
              ),
              const Spacer(),
              const Icon(
                LineAwesomeIcons.angle_right,
                size: 18,
              ),
            ],
          ),
          const SizedBox(height: 6),
          const Divider(),
          const SizedBox(height: 6),
        ],
      ),
    );
  }
}
