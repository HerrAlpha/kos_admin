class SubscriptionAcceptionsResponseModel {
  final String status;
  final String message;
  final dynamic data;
  final String statusCode;

  SubscriptionAcceptionsResponseModel({
    required this.status,
    required this.message,
    required this.data,
    required this.statusCode,
  });

  factory SubscriptionAcceptionsResponseModel.fromJson(
      Map<String, dynamic> json) {
    return SubscriptionAcceptionsResponseModel(
      status: json['status'] ?? 'null',
      message: json['message'] ?? 'null',
      data: json['data'] ?? 'null',
      statusCode: json['status_code'] ?? 'null',
    );
  }
}
