import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paka/core/system/set_potrait.dart';
import 'package:shared_preferences/shared_preferences.dart';

final isFirstLaunchProvider = StateProvider<bool>((ref) {
  return true;
});

class Repository {
  static Repository? _instance;
  static Repository get instance => _instance ??= Repository();

  static init() {
    SetPotrait.init();
    // maybe try and check if here
  }
}

class MySharedPreferences {
  MySharedPreferences._privateConstructor();

  static final MySharedPreferences instance =
      MySharedPreferences._privateConstructor();
  setBooleanValue(String key, bool value) async {
    SharedPreferences myPrefs = await SharedPreferences.getInstance();
    myPrefs.setBool(key, value);
  }

  Future<bool> getBooleanValue(String key) async {
    SharedPreferences myPrefs = await SharedPreferences.getInstance();
    return myPrefs.getBool(key) ?? false;
  }
}
