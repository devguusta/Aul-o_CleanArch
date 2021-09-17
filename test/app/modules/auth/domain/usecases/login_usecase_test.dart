import 'package:aulao_clean/app/modules/auth/domain/entities/logged_user.dart';
import 'package:aulao_clean/app/modules/auth/domain/repositories/auth_repository.dart';
import 'package:aulao_clean/app/modules/auth/domain/usecases/errors/errors.dart';
import 'package:aulao_clean/app/modules/auth/domain/usecases/login_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';

class AuthRepositoryMock implements AuthRepository {
  @override
  Future<Either<AuthException, LoggedUser>> login(
      CredentialsParams params) async {
    if (params.password == '1234') {
      return Left(AuthException(message: 'repository erro'));
    }
    return Right(LoggedUser(email: params.email, name: 'Jacob'));
  }
}

void main() {
  final repository = AuthRepositoryMock();
  final useCase = LoginUseCase(repository);
  test('Should login ...', () async {
    final result = await useCase(
        CredentialsParams(email: 'jacob@flutterando.com', password: '123'));
    expect(result.isRight(), true);
    expect(
        result.getOrElse(
            () => LoggedUser(email: '', name: '')).name,
        'Jacob');
  
  });
  test('deve dar erro quando o email for inválido', () async{
    final result = await useCase(
      CredentialsParams(email: 'jacob',password: '123'),
    );
    final leftValue = result.fold(id,id) as AuthException;
      expect(result.isLeft(), true);
  });
  test('deve dar erro quando o password for inválido', ()async {
    final result = await useCase(
      CredentialsParams(email: 'jacob@flutterando.com.br', password: ''));
      
      expect(result.isLeft(), true);
    
  });
}
