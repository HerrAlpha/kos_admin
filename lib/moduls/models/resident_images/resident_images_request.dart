class ResidentImagesRequestModel {
  final String idUser;
  final String idResident;
  final String typePhoto;
  final String permission;

  ResidentImagesRequestModel({
    required this.idUser,
    required this.idResident,
    required this.typePhoto,
    required this.permission,
  });

  Map<String, dynamic> toJson() {
    return {
      'id_user': idUser,
      'id_resident': idResident,
      'type_photo': typePhoto,
      'permission': permission,
    };
  }
}
