import 'package:aulao_clean/app/modules/auth/domain/entities/logged_user.dart';
import 'package:aulao_clean/app/modules/auth/domain/usecases/errors/errors.dart';
import 'package:aulao_clean/app/modules/auth/domain/usecases/login_usecase.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<AuthException,LoggedUser>> login(CredentialsParams params);
}