import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/app_styles.dart';
import 'package:portfolio/core/utils/color_pallet.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.text,
      this.color = ColorPallet.mainPirpel,
      this.withBorder = false,
      required this.onPressed,
      required this.widget});
  final Widget widget;
  final String text;
  final Color? color;
  final bool withBorder;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 4 / 1,
      child: MaterialButton(
        color: color,
        minWidth: double.infinity,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: withBorder
                ? const BorderSide(color: ColorPallet.pink, width: 2)
                : BorderSide.none),
        onPressed: onPressed,
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: AppStyles.styleBold14(context).copyWith(
                color: color == ColorPallet.mainPirpel
                    ? Colors.white
                    : Colors.black,
              ),
            ),
            widget,
          ],
        ),
      ),
    );
  }
}

enum ValorantButtonVariant { filled, outline, light }

class ValorantButton extends StatefulWidget {
  const ValorantButton({
    super.key,
    required this.label,
    required this.onTap,
    this.variant = ValorantButtonVariant.filled,
    this.accent,
    this.height = 52,
    this.leading,
    this.trailing,
  });

  final String label;
  final VoidCallback onTap;
  final ValorantButtonVariant variant;
  final Color? accent;
  final double height;
  final Widget? leading;
  final Widget? trailing;

  @override
  State<ValorantButton> createState() => _ValorantButtonState();
}

class _ValorantButtonState extends State<ValorantButton> {
  bool _hovered = false;
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    final accent = widget.accent ?? ColorPallet.pink;

    // frame colors like Valorant UI
    final outerFrame = _hovered
        ? accent.withValues(alpha: 0.65)
        : ColorPallet.white.withValues(alpha: 0.35);

    final innerFrame = _hovered
        ? accent.withValues(alpha: 0.90)
        : ColorPallet.white.withValues(alpha: 0.18);

    // body styles
    final bool filled = widget.variant == ValorantButtonVariant.filled;
    final bool light = widget.variant == ValorantButtonVariant.light;

    final bodyColor = filled
        ? accent.withValues(alpha: _hovered ? 0.95 : 0.85)
        : (light
            ? ColorPallet.white.withValues(alpha: _hovered ? 0.95 : 0.90)
            : Colors.transparent);

    final textColor = filled
        ? ColorPallet.white
        : (light ? ColorPallet.mainPirpel : accent.withValues(alpha: 0.95));

    final borderColor = filled
        ? Colors.transparent
        : (_hovered
            ? accent.withValues(alpha: 0.95)
            : accent.withValues(alpha: 0.60));

