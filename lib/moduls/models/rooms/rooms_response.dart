class Resident {
  final String id;
  final String fullName;
  final String phoneNumber;
  final String address;
  final String nik;

  Resident({
    required this.id,
    required this.fullName,
    required this.phoneNumber,
    required this.address,
    required this.nik,
  });

  factory Resident.fromJson(Map<String, dynamic> json) {
    return Resident(
      id: json['id_resident'] ?? 'null',
      fullName: json['full_name'] ?? 'null',
      phoneNumber: json['phone_number'] ?? 'null',
      address: json['address'] ?? 'null',
      nik: json['nik'] ?? 'null',
    );
  }
}

class Room {
  final String roomNumber;
  final String roomFloor;
  final String roomStatus;
  final String isDoubleBed;
  final String roomType;
  final String checkIn;
  final List<Resident> residents;

  Room({
    required this.roomNumber,
    required this.roomFloor,
    required this.roomStatus,
    required this.isDoubleBed,
    required this.roomType,
    required this.checkIn,
    required this.residents,
  });

  factory Room.fromJson(Map<String, dynamic> json) {
    return Room(
      roomNumber: json['room_number'] ?? 'null',
      roomFloor: json['room_floor'] ?? 'null',
      roomStatus: json['room_status'] ?? 'null',
      isDoubleBed: json['is_double_bed'] ?? 'null',
      roomType: json['room_type'] ?? 'null',
      checkIn: json['check_in'] ?? 'null',
      residents: (json['residents'] as List)
          .map((residentJson) => Resident.fromJson(residentJson))
          .toList(),
    );
  }
}

class RoomsResponseModel {
  final String status;
  final String message;
  final List<Room> data;
  final String statusCode;

  RoomsResponseModel({
    required this.status,
    required this.message,
    required this.data,
    required this.statusCode,
  });

  factory RoomsResponseModel.fromJson(Map<String, dynamic> json) {
    return RoomsResponseModel(
      status: json['status'] ?? 'null',
      message: json['message'] ?? 'null',
      data: (json['data'] as List)
          .map((roomJson) => Room.fromJson(roomJson))
          .toList(),
      statusCode: json['status_code'] ?? 'null',
    );
  }
}
