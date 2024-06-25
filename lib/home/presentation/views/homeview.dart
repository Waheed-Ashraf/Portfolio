import 'package:flutter/material.dart';
import 'package:portfolio/home/presentation/views/widgets/adaptive_layout.dart';
import 'package:portfolio/home/presentation/views/widgets/desktop_layout.dart';
import 'package:portfolio/home/presentation/views/widgets/mobile_layout.dart';
import 'package:portfolio/home/presentation/views/widgets/tablet_layout.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: MediaQuery.of(context).size.width <= (800 - 48)
          ? AppBar(
              elevation: 0,
              backgroundColor: const Color(0xffFAFAFA),
              leading: IconButton(
                  onPressed: () {
                    scaffoldKey.currentState!.openDrawer();
                  },
                  icon: const Icon(Icons.menu)),
            )
          : null,
      backgroundColor: const Color(0xffE5E5E5),
      // drawer: MediaQuery.of(context).size.width <= 800
      //     ? const CustomDrower()
      //     : null,
      body: AdaptiveLayout(
        mobileLayout: (context) => const MobileLayout(),
        tabletLayout: (context) => const TabletLayout(),
        desktopLayout: (context) => const DesktopLayout(),
      ),
    );
  }
}
