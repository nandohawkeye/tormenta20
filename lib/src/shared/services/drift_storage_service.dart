import 'package:get_it/get_it.dart';
import 'package:tormenta20/src/core/database/app_database.dart';
import 'package:tormenta20/src/shared/services/i_local_storage_service.dart';

class DriftStorageService extends ILocalStorageService<AppDatabase> {
  DriftStorageService() : super(GetIt.I<AppDatabase>());
}
