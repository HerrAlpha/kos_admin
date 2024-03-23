class LoginsRequestModel {
  final String username;
  final String password;

  LoginsRequestModel({required this.username, required this.password});

  factory LoginsRequestModel.fromJson(Map<String, dynamic> json) =>
      LoginsRequestModel(
          username: json["username"], password: json["password"]);

  Map<String, dynamic> toJson() => {"username": username, "password": password};
}
