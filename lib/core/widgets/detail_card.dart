import 'package:flutter/material.dart';
import 'package:paka/core/style/theme.dart';

class DetailCard extends StatelessWidget {
  final String label;
  final String content;
  const DetailCard({Key? key, required this.content, required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
        ),
        const SizedBox(height: 5),
        Container(
          margin: const EdgeInsets.only(bottom: 20),
          padding: const EdgeInsets.only(left: 10, top: 10, bottom: 5),
          width: double.maxFinite,
          height: 40,
          decoration: BoxDecoration(
            color: PakaTheme.lightGrey,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Text(content),
        ),
      ],
    );
  }
}
