import 'package:jbbase_app/base/data/model/pretty_json_mixin.dart';

@JsonSerializable()
@Json(caseStyle: CaseStyle.snake, ignoreNullMembers: true)
class TokenModel with PrettyJsonMixin {
  @JsonProperty(name: 'token')
  String? token;

  @JsonProperty(name: 'account')
  String? account;
}

