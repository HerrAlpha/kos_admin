import 'package:get/get.dart';
import 'package:kos_admin/moduls/features/occupy/repositories/occupy_repository.dart';
import 'package:kos_admin/moduls/models/logins/logins_response.dart';
import 'package:kos_admin/moduls/models/occupies/occupies_request.dart';
import 'package:kos_admin/moduls/models/occupies/occupies_response.dart';
import 'package:kos_admin/shared/services/local_db.dart';

class OccupyController extends GetxController {
  RxList<Occupancy> occupiesList = <Occupancy>[].obs;

  @override
  void onInit() {
    super.onInit();
    listOccupy();
  }

  void listOccupy() async {
    String? idUser;
    UserModel? user;
    user = await LocalDBServices.getUser();
    idUser = user!.idUser;

    OccupiesRequestModel occupiesRequest = OccupiesRequestModel(idUser: idUser);

    print(occupiesRequest.toJson());

    try {
      var value =
          await OccupyRepository.getOccupyList(occupiesRequest.toJson());
      if (value!.statusCode == '200') {
        Get.snackbar('Success', 'Success');
        occupiesList.assignAll(value.data);
      } else {
        Get.snackbar('Failed', value.message);
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  List<ResidentOccupant> getResidentsByRoomIndex(int occupyIndex) {
    if (occupyIndex < 0 || occupyIndex >= occupiesList.length) {
      return []; // or throw an error if needed
    }
    return occupiesList[occupyIndex].residents;
  }

  @override
  void dispose() {
    listOccupy();
    super.dispose();
  }
}
