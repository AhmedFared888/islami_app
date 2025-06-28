import 'package:flutter/material.dart';
import 'package:islami/core/resources/routes_manager.dart';
import 'package:islami/core/resources/theme_manager.dart';

void main() {
  runApp(Islami());
}

class Islami extends StatelessWidget {
  const Islami({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: RoutesManager.router,
      theme: getApptheme(),
    );
  }
}
