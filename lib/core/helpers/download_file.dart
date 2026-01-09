import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:universal_html/html.dart' as html;

import 'package:portfolio/core/utils/const.dart';
import 'package:portfolio/core/utils/app_snackbar.dart';

Future<void> downloadCV(BuildContext context) async {
  try {
    AppSnackBar.show(
      context,
      type: AppSnackType.info,
      title: "CV",
      message: "Download started…",
    );

    // ---------------- WEB ----------------
    if (kIsWeb) {
      html.AnchorElement(href: cvUrl)
        ..download = "Waheed-Ashraf-cv.pdf"
        ..click();
      return;
    }

    // -------------- MOBILE / DESKTOP --------------
    final directory = await getApplicationDocumentsDirectory();
    final filePath = '${directory.path}/Waheed-Ashraf-cv.pdf';

    final dio = Dio();
    await dio.download(cvUrl, filePath);
  } catch (e) {
    AppSnackBar.show(
      context,
      type: AppSnackType.error,
      title: "Download failed",
      message: "$e",
    );
  }
}
