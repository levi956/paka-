import 'package:flutter/material.dart';
import 'package:paka/app/pages/authentication/sign_up.dart';
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
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Paka',
      home: SignUp(),
    );
  }
}
