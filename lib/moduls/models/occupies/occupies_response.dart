class ResidentOccupant {
  final String id;
  final String fullName;
  final String phoneNumber;
  final String address;
  final String nik;

  ResidentOccupant({
    required this.id,
    required this.fullName,
    required this.phoneNumber,
    required this.address,
    required this.nik,
  });

  factory ResidentOccupant.fromJson(Map<String, dynamic> json) {
    return ResidentOccupant(
      id: json['id_resident'] ?? 'null',
      fullName: json['full_name'] ?? 'null',
      phoneNumber: json['phone_number'] ?? 'null',
      address: json['address'] ?? 'null',
      nik: json['nik'] ?? 'null',
    );
  }
}

class Occupancy {
  final String idOccupy;
  final String roomNumber;
  final String roomFloor;
  final String orderDate;
  final String checkInDate;
  final String checkOutDate;
  final String status;
  final List<ResidentOccupant> residents;

  Occupancy({
    required this.idOccupy,
    required this.roomNumber,
    required this.roomFloor,
    required this.orderDate,
    required this.checkInDate,
    required this.checkOutDate,
    required this.status,
    required this.residents,
  });

  factory Occupancy.fromJson(Map<String, dynamic> json) {
    return Occupancy(
      idOccupy: json['id_occupy'] ?? 'null',
      roomNumber: json['room_number'] ?? 'null',
      roomFloor: json['room_floor'] ?? 'null',
      orderDate: json['order_date'] ?? 'null',
      checkInDate: json['check_in_date'] ?? 'null',
      checkOutDate: json['check_out_date'] ?? 'null',
      status: json['status_occupy'] ?? 'null',
      residents: (json['residents'] as List)
          .map((residentJson) => ResidentOccupant.fromJson(residentJson))
          .toList(),
    );
  }
}

class OccupiesResponseModel {
  final String status;
  final String message;
  final List<Occupancy> data;
  final String statusCode;

  OccupiesResponseModel({
    required this.status,
    required this.message,
    required this.data,
    required this.statusCode,
  });

  factory OccupiesResponseModel.fromJson(Map<String, dynamic> json) {
    return OccupiesResponseModel(
      status: json['status'] ?? 'null',
      message: json['message'] ?? 'null',
      data: (json['data'] as List)
          .map((occupancyJson) => Occupancy.fromJson(occupancyJson))
          .toList(),
      statusCode: json['status_code'] ?? 'null',
    );
  }
}
