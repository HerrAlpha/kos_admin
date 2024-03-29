class InvoiceImagesRequest {
  final String idUser;
  final String idSubscription;

  InvoiceImagesRequest({
    required this.idUser,
    required this.idSubscription,
  });

  Map<String, dynamic> toJson() {
    return {
      'id_user': idUser,
      'id_subscription': idSubscription,
    };
  }
}
