import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';
import 'package:tormenta20/src/core/database/app_database.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/modules/about/about_store.dart';
import 'package:tormenta20/src/modules/home/modules/init/init_store.dart';
import 'package:tormenta20/src/modules/home/modules/magics/grimories_store.dart';
import 'package:tormenta20/src/modules/splash/splash_screen.dart';
import 'package:tormenta20/src/shared/config/config_store.dart';

void main() {
  applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp]);
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _disposeDependencies();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.detached) {
      _disposeDependencies();
    }
  }

  void _disposeDependencies() async {
    GetIt.I<AppDatabase>().close();
    GetIt.I<AboutStore>().dispose();
    GetIt.I<InitStore>().dispose();
    GetIt.I<GrimoriesStore>().dispose();
    GetIt.I<ConfigStore>().dispose();
    await GetIt.I.unregister<GrimoriesStore>();
    await GetIt.I.unregister<AboutStore>();
    await GetIt.I.unregister<InitStore>();
    await GetIt.I.unregister<ConfigStore>();
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context)
          .copyWith(textScaler: const TextScaler.linear(1)),
      child: MaterialApp(
        title: 'Tormenta20',
        debugShowCheckedModeBanner: false,
        theme: theme,
        home: const SplashScreen(),
      ),
    );
  }
}
