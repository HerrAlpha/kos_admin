class LogoutsResponseModel {
  final String message;
  final String status;
  final String statusCode;
  final String data;

  LogoutsResponseModel({
    required this.message,
    required this.status,
    required this.statusCode,
    required this.data,
  });

  factory LogoutsResponseModel.fromJson(Map<String, dynamic> json) {
    return LogoutsResponseModel(
      message: json['message'],
      status: json['status'],
      statusCode: json['status_code'],
      data: json['data'],
    );
  }
}
