import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:paka/core/style/theme.dart';

class PickUpCard extends StatelessWidget {
  const PickUpCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(7),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: const Color.fromARGB(255, 192, 229, 198),
            child: Icon(LineAwesomeIcons.trash,
                size: 22, color: PakaTheme.primaryGreen),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '#Pickup 0015',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: PakaTheme.primaryBlack),
              ),
              const SizedBox(height: 5),
              Text(
                'Scheduled pickup *20th May',
                style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: PakaTheme.hintTextColor),
              ),
            ],
          ),
          const Spacer(),
          const Text(
            'Pending',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Color(0xFFFE8343),
            ),
          ),
        ],
      ),
    );
  }
}
