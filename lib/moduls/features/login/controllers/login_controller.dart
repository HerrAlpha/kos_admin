import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kos_admin/moduls/features/login/repositories/login_repository.dart';
import 'package:kos_admin/moduls/models/logins/logins_request.dart';
import 'package:kos_admin/moduls/models/logins/logins_response.dart';
import 'package:kos_admin/shared/services/local_db.dart';

class LoginController extends GetxController {
  RxBool isSecure = true.obs;
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  RxBool isUsernameFilled = true.obs;
  RxBool isPasswordFilled = true.obs;

  void changeSecure() {
    isSecure.value = !isSecure.value;
  }

  void login() async {
    LoginsRequestModel loginRequest = LoginsRequestModel(
      username: usernameController.text,
      password: passwordController.text,
    );

    LoginsResponseModel loginsResponseModel =
        await LoginRepository.login(loginRequest.toJson());

    if (loginsResponseModel.statusCode == '201') {
      LocalDBServices.setUser(loginsResponseModel.user);
      LocalDBServices.setToken(loginsResponseModel.accessToken);
      Get.offAllNamed('/main');
      // empty all text field
      usernameController.clear();
      passwordController.clear();
      Get.snackbar(
          'Login Success', 'Welcome ${loginsResponseModel.user.fullName}');
    } else {
      Get.snackbar('Login Failed', loginsResponseModel.message);
    }
  }
}
