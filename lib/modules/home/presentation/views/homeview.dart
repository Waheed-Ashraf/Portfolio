import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/core/utils/app_images.dart';
import 'package:portfolio/core/utils/color_pallet.dart';
import 'package:portfolio/core/utils/const.dart';
import 'package:portfolio/modules/home/presentation/views/widgets/adaptive_layout.dart';
import 'package:portfolio/modules/home/presentation/views/widgets/app_bar_widgets/app_logo.dart';
import 'package:portfolio/modules/home/presentation/views/widgets/desktop_layout.dart';
import 'package:portfolio/modules/home/presentation/views/widgets/mobile_layout.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  MobileSectionKeys? _mobileKeys;
  Future<void> _scrollTo(GlobalKey key) async {
    final keys = _mobileKeys;
    if (keys == null) return;

    final ctx = key.currentContext;
    if (ctx == null) return;
    if (scaffoldKey.currentState?.isDrawerOpen ?? false) {
      Navigator.of(context).pop();
      await Future.delayed(const Duration(milliseconds: 280));
    }
    if (!ctx.mounted) return;
    final renderObject = ctx.findRenderObject();
    if (renderObject is! RenderObject) return;

    final viewport = RenderAbstractViewport.of(renderObject);
    final targetOffset = viewport.getOffsetToReveal(renderObject, 0.0).offset;

    await keys.scrollController.animateTo(
      (targetOffset - 80)
          .clamp(0.0, keys.scrollController.position.maxScrollExtent),
      duration: const Duration(milliseconds: 650),
      curve: Curves.easeInOutCubic,
    );
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.sizeOf(context).width < breakPoint;

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
        backgroundColor: Colors.transparent,
        drawer: isMobile ? buildDrawer() : null,
        appBar: isMobile
            ? AppBar(
                elevation: 0,
                backgroundColor: Colors.transparent,
                leading: IconButton(
                  onPressed: () => scaffoldKey.currentState!.openDrawer(),
                  icon: SvgPicture.asset(Assets.menuIcon,
                      colorFilter: const ColorFilter.mode(
                          ColorPallet.white, BlendMode.srcIn),
                      width: 28,
                      height: 28),
                ),
                centerTitle: true,
                title: const Column(
                  children: [
                    SizedBox(
                      height: 8,
                    ),
                    AppLogo(),
                  ],
                ),
              )
            : null,
        body: AdaptiveLayout(
          mobileLayout: (context) => MobileLayout(
            onSectionKeysReady: (keys) {
              setState(() => _mobileKeys = keys);
            },
          ),
          desktopLayout: (context) => const DesktopLayout(),
        ),
      ),
    );
  }

  Widget buildDrawer() {
    final keys = _mobileKeys;

    return Drawer(
      backgroundColor: ColorPallet.mainPirpel.withValues(alpha: 0.95),
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 12),
          children: [
            const SizedBox(height: 6),
            ListTile(
              title:
                  const Text("About Me", style: TextStyle(color: Colors.white)),
              onTap: keys == null ? null : () => _scrollTo(keys.about),
            ),
            ListTile(
              title: const Text("Education & Certifications",
                  style: TextStyle(color: Colors.white)),
              onTap: keys == null ? null : () => _scrollTo(keys.education),
            ),
            ListTile(
              title:
                  const Text("Projects", style: TextStyle(color: Colors.white)),
              onTap: keys == null ? null : () => _scrollTo(keys.projects),
            ),
            ListTile(
              title:
                  const Text("Skills", style: TextStyle(color: Colors.white)),
              onTap: keys == null ? null : () => _scrollTo(keys.skills),
            ),
            ListTile(
              title:
                  const Text("Services", style: TextStyle(color: Colors.white)),
              onTap: keys == null ? null : () => _scrollTo(keys.services),
            ),
            ListTile(
              title:
                  const Text("GitHub", style: TextStyle(color: Colors.white)),
              onTap: keys == null ? null : () => _scrollTo(keys.github),
            ),
          ],
        ),
      ),
    );
  }
}
