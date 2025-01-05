import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:tormenta20/src/core/database/app_database.dart';
import 'package:tormenta20/src/core/theme/theme.dart';
import 'package:tormenta20/src/modules/home/modules/magics/grimories_store.dart';
import 'package:tormenta20/src/modules/splash/splash_screen.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void dispose() {
    _disposeDependencies();
    super.dispose();
  }

  void _disposeDependencies() async {
    GetIt.I<AppDatabase>().close();
    GetIt.I<GrimoriesStore>().dispose();
    await GetIt.I.unregister<GrimoriesStore>();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tormenta20',
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: const SplashScreen(),
    );
  }
}
