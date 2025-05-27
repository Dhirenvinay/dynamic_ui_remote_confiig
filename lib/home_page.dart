import 'dart:developer';

import 'package:dynamiui/app_config.dart';
import 'package:dynamiui/buy_cards.dart';
import 'package:dynamiui/custom_app_bar.dart';
import 'package:dynamiui/deal_widget.dart';
import 'package:dynamiui/gride_builder.dart';
import 'package:dynamiui/offer_wiidget.dart';
import 'package:dynamiui/slider_widget.dart';
import 'package:flutter/material.dart';

final Map<String, Widget Function()> widgetMap = {
  'siderWidget': () => SliderWidget(),
  'grideView': () => GrideBuilder(),
  'buyCard': () => BuyCards(),
  'offerWidget': () => OfferWiidget(),
  'dealWidget': () => DealWidget(),
};

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: ValueListenableBuilder<bool>(
        valueListenable: AppConfig.configUpdated,
        builder: (context, _, child) {
          final homeWidgets = AppConfig.HomeWidgets.split(",");
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (String widgetName in homeWidgets) ...[
                  SizedBox(height: 20),
                  GetWidgetByName(widgetName: widgetName),
                ],
              ],
            ),
          );
        },
      ),
    );
  }
}

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

class GetWidgetByName extends StatelessWidget {
  const GetWidgetByName({super.key, required this.widgetName});
  final String widgetName;

  @override
  Widget build(BuildContext context) {
    if (widgetMap.containsKey(widgetName)) {
      return widgetMap[widgetName]!();
    } else {
      log("the nname $widgetName and $widgetMap");
      return Text('Widget "$widgetName" not found');
    }
  }
}
