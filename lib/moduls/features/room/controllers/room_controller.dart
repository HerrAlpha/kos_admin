import 'package:get/get.dart';
import 'package:kos_admin/moduls/features/room/repositories/room_repository.dart';
import 'package:kos_admin/moduls/models/logins/logins_response.dart';
import 'package:kos_admin/moduls/models/rooms/rooms_request.dart';
import 'package:kos_admin/moduls/models/rooms/rooms_response.dart';
import 'package:kos_admin/shared/services/local_db.dart';

class RoomController extends GetxController {
  RxList<Room> roomsList = <Room>[].obs;
  RxString roomFloor = 'all'.obs;

  @override
  void onInit() {
    super.onInit();
    listRoom();
  }

  void listRoom() async {
    String? idUser;
    UserModel? user;
    user = await LocalDBServices.getUser();
    idUser = user!.idUser;

    RoomsRequestModel roomsRequestModel = RoomsRequestModel(
      idUser: idUser,
      roomFloor: roomFloor.value,
    );

    print(roomsRequestModel.toJson());

    try {
      var value = await RoomRepository.getRooms(roomsRequestModel.toJson());
      if (value!.statusCode == '200') {
        Get.snackbar('Success', 'Success');
        roomsList.assignAll(value.data);
      } else {
        Get.snackbar('Failed', value.message);
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  List<Resident> getResidentsByRoomIndex(int roomIndex) {
    if (roomIndex < 0 || roomIndex >= roomsList.length) {
      return []; // or throw an error if needed
    }
    return roomsList[roomIndex].residents;
  }

  // add dispose to avoid memory leak
  @override
  void dispose() {
    listRoom();
    super.dispose();
  }
}
