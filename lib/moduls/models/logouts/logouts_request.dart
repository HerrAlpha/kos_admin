class LogoutsRequestModel {
  final String idUser;

  LogoutsRequestModel({
    required this.idUser,
  });

  Map<String, dynamic> toJson() {
    return {
      'id_user': idUser,
    };
  }
}
