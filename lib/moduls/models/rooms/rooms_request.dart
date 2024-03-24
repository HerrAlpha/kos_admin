class RoomsRequestModel {
  final String idUser;
  final String roomFloor;

  RoomsRequestModel({
    required this.idUser,
    required this.roomFloor,
  });

  Map<String, dynamic> toJson() {
    return {
      'id_user': idUser,
      'room_floor': roomFloor,
    };
  }
}
