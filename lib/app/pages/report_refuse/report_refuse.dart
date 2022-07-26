import 'package:flutter/material.dart';
import 'package:nigerian_states_and_lga/nigerian_states_and_lga.dart';
import 'package:paka/app/pages/report_refuse/detail_report.dart';
import 'package:paka/core/navigation/navigation.dart';
import 'package:paka/core/widgets/button.dart';
import 'package:paka/core/widgets/textfield.dart';

import '../../../core/style/theme.dart';
import '../../../core/widgets/drop_down.dart';

class ReportRefusePage extends StatefulWidget {
  const ReportRefusePage({Key? key}) : super(key: key);

  @override
  State<ReportRefusePage> createState() => _ReportRefusePageState();
}

class _ReportRefusePageState extends State<ReportRefusePage> {
  String address = '';
  String state = NigerianStatesAndLGA.allStates[0];
  String city = 'Select your city';

  List<String> cityOptions = [
    'Select your city',
    'Ikeja',
    'Yaba',
    'Akute',
    'Magodo'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 20),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Report refuse area',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: PakaTheme.primaryBlack,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  'Enter the details of the refuse area',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: PakaTheme.greyScale,
                  ),
                ),
                const SizedBox(height: 50),
                CustomTextField(
                  label: 'Address',
                  isHidden: false,
                  keyboardType: TextInputType.streetAddress,
                  hintText: 'Enter refuse address',
                  onChanged: (k) {
                    setState(() {
                      address = k;
                    });
                  },
                ),
                const SizedBox(height: 20),
                CustomDropDown(
                  label: 'State',
                  items: NigerianStatesAndLGA.allStates
                      .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                      .toList(),
                  onChanged: (v) {
                    setState(() {
                      state = v!;
                    });
                  },
                  value: state,
                ),
                const SizedBox(height: 20),
                CustomDropDown(
                  label: 'City',
                  items: cityOptions
                      .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                      .toList(),
                  onChanged: (v) {
                    setState(() {
                      city = v!;
                    });
                  },
                  value: city,
                ),
              ],
            ),
            const SizedBox(height: 90),

            //
            CustomButton(
              text: 'Next',
              onPressed: () => pushTo(context, const DetailedReportPage()),
            ),
          ],
        ),
      ),
    );
  }
}
