import 'package:aulao_clean/app/modules/auth/domain/usecases/login_usecase.dart';
import 'package:aulao_clean/app/modules/auth/domain/entities/logged_user.dart';
import 'package:aulao_clean/app/modules/auth/infra/datasources/auth_datasource.dart';

class AuthApi implements AuthDatasource {
  @override
  Future<LoggedUser> login(CredentialsParams params) async {
    return LoggedUser(name: 'Jacob', email: 'jacob@flutterando.com');
  }
}
