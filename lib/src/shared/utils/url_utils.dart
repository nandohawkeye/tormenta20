import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';

abstract class UrlUtils {
  static bool isValid(String url) {
    Uri? uri = Uri.tryParse(url);
    if (uri == null || !uri.hasScheme || !uri.hasAuthority) {
      if (kDebugMode) {
        print("URL inválida: $url");
      }
      return false;
    } else {
      if (kDebugMode) {
        print("URL válida: $url");
      }
      return true;
    }
  }

  static Future<void> lauch(String url) async {
    final clearUrl =
        url.replaceAll('https:', '').replaceAll('http:', '').trim();
    await canLaunchUrl(Uri.parse('https:$clearUrl')).then(
      (bool canLauch) async {
        print('can lauch: $canLauch - url: $url');
        if (canLauch) {
          return await launchUrl(
            Uri.parse('https:$clearUrl'),
            mode: LaunchMode.externalApplication,
          ).then((value) => value);
        }
      },
    );
  }
}
