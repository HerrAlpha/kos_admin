import 'package:flutter/material.dart';
import 'package:kos_admin/component/buttons.dart';
import 'package:kos_admin/config/themes/app_theme.dart';
import 'package:kos_admin/config/themes/colours.dart';
import 'package:kos_admin/moduls/features/login/controllers/login_controller.dart';
import 'package:get/get.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
        width: 400,
        height: 450,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colours.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colours.grey1.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Text(
                'Login',
                style: AppTheme.mainTheme.textTheme.displayLarge!
                    .copyWith(fontSize: 30),
              ),
              const SizedBox(height: 20),
              Obx(() => TextField(
                    controller: controller.usernameController,
                    style: AppTheme.mainTheme.textTheme.bodyMedium!.copyWith(
                      fontSize: 15,
                    ),
                    decoration: InputDecoration(
                      focusColor: Colours.greenPrimary,
                      fillColor: Colours.greenPrimary1,
                      prefixIcon: const Icon(Icons.person),
                      hintText: 'Username',
                      labelText: 'Username',
                      errorText: !controller.isUsernameFilled.value
                          ? 'Username is required'
                          : null,
                    ),
                  )),
              const SizedBox(height: 20),
              Obx(() => TextField(
                    controller: controller.passwordController,
                    obscureText: controller.isSecure.value,
                    style: AppTheme.mainTheme.textTheme.bodyMedium!.copyWith(
                      fontSize: 15,
                    ),
                    decoration: InputDecoration(
                      focusColor: Colours.greenPrimary,
                      fillColor: Colours.greenPrimary1,
                      prefixIcon: const Icon(Icons.lock),
                      hintText: 'Password',
                      labelText: 'Password',
                      errorText: !controller.isPasswordFilled.value
                          ? 'Password is required'
                          : null,
                      suffixIcon: IconButton(
                        onPressed: () {
                          controller.changeSecure();
                        },
                        icon: Icon(controller.isSecure.value
                            ? Icons.visibility_off
                            : Icons.visibility),
                      ),
                    ),
                  )),
              const SizedBox(height: 20),
              ButtonComponent(
                  onTap: () {
                    controller.isUsernameFilled.value =
                        controller.usernameController.text.isEmpty
                            ? false
                            : true;
                    controller.isPasswordFilled.value =
                        controller.passwordController.text.isEmpty
                            ? false
                            : true;
                    controller.login();
                  },
                  text: 'Login',
                  color: Colours.greenPrimary)
            ],
          ),
        ),
      )),
    );
  }
}
