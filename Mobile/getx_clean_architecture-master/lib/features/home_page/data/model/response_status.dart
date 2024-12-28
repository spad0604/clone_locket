import '../../../../base/base.dart';

@jsonSerializable
@Json(ignoreNullMembers: true)
class StatusResponse {
  final int? statusCode;
  final String? message;

  StatusResponse({
    this.statusCode,
    this.message,
  });

  StatusResponse copyWith({
    int? statusCode,
    String? message,
  }) =>
      StatusResponse(
        statusCode: statusCode ?? this.statusCode,
        message: message ?? this.message,
      );
}
