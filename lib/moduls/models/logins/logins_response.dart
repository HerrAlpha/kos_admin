class UserModel {
  final String idUser;
  final String fullName;

  UserModel({required this.idUser, required this.fullName});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      idUser: json['id_user'],
      fullName: json['full_name'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id_user': idUser,
        'full_name': fullName,
      };
}

class LoginsResponseModel {
  final String status;
  final String message;
  final UserModel user;
  final String? statusCode;
  final String accessToken;

  LoginsResponseModel({
    required this.status,
    required this.message,
    required this.user,
    this.statusCode,
    required this.accessToken,
  });

  factory LoginsResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginsResponseModel(
      status: json['status'],
      message: json['message'],
      user: UserModel.fromJson(json['user']),
      statusCode: json['status_code'],
      accessToken: json['access_token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'user': user.toJson(),
      'status_code': statusCode,
      'access_token': accessToken,
    };
  }
}
