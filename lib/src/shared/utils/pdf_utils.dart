import 'dart:io';

import 'package:pdfx/pdfx.dart';

abstract class PdfUtils {
  static Future<PdfPageImage?> getImagePdfFromFile(File file) async {
    final document = await PdfDocument.openFile(file.path);

    final page = await document.getPage(1);

    final image = await page.render(
      width: page.width * 2,
      height: page.height * 2,
      format: PdfPageImageFormat.png,
    );

    return image;
  }

  static Future<int> getPagesCount(File file) async {
    final document = await PdfDocument.openFile(file.path);

    return document.pagesCount;
  }
}
