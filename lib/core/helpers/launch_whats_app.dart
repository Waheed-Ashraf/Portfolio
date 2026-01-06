import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:portfolio/core/utils/const.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:universal_html/html.dart' as html;

Future<void> launchWhatsApp(BuildContext context) async {
  try {
    if (kIsWeb) {
      html.window.open(whatsappUrlWeb, 'new tab');
    } else {
      final Uri url = Uri.parse(whatsappUrlMobile);

      if (await canLaunchUrl(url)) {
        await launchUrl(url, mode: LaunchMode.externalApplication);
      } else {
        throw 'Could not launch $whatsappUrlMobile';
      }
    }
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Error launching WhatsApp: $e'),
        duration: const Duration(seconds: 3),
      ),
    );
  }
}
