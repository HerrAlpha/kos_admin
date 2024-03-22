import 'package:get/get.dart';
import 'package:kos_admin/config/routes/app_routes.dart';
import 'package:kos_admin/moduls/features/login/views/ui/login_view.dart';
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
        page: () => const LoginView(),
      )
    ];
  }
}
