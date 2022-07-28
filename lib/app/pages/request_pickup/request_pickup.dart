import 'package:flutter/material.dart';
import 'package:paka/core/widgets/button.dart';
import 'package:paka/core/widgets/detail_card.dart';
import 'package:paka/core/widgets/textfield.dart';

import '../../../core/navigation/navigation.dart';
import '../../../core/style/theme.dart';
import '../../../core/widgets/drop_down.dart';

class RequestPickUpPage extends StatefulWidget {
  const RequestPickUpPage({Key? key}) : super(key: key);

  @override
  State<RequestPickUpPage> createState() => _RequestPickUpPageState();
}

class _RequestPickUpPageState extends State<RequestPickUpPage> {
  String pickupType = 'Select pickup type';
  String refuseType = 'Select refuse type';

  List<String> pickupTypeOptions = [
    'Select pickup type',
    'Instant pickup',
    'Scheduled pickup'
  ];
  List<String> refuseTypeOptions = [
    'Select refuse type',
    'Industrial refuse',
    'Domestic pickup',
  ];

  String address = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          padding: EdgeInsets.zero,
          iconSize: 19,
          color: PakaTheme.primaryGreen,
          onPressed: () => pop(context),
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text(
          'Request pickup',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: PakaTheme.primaryBlack,
          ),
        ),
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 10),
        child: ListView(
          children: [
            Column(
              children: [
                Text(
                  'Request for refuse pickup',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: PakaTheme.primaryBlack,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  'Let us know more about this refuse area.',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: PakaTheme.greyScale,
                  ),
                ),
              ],
            ),

            //
            const SizedBox(height: 30),
            CustomDropDown(
              label: 'PickupType',
              items: pickupTypeOptions
                  .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                  .toList(),
              onChanged: (v) {
                setState(() {
                  pickupType = v!;
                });
              },
              value: pickupType,
            ),
            const SizedBox(height: 20),
            // if pick up is instant, include date
            Column(
              children: [
                CustomDropDown(
                  label: 'Refuse Type',
                  items: refuseTypeOptions
                      .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                      .toList(),
                  onChanged: (v) {
                    setState(() {
                      refuseType = v!;
                    });
                  },
                  value: refuseType,
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  label: 'Address',
                  isHidden: false,
                  hintText: 'Enter the address',
                  onChanged: (k) {
                    setState(() {
                      address = k;
                    });
                  },
                ),
                const SizedBox(height: 20),
              ],
            ),

            if (refuseType != 'Select refuse type')
              DetailCard(
                content:
                    refuseType == 'Industrial refuse' ? '₦3,000' : '₦2,500',
                label: 'Price',
              ),

            const SizedBox(height: 40),
            CustomButton(
              text: 'Proceed to payment',
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
