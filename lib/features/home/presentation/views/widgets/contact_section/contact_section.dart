import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/app_styles.dart';
import 'package:portfolio/core/utils/color_pallet.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({
    super.key,
    this.toEmail = "washraf124@gmail.com",
  });

  final String toEmail;

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final _formKey = GlobalKey<FormState>();

  final _nameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _subjectCtrl = TextEditingController();
  final _messageCtrl = TextEditingController();

  bool _hovered = false;
  bool _submitting = false;

  @override
  void dispose() {
    _nameCtrl.dispose();
    _emailCtrl.dispose();
    _subjectCtrl.dispose();
    _messageCtrl.dispose();
    super.dispose();
  }

  Future<void> _sendEmail() async {
    final valid = _formKey.currentState?.validate() ?? false;
    if (!valid) return;

    setState(() => _submitting = true);

    final name = _nameCtrl.text.trim();
    final from = _emailCtrl.text.trim();
    final subject = _subjectCtrl.text.trim().isEmpty
        ? "Portfolio Contact"
        : _subjectCtrl.text.trim();
    final msg = _messageCtrl.text.trim();

    final body = '''
Name: $name
Email: $from

Message:
$msg
''';

    // mailto with proper URI encoding
    final uri = Uri(
      scheme: 'mailto',
      path: widget.toEmail,
      queryParameters: <String, String>{
        'subject': subject,
        'body': body,
      },
    );

    try {
      final ok = await launchUrl(uri, mode: LaunchMode.platformDefault);
      if (!mounted) return;

      if (!ok) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              "Couldn’t open email client. Please email ${widget.toEmail}",
              style: AppStyles.styleRegular14(context).copyWith(
                color: ColorPallet.white,
              ),
            ),
            backgroundColor: ColorPallet.mainPirpel,
          ),
        );
      } else {
        // Optional: clear after opening mail client
        _subjectCtrl.clear();
        _messageCtrl.clear();
      }
    } finally {
      if (mounted) setState(() => _submitting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 40.0),
            child: Text(
              "Contact",
              style: AppStyles.styleSectionTitle(context).copyWith(
                color: ColorPallet.white,
                shadows: AppStyles.sectionTitleShadow(),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: LayoutBuilder(
              builder: (context, c) {
                final tight = c.maxWidth < 900;

                return MouseRegion(
                  onEnter: (_) => setState(() => _hovered = true),
                  onExit: (_) => setState(() => _hovered = false),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 220),
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(
                        color: _hovered
                            ? ColorPallet.pink.withValues(alpha: 0.75)
                            : ColorPallet.pink.withValues(alpha: 0.45),
                        width: 2,
                      ),
                      gradient: const LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          ColorPallet.mainPirpel,
                          ColorPallet.darkGreen,
                          ColorPallet.mainPirpel,
                        ],
                      ),
                      boxShadow: _hovered
                          ? [
                              BoxShadow(
                                color: ColorPallet.pink.withValues(alpha: 0.2),
                                blurRadius: 28,
                                spreadRadius: 1,
                              )
                            ]
                          : [],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(22),
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: Container(
                              color: ColorPallet.mainPirpel
                                  .withValues(alpha: 0.12),
                            ),
                          ),
                          Form(
                            key: _formKey,
                            child: tight
                                ? _MobileForm(context)
                                : _DesktopForm(context),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _DesktopForm(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Let’s work together",
          style: AppStyles.styleSemiBold20(context).copyWith(
            color: ColorPallet.white.withValues(alpha: 0.95),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          "Send me a message and I’ll get back to you as soon as possible.",
          style: AppStyles.styleRegular14(context).copyWith(
            color: ColorPallet.white.withValues(alpha: 0.75),
            height: 1.35,
          ),
        ),
        const SizedBox(height: 18),
        Row(
          children: [
            Expanded(
              child: _Field(
                label: "Your Name",
                controller: _nameCtrl,
                validator: (v) => (v == null || v.trim().isEmpty)
                    ? "Please enter your name"
                    : null,
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: _Field(
                label: "Your Email",
                controller: _emailCtrl,
                keyboardType: TextInputType.emailAddress,
                validator: (v) {
                  final t = (v ?? "").trim();
                  if (t.isEmpty) return "Please enter your email";
                  final emailOk =
                      RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch(t);
                  return emailOk ? null : "Enter a valid email";
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 14),
        _Field(
          label: "Subject (optional)",
          controller: _subjectCtrl,
        ),
        const SizedBox(height: 14),
        _Field(
          label: "Message",
          controller: _messageCtrl,
          maxLines: 5,
          validator: (v) => (v == null || v.trim().length < 10)
              ? "Please write at least 10 characters"
              : null,
        ),
        const SizedBox(height: 18),
        Align(
          alignment: Alignment.centerRight,
          child: _SendButton(
            isLoading: _submitting,
            onPressed: _submitting ? null : _sendEmail,
          ),
        ),
      ],
    );
  }

  Widget _MobileForm(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Let’s work together",
          style: AppStyles.styleSemiBold20(context).copyWith(
            color: ColorPallet.white.withValues(alpha: 0.95),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          "Send me a message and I’ll get back to you.",
          style: AppStyles.styleRegular14(context).copyWith(
            color: ColorPallet.white.withValues(alpha: 0.75),
            height: 1.35,
          ),
        ),
        const SizedBox(height: 18),
        _Field(
          label: "Your Name",
          controller: _nameCtrl,
          validator: (v) =>
              (v == null || v.trim().isEmpty) ? "Please enter your name" : null,
        ),
        const SizedBox(height: 14),
        _Field(
          label: "Your Email",
          controller: _emailCtrl,
          keyboardType: TextInputType.emailAddress,
          validator: (v) {
            final t = (v ?? "").trim();
            if (t.isEmpty) return "Please enter your email";
            final emailOk = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch(t);
            return emailOk ? null : "Enter a valid email";
          },
        ),
        const SizedBox(height: 14),
        _Field(
          label: "Subject (optional)",
          controller: _subjectCtrl,
        ),
        const SizedBox(height: 14),
        _Field(
          label: "Message",
          controller: _messageCtrl,
          maxLines: 5,
          validator: (v) => (v == null || v.trim().length < 10)
              ? "Please write at least 10 characters"
              : null,
        ),
        const SizedBox(height: 18),
        _SendButton(
          isLoading: _submitting,
          onPressed: _submitting ? null : _sendEmail,
        ),
      ],
    );
  }
}

class _Field extends StatelessWidget {
  const _Field({
    required this.label,
    required this.controller,
    this.validator,
    this.maxLines = 1,
    this.keyboardType,
  });

  final String label;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final int maxLines;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppStyles.styleSemiBold16(context).copyWith(
            color: ColorPallet.white.withValues(alpha: 0.85),
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          validator: validator,
          maxLines: maxLines,
          keyboardType: keyboardType,
          style: AppStyles.styleRegular14(context).copyWith(
            color: ColorPallet.white.withValues(alpha: 0.92),
          ),
          decoration: InputDecoration(
            filled: true,
            fillColor: ColorPallet.mainPirpel.withValues(alpha: 0.28),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(
                color: ColorPallet.white.withValues(alpha: 0.10),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(
                color: ColorPallet.white.withValues(alpha: 0.10),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(
                color: ColorPallet.pink.withValues(alpha: 0.8),
                width: 2,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(
                color: ColorPallet.pink.withValues(alpha: 0.75),
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(
                color: ColorPallet.pink.withValues(alpha: 0.9),
                width: 2,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _SendButton extends StatefulWidget {
  const _SendButton({
    required this.isLoading,
    required this.onPressed,
  });

  final bool isLoading;
  final VoidCallback? onPressed;

  @override
  State<_SendButton> createState() => _SendButtonState();
}

class _SendButtonState extends State<_SendButton> {
  bool hovered = false;

  @override
  Widget build(BuildContext context) {
    final disabled = widget.onPressed == null;

    return MouseRegion(
      onEnter: (_) => setState(() => hovered = true),
      onExit: (_) => setState(() => hovered = false),
      child: GestureDetector(
        onTap: widget.onPressed,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: disabled
                  ? ColorPallet.white.withValues(alpha: 0.15)
                  : (hovered
                      ? ColorPallet.pink.withValues(alpha: 0.9)
                      : ColorPallet.pink.withValues(alpha: 0.55)),
              width: 2,
            ),
            color: disabled
                ? Colors.black.withValues(alpha: 0.2)
                : (hovered
                    ? ColorPallet.pink.withValues(alpha: 0.14)
                    : Colors.black.withValues(alpha: 0.2)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.isLoading) ...[
                const SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
                const SizedBox(width: 10),
              ] else ...[
                Icon(
                  Icons.send_rounded,
                  size: 18,
                  color: ColorPallet.white.withValues(alpha: 0.95),
                ),
                const SizedBox(width: 10),
              ],
              Text(
                widget.isLoading ? "Preparing..." : "Send Message",
                style: AppStyles.styleSemiBold16(context).copyWith(
                  color: ColorPallet.white.withValues(alpha: 0.95),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
