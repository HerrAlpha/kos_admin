class ApiConst {
  ApiConst._();

  static const String baseUrl = 'https://kos.brotani.com/api/v1/admin/';

  //* Auth
  static const String login = 'auth/login';
  static const String logout = 'auth/logout';

  //* Room
  static const String listRoom = 'room/list';

  //* Occupy
  static const String listOccupy = 'occupy/list';
  static const String occupyAcception = 'occupy/acception';

  //* Subscription
  static const String listSubscription = 'subscription/list';
  static const String subscriptionAcception = 'subscription/acception';
  static const String invoiceImage = 'subscription/invoice-image';

  //* Resident
  static const String imageResident = 'image/resident';
}
