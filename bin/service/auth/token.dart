import 'dart:convert';

import 'package:crypto/crypto.dart';

class Token {
  String secret = '';

  Token() {
    secret = 'pDxKv4RQiPFbx2B96qGTdlaBsSbn7Sqn';
  }

  String generateToken(String email) {
    String emailEncoded = base64.encode(utf8.encode(email));
    return '$emailEncoded.${sha512.convert(utf8.encode(secret + email))}';
  }

  bool isValid(String token) {
    final parts = token.split('.');

    if (parts.length != 2) {
      return false;
    }

    final email = utf8.decode(base64.decode(parts[0]));
    return generateToken(email) == token;
  }
}