    final scale = _pressed ? 0.985 : (_hovered ? 1.01 : 1.0);

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() {
        _hovered = false;
        _pressed = false;
      }),
      child: GestureDetector(
        onTap: widget.onTap,
        onTapDown: (_) => setState(() => _pressed = true),
        onTapUp: (_) => setState(() => _pressed = false),
        onTapCancel: () => setState(() => _pressed = false),
        child: AnimatedScale(
          duration: const Duration(milliseconds: 140),
          curve: Curves.easeOut,
          scale: scale,
          child: SizedBox(
            height: widget.height,
            child: Stack(
              children: [
                // OUTER FRAME
                Positioned.fill(
                  child: CustomPaint(
                    painter: _FramePainter(
                      color: outerFrame,
                      strokeWidth: 1.2,
                      cut: 10,
                    ),
                  ),
                ),

                // INNER FRAME (inset)
                Positioned.fill(
                  child: Padding(
                    padding: const EdgeInsets.all(6),
                    child: CustomPaint(
                      painter: _FramePainter(
                        color: innerFrame,
                        strokeWidth: 1.2,
                        cut: 10,
                      ),
                    ),
                  ),
                ),

                // BODY
                Positioned.fill(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: ClipPath(
                      clipper: const _ValorantCutClipper(cut: 10),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 160),
                        curve: Curves.easeOut,
                        decoration: BoxDecoration(
                          color: bodyColor,
                          border: Border.all(color: borderColor, width: 1.2),
                          boxShadow: _hovered
                              ? [
                                  BoxShadow(
                                    color: accent.withValues(alpha: 0.22),
                                    blurRadius: 20,
                                    spreadRadius: 0,
                                  )
                                ]
                              : [],
                        ),
                        child: Stack(
                          children: [
                            // subtle scan line (very Valorant)
                            if (_hovered && filled)
                              const Positioned.fill(
                                child: IgnorePointer(
                                  child: Opacity(
                                    opacity: 0.12,
                                    child: _ScanLines(color: ColorPallet.white),
                                  ),
                                ),
                              ),

                            // CONTENT
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 18,
                                right: 18,
                                top: 4,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  if (widget.leading != null) ...[
                                    widget.leading!,
                                    const SizedBox(width: 10),
                                  ],
                                  Flexible(
                                    child: Text(
                                      widget.label.toUpperCase(),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: AppStyles.styleSemiBold16(context)
                                          .copyWith(
                                        color: textColor,
                                        letterSpacing: 0.8,
                                      ),
                                    ),
                                  ),
                                  if (widget.trailing != null) ...[
                                    const SizedBox(width: 10),
                                    widget.trailing!,
                                  ],
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
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

/// Draws a rectangular frame with Valorant corner cuts
class _FramePainter extends CustomPainter {
  _FramePainter({
    required this.color,
    required this.strokeWidth,
    required this.cut,
  });

  final Color color;
  final double strokeWidth;
  final double cut;

  @override
  void paint(Canvas canvas, Size size) {
    final p = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    final path = _valorantPath(size, cut);
    canvas.drawPath(path, p);
  }

  Path _valorantPath(Size s, double c) {
    // corner cuts at top-left and bottom-right like Valorant UI
    return Path()
      ..moveTo(c, 0)
      ..lineTo(s.width, 0)
      ..lineTo(s.width, s.height - c)
      ..lineTo(s.width - c, s.height)
      ..lineTo(0, s.height)
      ..lineTo(0, c)
      ..close();
  }

  @override
  bool shouldRepaint(covariant _FramePainter oldDelegate) =>
      oldDelegate.color != color ||
      oldDelegate.strokeWidth != strokeWidth ||
      oldDelegate.cut != cut;
}

/// Body clip (same cut style)
class _ValorantCutClipper extends CustomClipper<Path> {
  const _ValorantCutClipper({required this.cut});
  final double cut;

  @override
  Path getClip(Size s) {
    final c = cut.clamp(0, s.height * 0.6);
    return Path()
      ..moveTo(c.toDouble(), 0.toDouble())
      ..lineTo(s.width.toDouble(), 0.toDouble())
      ..lineTo(s.width.toDouble(), s.height.toDouble() - c.toDouble())
      ..lineTo(s.width.toDouble() - c.toDouble(), s.height.toDouble())
      ..lineTo(0.toDouble(), s.height.toDouble())
      ..lineTo(0.toDouble(), c.toDouble())
      ..close();
  }

  @override
  bool shouldReclip(covariant _ValorantCutClipper oldClipper) =>
      oldClipper.cut != cut;
}

/// Simple scan lines overlay
class _ScanLines extends StatelessWidget {
  const _ScanLines({required this.color});
  final Color color;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _ScanLinePainter(color: color.withValues(alpha: 0.35)),
    );
  }
}

class _ScanLinePainter extends CustomPainter {
  _ScanLinePainter({required this.color});
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final p = Paint()
      ..color = color
      ..strokeWidth = 1;

    // horizontal lines
    for (double y = 0; y < size.height; y += 6) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), p);
    }
  }

  @override
  bool shouldRepaint(covariant _ScanLinePainter oldDelegate) =>
      oldDelegate.color != color;
}
