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
  static Color buyCardsColor = Color(0xFFE0E7FF);
  static Color buySecondaryCard = Color(0xFFE0F7FA);
  static double buyCardBr = 20;
  static double buySecondaryCardBr = 20;
  static Color viewAllColor = Colors.blue;
  static String HomeWidgets =
      "siderWidget,grideView,buyCard,offerWidget,dealWidget";
  static String bedRoom = "PRICE DROP";
  static String storage = "";
  static String study = "";
  static String dining = "NEW";
  static String tables = "";
  static String chairs = "";
  static String zRated = "";
  // Sliders Configs
  static double siderAspectRatio = 16 / 9;
  static String sliderImages =
      "https://images.pexels.com/photos/139309/pexels-photo-139309.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2,https://images.pexels.com/photos/164005/pexels-photo-164005.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2,https://images.pexels.com/photos/1137511/pexels-photo-1137511.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2";

  // Offer  Widget
  static double offerBr = 20;

  static Color appBarBg = Color(0xFFF5F5F5);

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
    buyCardsColor = _parseColor(
      remoteConfig.getString('buy_cards_color'),
      fallback: Color(0xFFE0E7FF),
    );
    buySecondaryCard = _parseColor(
      remoteConfig.getString('buy_secondary_cards_color'),
      fallback: Color(0xFFE0F7FA),
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
    viewAllColor = _parseColor(
      remoteConfig.getString('see_all'),
      fallback: Colors.blue,
    );
    appBarBg = _parseColor(
      remoteConfig.getString('appBarBg'),
      fallback: Color(0xFFF5F5F5),
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
    buyCardBr =
        remoteConfig.getDouble("buyCardBr") < 1
            ? 20
            : remoteConfig.getDouble("buyCardBr");
    buySecondaryCardBr =
        remoteConfig.getDouble("buySecondaryCardBr") < 1
            ? 20
            : remoteConfig.getDouble("buySecondaryCardBr");
    HomeWidgets =
        remoteConfig.getString("HomeWidgets").isEmpty
            ? "siderWidget,grideView,buyCard,offerWidget,dealWidget"
            : remoteConfig.getString("HomeWidgets");
    // Slider Remote
    sliderImages =
        remoteConfig.getString("sliderImages").isEmpty
            ? "https://images.pexels.com/photos/139309/pexels-photo-139309.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2,https://images.pexels.com/photos/164005/pexels-photo-164005.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2,https://images.pexels.com/photos/1137511/pexels-photo-1137511.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"
            : remoteConfig.getString("sliderImages");

    siderAspectRatio =
        remoteConfig.getDouble("siderAspectRatio") == 0
            ? 16 / 9
            : remoteConfig.getDouble("siderAspectRatio");
    offerBr =
        remoteConfig.getDouble("offerBr") < 1
            ? 20
            : remoteConfig.getDouble("offerBr");

    appbarText =
        remoteConfig.getString("appbarText").isEmpty
            ? "Empty Dynamic UI"
            : remoteConfig.getString("appbarText");
    // Gride badge

    bedRoom =
        remoteConfig.getString("bedRoom").isEmpty
            ? "PRICE DROP"
            : remoteConfig.getString("bedRoom");

    storage =
        remoteConfig.getString("storage").isEmpty
            ? "PRICE DROP"
            : remoteConfig.getString("storage");

    study =
        remoteConfig.getString("study").isEmpty
            ? "PRICE DROP"
            : remoteConfig.getString("study");

    dining =
        remoteConfig.getString("dining").isEmpty
            ? "PRICE DROP"
            : remoteConfig.getString("dining");

    tables =
        remoteConfig.getString("tables").isEmpty
            ? "PRICE DROP"
            : remoteConfig.getString("tables");

    chairs =
        remoteConfig.getString("chairs").isEmpty
            ? "PRICE DROP"
            : remoteConfig.getString("chairs");

    zRated =
        remoteConfig.getString("zRated").isEmpty
            ? "PRICE DROP"
            : remoteConfig.getString("zRated");

    log(
      "Fetched grideViewCrossAxis: $grideViewCrossAxis ${remoteConfig.getDouble("buySecondaryCardBr")}",
    );
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
