// card that says add image

import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:paka/core/style/theme.dart';

class AddImageCard extends StatelessWidget {
  const AddImageCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: PakaTheme.lightGrey,
        borderRadius: BorderRadius.circular(7),
      ),
      // probably throw a conditional when providing image has been gotten
      // from path
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(LineAwesomeIcons.image_file),
          SizedBox(height: 5),
          Text(
            'Tap here to add image',
            style: TextStyle(fontWeight: FontWeight.w300),
          ),
        ],
      ),
    );
  }
}
