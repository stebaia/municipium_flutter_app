import 'package:shared_preferences/shared_preferences.dart';

class StorageSharedPreferences {
  StorageSharedPreferences._privateConstructor();

  final _isFirstTimeKey = "IS_FIRST_TIME";

  static final StorageSharedPreferences instance =
      StorageSharedPreferences._privateConstructor();

  setFirstTimeInShared(bool value) async {
    SharedPreferences myPrefs = await SharedPreferences.getInstance();
    myPrefs.setBool(_isFirstTimeKey, value);
  }

  Future<bool> isFirstTimeFromShared() async {
    SharedPreferences myPrefs = await SharedPreferences.getInstance();
    return myPrefs.getBool(_isFirstTimeKey) ?? true;
  }
}