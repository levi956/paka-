import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paka/app/pages/authentication/sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app/pages/onboard/onboard.dart';
import 'core/repository/repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences pref = await SharedPreferences.getInstance();
  final logged = pref.getBool('logged') ?? false;
  Repository.init();
  runApp(
    PakaApp(
      isData: logged,
    ),
  );
}

class PakaApp extends StatefulWidget {
  final bool? isData;
  const PakaApp({Key? key, this.isData}) : super(key: key);

  @override
  State<PakaApp> createState() => _PakaAppState();
}

class _PakaAppState extends State<PakaApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PakaApp',
      theme: ThemeData(
        textTheme: GoogleFonts.interTextTheme(),
      ),
      home: widget.isData! ? const SignIn() : const Onboard(),
    );
  }
}
