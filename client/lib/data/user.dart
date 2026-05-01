import 'package:openrent_client/data/remote/user.dart';
import 'package:openrent_client/data/resource.dart';

abstract interface class UserRepository {
  Future<Result<UserResponseItemShort>> getById({required int id});
}

class UserDataSource implements UserRepository {
  final UserService _service;

  UserDataSource({required UserService service}) : _service = service;

  @override
  Future<Result<UserResponseItemShort>> getById({required int id}) async {
    try {
      final result = await _service.getById(id);
      return ResultSuccess(result);
    } catch (e) {
      return mapDioErrorToResult(e);
    }
  }
}
