import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import '../../../controllers/main_controller.dart';

class MainLayout extends GetView<MainController> {
  final Widget child;
  final String? title;
  final FloatingActionButton? fab;
  const MainLayout({
    this.title,
    Key? key,
    required this.child,
    this.fab,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(child: child),
          ],
        ),
      ),
    );
  }
}
