import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paka/app/pages/core/dashboard.dart';
import 'app/pages/onboard/onboard.dart';
import 'core/repository/repository.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Repository.init();
  runApp(
    const ProviderScope(
      child: PakaApp(),
    ),
  );
}

class PakaApp extends StatefulWidget {
  const PakaApp({Key? key}) : super(key: key);

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
      home: const Dashboard(),
    );
  }
}
