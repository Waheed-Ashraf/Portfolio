import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/color_pallet.dart';
import 'package:portfolio/features/home/presentation/views/widgets/adaptive_layout.dart';
import 'package:portfolio/features/home/presentation/views/widgets/desktop_layout.dart';
import 'package:portfolio/features/home/presentation/views/widgets/mobile_layout.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [ColorPallet.mainPirpel, Colors.black, ColorPallet.darkGreen],
        ),
      ),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.transparent, // 👈 IMPORTANT
        appBar: MediaQuery.of(context).size.width <= 799
            ? AppBar(
                elevation: 0,
                backgroundColor: Colors.transparent, // 👈 Keep gradient visible
                leading: IconButton(
                  onPressed: () => scaffoldKey.currentState!.openDrawer(),
                  icon: const Icon(Icons.menu),
                ),
              )
            : null,
        body: AdaptiveLayout(
          mobileLayout: (context) => const MobileLayout(),
          desktopLayout: (context) => const DesktopLayout(),
        ),
      ),
    );
  }
}
