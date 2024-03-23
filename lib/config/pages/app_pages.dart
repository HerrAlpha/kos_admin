import 'package:get/get.dart';
import 'package:kos_admin/config/routes/app_routes.dart';
import 'package:kos_admin/moduls/features/login/views/ui/login_view.dart';
import 'package:kos_admin/moduls/features/main/views/main_home.dart';
import 'package:kos_admin/moduls/features/start_screen/views/ui/start_screen.dart';

class AppPages {
  AppPages._();

  static List<GetPage> getPages() {
    return [
      GetPage(
          name: AppRoutes.startscreen,
          page: () => const StartScreenView(),
          transition: Transition.fade),
      GetPage(
          name: AppRoutes.login,
          page: () => LoginView(),
          transition: Transition.fadeIn,
          transitionDuration: const Duration(seconds: 1)),
      GetPage(
          name: AppRoutes.main,
          page: () => const MainHome(),
          transition: Transition.fadeIn,
          transitionDuration: const Duration(seconds: 1)),
    ];
  }
}
