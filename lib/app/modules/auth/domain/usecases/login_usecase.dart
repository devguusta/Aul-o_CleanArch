import 'package:aulao_clean/app/modules/auth/domain/entities/logged_user.dart';
import 'package:aulao_clean/app/modules/auth/domain/repositories/auth_repository.dart';
import 'package:aulao_clean/app/modules/auth/domain/usecases/errors/errors.dart';
import 'package:dartz/dartz.dart';
import 'package:string_validator/string_validator.dart';

abstract class ILoginUseCase {
  Future<Either<AuthException, LoggedUser>> call(CredentialsParams params);
}

class LoginUseCase implements ILoginUseCase {
  final AuthRepository repository;

  LoginUseCase(this.repository);
  Future<Either<AuthException, LoggedUser>> call(
      CredentialsParams params) async {
    if (!isEmail(params.email)) {
      return Left(AuthException(message: 'Error email'));
    }
    if (params.password.isEmpty) {
      return Left(AuthException(message: 'Error password'));
    }
    return await repository.login(params);
  }
}

class CredentialsParams {
  final String email;
  final String password;
  CredentialsParams({
    required this.email,
    required this.password,
  });
}
// main(List<String> args) {
//   final usecase = LoginUseCase();
//   final result = await usecase();
//   result.fold((l) => {
//     print('error')
//   }, 
  
//   (r) {
//     print('setState');
//   });
// }
