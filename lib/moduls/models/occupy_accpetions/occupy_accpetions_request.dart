class OccupyAcceptionsRequestModel {
  final String idUser;
  final String idOccupy;
  final String statusOccupy;

  OccupyAcceptionsRequestModel({
    required this.idUser,
    required this.idOccupy,
    required this.statusOccupy,
  });

  Map<String, dynamic> toJson() {
    return {
      'id_user': idUser,
      'id_occupy': idOccupy,
      'status_occupy': statusOccupy,
    };
  }
}
