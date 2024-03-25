class OccupiesRequestModel {
  final String idUser;

  OccupiesRequestModel({
    required this.idUser,
  });

  Map<String, dynamic> toJson() {
    return {
      'id_user': idUser,
    };
  }
}
