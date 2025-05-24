import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

class AppConfig {
  static Color primaryColor = Colors.red;
  static Color backgroundColor = Colors.white;
  static Color cardColor = Colors.white;
  static double cardBorderRadius = 16.0;
  static double cardElevation = 4.0;
  static int grideViewCrossAxis = 4;
  static double headingFontSize = 20.0;
  static String appbarText = "Dynamic UI";
  static Color bannerBgColor = Colors.amber;

  static final ValueNotifier<bool> _configUpdated = ValueNotifier(false);

  static ValueNotifier<bool> get configUpdated => _configUpdated;

  static Future<void> load() async {
    final remoteConfig = FirebaseRemoteConfig.instance;
    await remoteConfig.setConfigSettings(
      RemoteConfigSettings(
        fetchTimeout: const Duration(seconds: 10),
        minimumFetchInterval: const Duration(seconds: 10),
      ),
    );
    await remoteConfig.fetchAndActivate();
    _updateConfigValues(remoteConfig);

    remoteConfig.onConfigUpdated.listen((event) async {
      await remoteConfig.activate();
      _updateConfigValues(remoteConfig);
      _configUpdated.value = !_configUpdated.value;
    });
  }

  static void _updateConfigValues(FirebaseRemoteConfig remoteConfig) {
    primaryColor = _parseColor(
      remoteConfig.getString('primary_color'),
      fallback: Colors.red,
    );
    bannerBgColor = _parseColor(
      remoteConfig.getString('banner_color'),
      fallback: Colors.amber,
    );
    backgroundColor = _parseColor(
      remoteConfig.getString('background_color'),
      fallback: Colors.white,
    );
    cardColor = _parseColor(
      remoteConfig.getString('card_color'),
      fallback: Colors.grey.shade100,
    );
    cardBorderRadius = remoteConfig.getDouble('card_border_radius');
    cardElevation = remoteConfig.getDouble('card_elevation');
    headingFontSize = remoteConfig.getDouble('heading_font_size');
    int fetchedValue = (remoteConfig.getDouble("grideViewCrossAxis")).toInt();
    grideViewCrossAxis = fetchedValue > 0 ? fetchedValue : 4;
    appbarText =
        remoteConfig.getString("appbarText").isEmpty
            ? "Empty Dynamic UI"
            : remoteConfig.getString("appbarText");
    log("Fetched grideViewCrossAxis: $grideViewCrossAxis");
  }

  static Color _parseColor(String hexCode, {Color fallback = Colors.black}) {
    try {
      if (hexCode.startsWith('#')) hexCode = hexCode.substring(1);
      if (hexCode.length == 6) hexCode = 'FF$hexCode';
      return Color(int.parse(hexCode, radix: 16));
    } catch (_) {
      return fallback;
    }
  }
}
