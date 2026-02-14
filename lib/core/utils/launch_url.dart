import 'package:flutter/foundation.dart';
import 'package:portfolio/core/utils/app_snackbar.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launchCustomUr({
  required context,
  required String url,
}) async {
  final uri = Uri.parse(url);

  final launched = await launchUrl(
    uri,
    mode: LaunchMode.externalApplication,
    webOnlyWindowName: '_blank',
  );

  if (!launched && !kIsWeb) {
    AppSnackBar.show(
      context,
      type: AppSnackType.error,
      title: "Error",
      message: 'Cannot launch $url',
    );
  }
}
