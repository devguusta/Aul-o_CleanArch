import 'package:aulao_clean/app/modules/auth/domain/entities/logged_user.dart';
import 'package:aulao_clean/app/modules/auth/domain/usecases/login_usecase.dart';

abstract class AuthDatasource {
  Future<LoggedUser> login(CredentialsParams params);
}