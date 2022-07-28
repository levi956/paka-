import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:paka/core/style/theme.dart';

class PickUpButton extends StatelessWidget {
  final void Function()? onTap;
  const PickUpButton({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 36,
        padding: const EdgeInsets.all(5.5),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: PakaTheme.greyScale,
            ),
            borderRadius: BorderRadius.circular(23)),
        child: Row(
          children: [
            Icon(
              LineAwesomeIcons.trash_restore,
              color: PakaTheme.primaryGreen,
            ),
            const SizedBox(width: 3),
            const Text(
              'Request pick-up',
              style: TextStyle(fontSize: 10),
            ),
          ],
        ),
      ),
    );
  }
}
