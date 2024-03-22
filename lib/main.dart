import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kos_admin/config/pages/app_pages.dart';
import 'package:kos_admin/config/routes/app_routes.dart';
import 'package:kos_admin/config/themes/app_theme.dart';
import 'package:kos_admin/constant/common/app_const.dart';

void main() {
  Get.testMode = true;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: AppConst.designSize,
      builder: (context, child) => GetMaterialApp(
        title: AppConst.appName,
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.startscreen,
        getPages: AppPages.getPages(),
        theme: AppTheme.mainTheme,
        builder: (context, child) => MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: child!,
        ),
      ),
    );
  }
}
