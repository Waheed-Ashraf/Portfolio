import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:portfolio/core/utils/color_pallet.dart';
import 'package:portfolio/core/utils/const.dart';
import 'package:portfolio/core/widgets/snak_bar.dart';
import 'dart:io' as io;
import 'package:universal_html/html.dart' as html;

Future<void> downloadCV(BuildContext context) async {
  try {
    if (!kIsWeb && (io.Platform.isAndroid || io.Platform.isIOS)) {
      // Mobile platforms
      final directory = await getApplicationDocumentsDirectory();
      final filePath = '${directory.path}/Waheed-Ashraf-cv.pdf';
      final dio = Dio();
      await dio.download(cvUrl, filePath);

      // File downloaded successfully

      showSnackBar(context,
          color: ColorPallet.mainPirpel, message: "CV downloaded");
    } else if (kIsWeb) {
      // Web platform
      html.AnchorElement anchorElement = html.AnchorElement(href: cvUrl);
      anchorElement.download = "Waheed Ashraf resume";
      anchorElement.click();

      // File downloaded successfully

      showSnackBar(context,
          color: ColorPallet.mainPirpel, message: "CV downloaded");
    } else {
      // Unsupported platform

      showSnackBar(context,
          color: Colors.red, message: "Unsupported plateform");
    }
  } catch (e) {
    // Handle any errors during the download

    showSnackBar(context,
        color: Colors.red, message: "CV downloading Error $e");
  }
}
