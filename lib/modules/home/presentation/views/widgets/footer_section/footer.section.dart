import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/app_styles.dart';
import 'package:portfolio/core/utils/color_pallet.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = AppStyles.styleRegular14(context).copyWith(
      color: ColorPallet.white.withValues(alpha: 0.65),
      letterSpacing: 0.4,
    );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Center(
        child: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          alignment: WrapAlignment.center,
          spacing: 6,
          children: [
            Text("Made with", style: textStyle),
            const _PulsingHeart(),
            Text("by Waheed Ashraf", style: textStyle),
          ],
        ),
      ),
    );
  }
}

class _PulsingHeart extends StatefulWidget {
  const _PulsingHeart();

  @override
  State<_PulsingHeart> createState() => _PulsingHeartState();
}

class _PulsingHeartState extends State<_PulsingHeart>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scale;
  late final Animation<double> _opacity;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    )..repeat(reverse: true);

    // Subtle pulse (1.00 -> 1.10)
    _scale = Tween<double>(begin: 1.0, end: 1.10).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    // Subtle breathing opacity (0.75 -> 1.0)
    _opacity = Tween<double>(begin: 0.75, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, __) {
        return Opacity(
          opacity: _opacity.value,
          child: Transform.scale(
            scale: _scale.value,
            child: Text(
              "❤️",
              style: AppStyles.styleRegular14(context).copyWith(
                color: ColorPallet.pink.withValues(alpha: 0.9),
              ),
            ),
          ),
        );
      },
    );
  }
}
