import 'package:tormenta20/src/shared/entities/board/board.dart';

class AddEditBoardController {
  AddEditBoardController(Board? initialBoard) {}

  String? _bannerPath;
  void changeBannerPath(String? value) => _bannerPath = value;
}
