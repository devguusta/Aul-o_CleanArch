import 'package:aulao_clean/app/modules/auth/domain/usecases/login_usecase.dart';
import 'package:aulao_clean/app/modules/auth/external/firebase/firebase_auth_impl.dart';
import 'package:aulao_clean/app/modules/auth/infra/datasources/auth_datasource.dart';
import 'package:aulao_clean/app/modules/auth/infra/repositories/auth_repository_impl.dart';
import 'package:kiwi/kiwi.dart';

import 'app/modules/auth/domain/repositories/auth_repository.dart';
import 'app/modules/auth/external/auth_api/auth_api.dart';

final container = KiwiContainer()
  ..registerFactory((container) => LoginUseCase(container.resolve()))
  ..registerFactory<AuthRepository>((container) => AuthRepositoryImpl(container.resolve()))
   ..registerFactory<AuthDatasource>((container) => FirebaseAuth());
  
main(List<String> args) {
  final usecase = container.resolve<LoginUseCase>();
  final ucase = LoginUseCase(AuthRepositoryImpl(AuthApi()));
}
