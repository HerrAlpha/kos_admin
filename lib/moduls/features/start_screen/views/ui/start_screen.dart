import 'package:flutter/material.dart';
import 'package:kos_admin/config/themes/colours.dart';
import 'package:get/get.dart';
import 'package:kos_admin/moduls/features/start_screen/controllers/splash_controller.dart';

class StartScreenView extends StatelessWidget {
  const StartScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
        init: SplashController(),
        builder: (controller) {
          return const Scaffold(
            backgroundColor: Colours.greenPrimary,
          );
        });
  }
}
