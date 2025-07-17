import 'package:flutter/widgets.dart';

class ListTileModel {
  final Widget? leading;
  final Widget? title;
  final Widget? trailing;
  final VoidCallback? onTap;
  final String? routeName;
  ListTileModel({
    required this.leading,
    required this.title,
    required this.trailing,
    required this.onTap,
    required this.routeName,
  });
}
