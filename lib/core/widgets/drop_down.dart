import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import '../style/theme.dart';

class CustomDropDown extends StatelessWidget {
  final String label;
  final String value;

  final List<DropdownMenuItem<String>> items;
  final Function(String?)? onChanged;
  const CustomDropDown({
    Key? key,
    required this.label,
    required this.items,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.w300,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          height: 47,
          padding: const EdgeInsets.only(
            left: 15,
            right: 15,
            top: 10,
            bottom: 10,
          ),
          decoration: BoxDecoration(
            color: PakaTheme.lightGrey,
            borderRadius: BorderRadius.circular(3),
          ),
          child: DropdownButton2(
            dropdownElevation: 2,
            buttonElevation: 2,
            alignment: Alignment.bottomLeft,
            value: value,
            dropdownDecoration:
                BoxDecoration(borderRadius: BorderRadius.circular(10)),
            dropdownMaxHeight: 250,
            isExpanded: true,
            underline: const SizedBox.shrink(),
            icon: const Icon(Icons.keyboard_arrow_down),
            style: TextStyle(
                fontWeight: FontWeight.w300, color: PakaTheme.primaryBlack),
            items: items,
            onChanged: onChanged,
          ),
        )
      ],
    );
  }
}
