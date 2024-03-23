// import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:kos_admin/shared/services/local_db.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds: 3), () {
      logincheck();
    });
  }

  Future<void> logincheck() async {
    String? login;
    login = await LocalDBServices.getToken();
    if (login == null) {
      Get.toNamed('/login');
    } else {
      Get.toNamed('/main');
    }
  }
}
