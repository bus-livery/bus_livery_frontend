final class EndPoints {
  static AuthEndPoint auth = AuthEndPoint();
  static ProfileEndPoints profile = ProfileEndPoints();
  static LiveryEndPoints livery = LiveryEndPoints();
  static BusTypeEndPoint busTypes = BusTypeEndPoint();
  static ReportEndPoint report = ReportEndPoint();
}

final class AuthEndPoint {
  final login = '/v1/auth/user-login';
  final createUser = '/v1/auth/create-user';
  final otpRegister = '/v1/auth/generate-otp';
}

final class ProfileEndPoints {
  final getMy = '/v1/profile/fetch-my';
  final updateMy = '/v1/profile/update';
}

final class LiveryEndPoints {
  final createLivery = '/v1/livery/create';
  final getAllLivery = '/v1/livery/fetch-all';
  final getMyLivery = '/v1/livery/fetch-my';
  final getOthersLivery = '/v1/livery/fetch-other';
  final getSingleLivery = '/v1/livery/fetch-single';
  final updateLivery = '/v1/livery/update';
  final deleteLivery = '/v1/livery/delete';
  final downloadLivery = '/v1/livery/download-count';
  final getDownloadedLivery = '/v1/livery/fetch-downloads';
}

final class BusTypeEndPoint {
  final getBusTypes = '/v1/bus/types';
}

final class ReportEndPoint {
  final reportContent = '/v1/report/content';
  final getReportReasons = '/v1/report/reasons';
}
