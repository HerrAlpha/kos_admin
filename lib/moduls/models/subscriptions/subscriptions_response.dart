class SubscriptionData {
  final String idSubscription;
  final String status;
  final String startDate;
  final String endDate;
  final String grandTotal;

  SubscriptionData({
    required this.idSubscription,
    required this.status,
    required this.startDate,
    required this.endDate,
    required this.grandTotal,
  });

  factory SubscriptionData.fromJson(Map<String, dynamic> json) {
    return SubscriptionData(
      idSubscription: json['id_subscription'] ?? 'null',
      status: json['subscription_status'] ?? 'null',
      startDate: json['subscription_start_date'] ?? 'null',
      endDate: json['subscription_end_date'] ?? 'null',
      grandTotal: json['grand_total'] ?? 'null',
    );
  }
}

class SubscriptionsResponseModel {
  final String status;
  final String message;
  final List<SubscriptionData> data;
  final String statusCode;

  SubscriptionsResponseModel({
    required this.status,
    required this.message,
    required this.data,
    required this.statusCode,
  });

  factory SubscriptionsResponseModel.fromJson(Map<String, dynamic> json) {
    return SubscriptionsResponseModel(
      status: json['status'] ?? 'null',
      message: json['message'] ?? 'null',
      data: (json['data'] as List)
          .map(
              (subscriptionJson) => SubscriptionData.fromJson(subscriptionJson))
          .toList(),
      statusCode: json['status_code'] ?? 'null',
    );
  }
}
