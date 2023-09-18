import 'package:app/src/@core/usecases/usecases.dart';
import 'package:app/src/module/auth/domain/repositories/auth_repository.dart';

class GetStoredTokenUsecase extends UseCase<String, NoParams> {
  final IAuthRepository repository;

  GetStoredTokenUsecase(this.repository);

  @override
  String? call(params) {
    return repository.storedToken;
  }
}
