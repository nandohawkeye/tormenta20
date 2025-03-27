// ignore_for_file: use_build_context_synchronously
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:tormenta20/src/core/database/app_database.dart';
import 'package:tormenta20/src/modules/home/home_screen.dart';
import 'package:tormenta20/src/modules/home/modules/init/init_store.dart';
import 'package:tormenta20/src/modules/home/modules/intro/intro_screen.dart';
import 'package:tormenta20/src/modules/home/modules/magics/grimories_store.dart';
import 'package:tormenta20/src/shared/config/config_store.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    _initDependencies();
  }

  void _initDependencies() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      GetIt getIt = GetIt.instance;
      getIt.registerSingleton<AppDatabase>(AppDatabase());

      getIt.registerSingletonAsync<ConfigStore>(ConfigStore().init);

      await getIt.allReady();

      final showApresetation = getIt<ConfigStore>().config?.showApresetation;

      if (showApresetation == null) return;

      if (showApresetation) {
        getIt.registerSingleton<FilePicker>(FilePicker.platform);

        getIt.registerSingletonAsync<PackageInfo>(PackageInfo.fromPlatform);

        getIt.registerSingletonAsync<GrimoriesStore>(GrimoriesStore().init);

        getIt.registerSingletonAsync<InitStore>(InitStore().init);

        await getIt.allReady();

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => const HomeScreen(),
          ),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => const IntroScreen(),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Material();
  }
}
