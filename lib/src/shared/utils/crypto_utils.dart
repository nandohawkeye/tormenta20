import 'dart:convert';
import 'package:crypto/crypto.dart';

abstract class CryptoUtils {
  static String generateSha256(String text) {
    return sha256.convert(utf8.encode(text)).toString();
  }
}
