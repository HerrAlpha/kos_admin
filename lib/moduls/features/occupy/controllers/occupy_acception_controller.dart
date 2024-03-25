import 'package:get/get.dart';
import 'package:kos_admin/moduls/features/occupy/controllers/occupy_controller.dart';
import 'package:kos_admin/moduls/features/occupy/repositories/occupy_acception_repository.dart';
import 'package:kos_admin/moduls/models/logins/logins_response.dart';
import 'package:kos_admin/moduls/models/occupy_accpetions/occupy_accpetions_request.dart';
import 'package:kos_admin/shared/services/local_db.dart';

class OccupyAcceptionController extends GetxController {
  final OccupyController occupyController = Get.put(OccupyController());
  void acceptOccupy(String idOccupy, String statusOccupy) async {
    String? idUser;
    UserModel? user;
    user = await LocalDBServices.getUser();
    idUser = user!.idUser;

    OccupyAcceptionsRequestModel occupiesAcceptionRequest =
        OccupyAcceptionsRequestModel(
      idUser: idUser,
      idOccupy: idOccupy,
      statusOccupy: statusOccupy,
    );

    print(occupiesAcceptionRequest.toJson());

    try {
      var value = await OccupyAcceptionRepository.getOccupyList(
          occupiesAcceptionRequest.toJson());
      if (value!.statusCode == '201') {
        Get.snackbar('Success', 'Success');
        occupyController.onInit();
      } else {
        Get.snackbar('Failed', value.message);
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }
}
