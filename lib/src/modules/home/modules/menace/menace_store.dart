import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:tormenta20/src/core/database/app_database.dart';
import 'package:tormenta20/src/shared/entities/menace.dart';

class MenaceStore extends ChangeNotifier {
  MenaceStore(Menace initial) {
    _menace = initial;
    _setSub(initial.uuid);
  }

  StreamSubscription? _subMenace;

  void _setSub(String uuid) async {
    await GetIt.I<AppDatabase>().menaceDAO.watchMenace(uuid).then((resp) {
      if (resp.menace != null) {
        _subMenace ??= resp.menace!.listen((result) {
          if (result != null) {
            changeMenace(result);
          }
        });
      }
    });
  }

  late Menace _menace;
  Menace get menace => _menace;
  void changeMenace(Menace value) {
    _menace = value;
    notifyListeners();
  }

  @override
  void dispose() {
    _subMenace?.cancel();
    _subMenace = null;
    super.dispose();
  }
}
