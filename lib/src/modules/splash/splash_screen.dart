// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:tormenta20/src/core/database/app_database.dart';
import 'package:tormenta20/src/modules/home/home_screen.dart';
import 'package:tormenta20/src/shared/widgets/app_logo.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _init();
  }

  void _init() async {
    GetIt getIt = GetIt.instance;
    getIt.registerSingleton<AppDatabase>(AppDatabase());
    Future.delayed(const Duration(seconds: 1)).then((_) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => const HomeScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 0, elevation: 0),
      body: const Center(
        child: AppLogo(width: 250),
      ),
    );
  }
}
