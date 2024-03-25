class OccupyAcceptionsResponseModel {
  final String statusCode;
  final String message;
  final String status;
  final String data;

  OccupyAcceptionsResponseModel({
    required this.statusCode,
    required this.message,
    required this.status,
    required this.data,
  });

  factory OccupyAcceptionsResponseModel.fromJson(Map<String, dynamic> json) {
    return OccupyAcceptionsResponseModel(
      statusCode: json['status_code'] ?? 'null',
      message: json['message'] ?? 'null',
      status: json['status'] ?? 'null',
      data: json['data'] ?? 'null',
    );
  }
}
