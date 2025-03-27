import 'package:flutter/material.dart';
import 'package:tormenta20/src/shared/config/config_starage_service.dart';
import 'package:tormenta20/src/shared/entities/config.dart';
import 'package:tormenta20/src/shared/entities/play_mode.dart';

class ConfigStore extends ChangeNotifier {
  final _storageService = ConfigStarageService();

  Future<ConfigStore> init() async {
    await _storageService.getConfig().then((resp) {
      _putConfig(resp.config);
    });

    return this;
  }

  Config? _config;
  Config? get config => _config;
  void _putConfig(Config? value) {
    _config = value;
    notifyListeners();
  }

  void changeConfigMode(PlayMode mode) async {
    final upConfig = _config?.copyWithNewMode(mode);

    if (upConfig == null) return;

    final failure = await _storageService.updateConfig(upConfig);

    if (failure == null) _putConfig(upConfig);
  }

  void markShowApresentation() async {
    if (_config == null) return;

    final upConfig = _config!.copyWithMarkedSee();

    final failure = await _storageService.updateConfig(upConfig);

    if (failure == null) _putConfig(upConfig);
  }

  void changeEnableBackButton(bool value) async {
    final upConfig = _config?.copyWithEnableBottomBackButton(value);

    if (upConfig == null) return;

    final failure = await _storageService.updateConfig(upConfig);

    if (failure == null) _putConfig(upConfig);
  }
}
