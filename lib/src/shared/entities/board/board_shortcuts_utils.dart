import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/src/shared/entities/board/board_shortcut_types.dart';

abstract class BoardShortcutsUtils {
  static IconData handleIcon(BoardShortcutsType type, String url) {
    if (type == BoardShortcutsType.whats) {
      return FontAwesomeIcons.whatsapp;
    } else if (type == BoardShortcutsType.discord) {
      return FontAwesomeIcons.discord;
    } else if (type == BoardShortcutsType.telegran) {
      return FontAwesomeIcons.solidPaperPlane;
    } else {
      if (url.contains('drive')) {
        return FontAwesomeIcons.googleDrive;
      } else if (url.contains('dropbox')) {
        return FontAwesomeIcons.dropbox;
      } else {
        return FontAwesomeIcons.solidFolderClosed;
      }
    }
  }

  static String handleLabel(BoardShortcutsType type) {
    if (type == BoardShortcutsType.whats) {
      return 'Grupo do WhatsApp';
    } else if (type == BoardShortcutsType.discord) {
      return 'Servidor do Discord';
    } else if (type == BoardShortcutsType.telegran) {
      return 'Grupo do Telegram';
    } else {
      return 'Pasta de arquivos online';
    }
  }
}
