class SubscriptionsRequestModel {
  final String idUser;
  final String idOccupy;

  SubscriptionsRequestModel({required this.idUser, required this.idOccupy});

  Map<String, dynamic> toJson() {
    return {
      'id_user': idUser,
      'id_occupy': idOccupy,
    };
  }
}
