import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:network_service/model/language_response.dart';

enum StorageKey {
  language,
  country,
  region,
}

class Storage {
  final _storage = const FlutterSecureStorage();
  Storage._internal();
  static final Storage _instance = Storage._internal();

  factory Storage() {
    return _instance;
  }

  Future<String?> _get(StorageKey key) async {
    return await _storage.read(key: key.name);
  }

  // Future<Map<String, dynamic>?> _getMap(StorageKey key) async {
  //   var value = await _storage.read(key: key.name);
  //   return value != null
  //       ? jsonDecode(value)
  //       : {
  //           'iso_639_1': "en-US",
  //           'english_name': "English",
  //           'name': "English",
  //         };
  // }

  Future<void> _write(StorageKey key, String value) async {
    await _storage.write(key: key.name, value: value);
  }

  Future<void> _writeMap(StorageKey key, Map<String, dynamic> value) async {
    await _storage.write(key: key.name, value: jsonEncode(value));
  }

  delete(StorageKey key) async {
    await _storage.delete(key: key.name);
  }

  deleteAll() async {
    await _storage.deleteAll();
  }

  Future<LanguageResponse> getLanguage() async {
    var value = await _get(StorageKey.language);
    var languageMap = value != null
        ? jsonDecode(value)
        : {
            'iso_639_1': "en-US",
            'english_name': "English",
            'name': "English",
          };
    return LanguageResponse.fromJson(languageMap);
  }

  Future<void> setLanguage(Map<String, dynamic> value) async {
    await _writeMap(StorageKey.language, value);
  }
}
