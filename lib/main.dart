import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:municipium/app.dart';
import 'package:municipium/utils/secure_storage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: kIsWeb
          ? HydratedStorage.webStorageDirectory
          : await getTemporaryDirectory());
  final prefs = await SharedPreferences.getInstance();
  if (prefs.getBool('first_run') ?? true) {
    // need this for IOS app deleting, securestorage is not deleted with app
    FlutterSecureStorage flutterSecureStorage = FlutterSecureStorage();
    await flutterSecureStorage.deleteAll();
    SecureStorage storage = SecureStorage();
    await HydratedBloc.storage.clear();
    storage.deleteAll();

    prefs.setBool('first_run', false);
  }

  await FlutterDownloader.initialize(
    debug: true, // optional: set to false to disable printing logs to console (default: true)
    ignoreSsl: true // option: set to false to disable working with http links (default: false)
  );
  runApp(App());
}
