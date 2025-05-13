import 'package:tormenta20/src/shared/entities/play_mode.dart';

class Config {
  final int id;
  final PlayMode mode;
  final bool showApresetation;
  final bool enableBottomBackButton;
  final bool enableHomeTipes;

  Config({
    required this.id,
    required this.mode,
    required this.showApresetation,
    required this.enableBottomBackButton,
    required this.enableHomeTipes,
  });

  Config copyWithNewMode(PlayMode mode) {
    return Config(
      id: id,
      mode: mode,
      showApresetation: showApresetation,
      enableBottomBackButton: enableBottomBackButton,
      enableHomeTipes: enableHomeTipes,
    );
  }

  Config copyWithMarkedSee() {
    return Config(
      id: id,
      mode: mode,
      showApresetation: true,
      enableBottomBackButton: enableBottomBackButton,
      enableHomeTipes: enableHomeTipes,
    );
  }

  Config copyWithEnableBottomBackButton(bool enableBottomBackButton) {
    return Config(
      id: id,
      mode: mode,
      showApresetation: showApresetation,
      enableBottomBackButton: enableBottomBackButton,
      enableHomeTipes: enableHomeTipes,
    );
  }

  Config copyWithEnableHomeTypes(bool enableHomeTipes) {
    return Config(
      id: id,
      mode: mode,
      showApresetation: showApresetation,
      enableBottomBackButton: enableBottomBackButton,
      enableHomeTipes: enableHomeTipes,
    );
  }

  @override
  bool operator ==(other) =>
      other is Config &&
      other.id == id &&
      other.mode == mode &&
      other.showApresetation == showApresetation &&
      other.enableBottomBackButton == enableBottomBackButton;

  @override
  int get hashCode =>
      id.hashCode ^
      mode.hashCode ^
      showApresetation.hashCode ^
      enableBottomBackButton.hashCode;
}
