import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../models/token_model.dart';

part 'auth_api.g.dart';

@RestApi(parser: Parser.DartJsonMapper)
abstract class AuthAPI {
  factory AuthAPI(Dio dioBuilder) = _AuthAPI;

  @POST('/register')
  Future<void> registerWithEmail(@Body() EmailPasswordRequest request);

  @POST('/auth/login')
  Future<TokenModel> loginWithEmail(@Body() EmailPasswordRequest request);

  @POST('/reset-password')
  Future<void> resetPassword(@Field() String email);
}

class EmailPasswordRequest {
  final String account;
  final String password;

  EmailPasswordRequest(this.account, this.password);

  Map<String, dynamic> toJson() => <String, dynamic>{
        'account': account,
        'password': password,
      };
}
