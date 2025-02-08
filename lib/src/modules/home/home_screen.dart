import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tormenta20/src/modules/home/home_screen_store.dart';
import 'package:tormenta20/src/modules/home/modules/about/about_screen.dart';
import 'package:tormenta20/src/modules/home/modules/init/init_screen.dart';
import 'package:tormenta20/src/modules/home/modules/magics/magics_screen.dart';
import 'package:tormenta20/src/shared/widgets/app_logo.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, this.initialIndex = 0});

  final int initialIndex;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final HomeScreenStore _store;

  static const _pages = <Widget>[
    InitScreen(),
    MagicsScreen(),
    AboutScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _store = HomeScreenStore();
  }

  @override
  void dispose() {
    _store.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _store,
        builder: (_, __) {
          return Scaffold(
            appBar: AppBar(
              title: const AppLogo(
                height: 42,
                width: 180,
              ),
            ),
            body: _pages[_store.index],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: _store.index,
              showUnselectedLabels: false,
              showSelectedLabels: false,
              onTap: _store.changeIndex,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.diceD20),
                  label: 'Inicio',
                ),
                BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.hatWizard),
                  label: 'Magias',
                ),
                BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.gear),
                  label: 'Sobre',
                ),
              ],
            ),
          );
        });
  }
}
