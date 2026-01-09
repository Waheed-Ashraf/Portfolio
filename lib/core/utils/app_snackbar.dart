import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/color_pallet.dart';

enum AppSnackType { success, error, info, warning }

class AppSnackBar {
  static void show(
    BuildContext context, {
    required String message,
    String? title,
    AppSnackType type = AppSnackType.info,
    Duration duration = const Duration(seconds: 3),
  }) {
    final theme = _theme(type);

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
          elevation: 0,
          duration: duration,
          margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          content: _SnackContent(
            title: title ?? theme.defaultTitle,
            message: message,
            icon: theme.icon,
            accent: theme.accent,
          ),
        ),
      );
  }

  static _SnackTheme _theme(AppSnackType type) {
    switch (type) {
      case AppSnackType.success:
        return const _SnackTheme(
          accent: ColorPallet.skyColor,
          icon: Icons.check_circle_rounded,
          defaultTitle: "Done",
        );
      case AppSnackType.error:
        return const _SnackTheme(
          accent: Colors.redAccent,
          icon: Icons.error_rounded,
          defaultTitle: "Error",
        );
      case AppSnackType.warning:
        return const _SnackTheme(
          accent: Colors.orangeAccent,
          icon: Icons.warning_rounded,
          defaultTitle: "Warning",
        );
      case AppSnackType.info:
        return const _SnackTheme(
          accent: ColorPallet.pink,
          icon: Icons.info_rounded,
          defaultTitle: "Info",
        );
    }
  }
}

class _SnackTheme {
  final Color accent;
  final IconData icon;
  final String defaultTitle;

  const _SnackTheme({
    required this.accent,
    required this.icon,
    required this.defaultTitle,
  });
}

class _SnackContent extends StatelessWidget {
  const _SnackContent({
    required this.title,
    required this.message,
    required this.icon,
    required this.accent,
  });

  final String title;
  final String message;
  final IconData icon;
  final Color accent;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1),
      duration: const Duration(milliseconds: 220),
      curve: Curves.easeOutCubic,
      builder: (_, t, child) {
        return Opacity(
          opacity: t,
          child: Transform.translate(
            offset: Offset(0, (1 - t) * 10),
            child: child,
          ),
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            decoration: BoxDecoration(
              color: ColorPallet.mainPirpel.withValues(alpha: 0.30),
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                color: accent.withValues(alpha: 0.55),
                width: 1.4,
              ),
              boxShadow: [
                BoxShadow(
                  color: accent.withValues(alpha: 0.22),
                  blurRadius: 22,
                  spreadRadius: 1,
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: accent.withValues(alpha: 0.15),
                    border: Border.all(
                      color: accent.withValues(alpha: 0.55),
                      width: 1,
                    ),
                  ),
                  child: Icon(icon, color: Colors.white, size: 22),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        message,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.85),
                          fontWeight: FontWeight.w500,
                          fontSize: 12.5,
                          height: 1.25,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                InkWell(
                  borderRadius: BorderRadius.circular(12),
                  onTap: () =>
                      ScaffoldMessenger.of(context).hideCurrentSnackBar(),
                  child: Padding(
                    padding: const EdgeInsets.all(6),
                    child: Icon(
                      Icons.close_rounded,
                      color: Colors.white.withValues(alpha: 0.85),
                      size: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
