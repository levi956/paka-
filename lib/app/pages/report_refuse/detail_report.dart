import 'package:flutter/material.dart';
import 'package:paka/core/navigation/navigation.dart';
import 'package:paka/core/widgets/add_image_card.dart';

import '../../../core/style/theme.dart';
import '../../../core/widgets/button.dart';

class DetailedReportPage extends StatefulWidget {
  const DetailedReportPage({Key? key}) : super(key: key);

  @override
  State<DetailedReportPage> createState() => _DetailedReportPageState();
}

class _DetailedReportPageState extends State<DetailedReportPage> {
  String _areaDescription = '';
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
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
            'Report refuse area',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: PakaTheme.primaryBlack,
            ),
          ),
        ),
        body: Padding(
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 20),
          child: ListView(
            children: [
              Column(
                children: [
                  Text(
                    'Details about refuse area',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: PakaTheme.primaryBlack,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Enter the details of the refuse area',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: PakaTheme.greyScale,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      'Enter the details of the refuse area',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: PakaTheme.primaryBlack,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  TextField(
                    onChanged: (v) {
                      setState(() {
                        _areaDescription = v;
                      });
                    },
                    textInputAction: TextInputAction.newline,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    cursorColor: PakaTheme.primaryGreen,
                    style: const TextStyle(fontWeight: FontWeight.w500),
                    decoration: feedbackInputStyle(),
                  ),
                  const SizedBox(height: 30),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      'Image of refuse area',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: PakaTheme.primaryBlack,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  AddImageCard(),
                  const SizedBox(height: 90),

                  //
                  CustomButton(
                    buttonWidth: double.maxFinite,
                    text: 'Submit',
                    onPressed: () => null,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration feedbackInputStyle() {
    return InputDecoration(
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: PakaTheme.lightGrey,
      filled: true,
      focusColor: PakaTheme.lightGrey,
      labelText: 'Enter Feedback',
      labelStyle: const TextStyle(fontWeight: FontWeight.w400),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(color: PakaTheme.lightGrey),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(color: PakaTheme.lightGrey),
      ),
      errorBorder: OutlineInputBorder(
        gapPadding: 2,
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(color: PakaTheme.primaryBlack),
      ),
    );
  }
}
