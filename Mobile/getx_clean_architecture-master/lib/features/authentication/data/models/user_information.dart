import '../../../../base/base.dart';

@JsonSerializable()
@Json(caseStyle: CaseStyle.camel, ignoreNullMembers: true)
class UserInformation {
  final String? account;
  final String? password;
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? avatarUrl;
  final String? username;
  final List<dynamic>? authorities;
  final bool? enabled;
  final bool? accountNonExpired;
  final bool? accountNonLocked;
  final bool? credentialsNonExpired;

  UserInformation({
    this.account,
    this.password,
    this.email,
    this.firstName,
    this.lastName,
    this.avatarUrl,
    this.username,
    this.authorities,
    this.enabled,
    this.accountNonExpired,
    this.accountNonLocked,
    this.credentialsNonExpired,
  });

  UserInformation copyWith({
    String? account,
    String? password,
    String? email,
    String? firstName,
    String? lastName,
    String? avatarUrl,
    String? username,
    List<dynamic>? authorities,
    bool? enabled,
    bool? accountNonExpired,
    bool? accountNonLocked,
    bool? credentialsNonExpired,
  }) =>
      UserInformation(
        account: account ?? this.account,
        password: password ?? this.password,
        email: email ?? this.email,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        avatarUrl: avatarUrl ?? this.avatarUrl,
        username: username ?? this.username,
        authorities: authorities ?? this.authorities,
        enabled: enabled ?? this.enabled,
        accountNonExpired: accountNonExpired ?? this.accountNonExpired,
        accountNonLocked: accountNonLocked ?? this.accountNonLocked,
        credentialsNonExpired: credentialsNonExpired ?? this.credentialsNonExpired,
      );
}
