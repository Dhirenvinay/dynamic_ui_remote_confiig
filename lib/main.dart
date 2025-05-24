import 'package:dynamiui/deal_widget.dart';
import 'package:dynamiui/gride_builder.dart';
import 'package:dynamiui/home_page.dart';
import 'package:dynamiui/offer_wiidget.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'app_config.dart';
import 'app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await AppConfig.load(); // Load initial config values
  runApp(const ZeptoStyleApp());
}

class ZeptoStyleApp extends StatefulWidget {
  const ZeptoStyleApp({super.key});

  @override
  State<ZeptoStyleApp> createState() => _ZeptoStyleAppState();
}

class _ZeptoStyleAppState extends State<ZeptoStyleApp> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: AppConfig.configUpdated,
      builder: (context, _, child) {
        return MaterialApp(
          title: 'Zepto Style App',
          theme: buildAppTheme(), // Rebuild theme when config updates
          home: const HomePage(),
        );
      },
    );
  }
}
