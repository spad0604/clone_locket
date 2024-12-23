import 'package:jbbase_app/base/data/model/pretty_json_mixin.dart';

@jsonSerializable
@Json(caseStyle: CaseStyle.snake, ignoreNullMembers: true, name: 'data')
class TokenModel with PrettyJsonMixin {
  @JsonProperty(name: ['token', 'account'])
  String? accessToken;

  String? account;
}
