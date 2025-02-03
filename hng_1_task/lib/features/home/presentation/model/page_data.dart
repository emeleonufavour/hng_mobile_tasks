import 'package:flutter/material.dart';
import 'package:hng_1_task/utils/utils.dart';

enum PageType {
  decrypt,
  encrypt;

  Future<String> Function(String text, String password) get onTap {
    return (text, password) async {
      switch (this) {
        case PageType.encrypt:
          final encryptedText =
              await EncryptionHelper.getEncryptedMessage(text, password);
          return encryptedText;

        case PageType.decrypt:
          final decryptedText =
              await DecryptionHelper.getDecryptedMessage(text, password);
          return decryptedText;
      }
    };
  }
}

class PageData {
  final String? title;
  final PageType type;
  final FocusNode textFocus;
  final FocusNode passwordFocus;
  final TextEditingController textCtr;
  final TextEditingController passwordCtr;
  final Color bgColor;
  final Color textColor;

  const PageData({
    this.title,
    required this.type,
    this.bgColor = Colors.white,
    this.textColor = Colors.black,
    required this.textFocus,
    required this.passwordFocus,
    required this.textCtr,
    required this.passwordCtr,
  });
}
