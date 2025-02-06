import 'package:flutter/foundation.dart';

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
}
