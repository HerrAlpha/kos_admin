class SubscriptionAcceptionsRequestModel {
  final String idUser;
  final String idSubscription;
  final String subscriptionStatus;

  SubscriptionAcceptionsRequestModel({
    required this.idUser,
    required this.idSubscription,
    required this.subscriptionStatus,
  });

  Map<String, dynamic> toJson() {
    return {
      'id_user': idUser,
      'id_subscription': idSubscription,
      'subscription_status': subscriptionStatus,
    };
  }
}
