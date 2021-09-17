import 'package:aulao_clean/app/modules/auth/domain/entities/logged_user.dart';
import 'package:aulao_clean/app/modules/auth/domain/repositories/auth_repository.dart';
import 'package:aulao_clean/app/modules/auth/infra/datasources/auth_datasource.dart';
import 'package:dartz/dartz.dart';
import 'package:aulao_clean/app/modules/auth/domain/usecases/login_usecase.dart';
import 'package:aulao_clean/app/modules/auth/domain/usecases/errors/errors.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDatasource datasource;

  AuthRepositoryImpl(this.datasource);
  @override
  Future<Either<AuthException, LoggedUser>> login(
      CredentialsParams params) async {
    try {
      final user = await datasource.login(params);
      return Right(user);
    } on AuthException catch (e) {
      return Left(AuthException(message: 'Repository Error'));
    } on Exception catch (e) {
      return Left(AuthException(message: 'Exception error'));
    }
  }
}
