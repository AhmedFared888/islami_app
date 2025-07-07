import 'package:flutter/material.dart';
import 'package:islami/core/resources/assets_manager.dart';
import 'package:islami/core/resources/color_manager.dart';
import 'package:islami/core/resources/strings_manager.dart';
import 'package:islami/features/azkar/presentation/views/azkar_view.dart';
import 'package:islami/features/home/presentation/views/home_view.dart';
import 'package:islami/features/radio/presentation/views/radio_view.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeView(),
    const AzkarView(),
    const RadioView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: ColorManager.primaryColor,
        selectedItemColor: ColorManager.white,
        showUnselectedLabels: false,
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(AssetsManager.quranBook),
            label: StringsManager.quran,
          ),
          BottomNavigationBarItem(
            icon: Image.asset(AssetsManager.hadethBook),
            label: StringsManager.azkar,
          ),
          BottomNavigationBarItem(
            icon: Image.asset(AssetsManager.radioLogo),
            label: StringsManager.radio,
          ),
        ],
      ),
    );
  }
}
