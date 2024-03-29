import 'package:get/get.dart';
import 'package:kos_admin/moduls/features/logout/repositories/logout_repository.dart';
import 'package:kos_admin/moduls/models/logins/logins_response.dart';
import 'package:kos_admin/moduls/models/logouts/logouts_request.dart';
import 'package:kos_admin/shared/services/local_db.dart';

class LogoutController extends GetxController {
  void logout() async {
    String? idUser;
    UserModel? user;
    user = await LocalDBServices.getUser();
    idUser = user!.idUser;

    LogoutsRequestModel logoutsRequestModel = LogoutsRequestModel(
      idUser: idUser,
    );

    LogoutRepository.logout(logoutsRequestModel.toJson()).then((value) {
      if (value!.statusCode == '200') {
        Get.snackbar('Logout Success', 'Goodbye ${user!.fullName}');
        LocalDBServices.clearToken();
        LocalDBServices.clearUser();
        Get.offAllNamed('/login');
      } else {
        Get.snackbar('Logout Failed', value.message);
      }
    }).catchError((e) {
      Get.snackbar('Error', e.toString());

      LocalDBServices.clearToken();
      LocalDBServices.clearUser();
      LocalDBServices.removeUUID();
    });
  }
}
