import '../../../../base/base.dart';
import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
@Json(caseStyle: CaseStyle.camel, ignoreNullMembers: true)
class FriendInformation {
  final String? account;
  final String? firstName;
  final String? lastName;
  final String? avatarUrl;

  FriendInformation({
    this.account,
    this.firstName,
    this.lastName,
    this.avatarUrl,
  });

  FriendInformation copyWith({
    String? account,
    String? firstName,
    String? lastName,
    String? avatarUrl,
  }) =>
      FriendInformation(
        account: account ?? this.account,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        avatarUrl: avatarUrl ?? this.avatarUrl,
      );
}
