import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/core/services/portfolio_analytics.dart';
import 'package:portfolio/core/utils/color_pallet.dart';
import 'package:portfolio/firebase_options.dart';
import 'package:portfolio/modules/home/presentation/views/homeview.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorObservers: [PortfolioAnalytics.observer],
      theme: ThemeData.dark(
        useMaterial3: true,
      ).copyWith(
        scaffoldBackgroundColor: ColorPallet.mainPirpel,
      ),
      home: const HomeView(),
    );
  }
}
