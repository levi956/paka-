import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paka/app/pages/authentication/sign_in.dart';
import 'package:paka/app/pages/authentication/sign_up.dart';
import 'package:paka/app/pages/onboard/onboard.dart';
import 'package:paka/core/system/set_potrait.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SetPotrait.init();
  runApp(const PakaApp());
}

class PakaApp extends StatelessWidget {
  const PakaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Paka',
      theme: ThemeData(
        textTheme: GoogleFonts.interTextTheme(),
      ),
      home: const Onboard(),
    );
  }
}


// implement app first time launch
// save a key to local storage
// on app startup, check the key and then direct to login or onboard