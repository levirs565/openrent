import 'package:hive_ce/hive.dart';
import 'package:openrent_client/data/token_storage.dart';

const _accessTokenKey = "accessToken";
const _refreshTokenKey = "refreshToken";

class HiveTokenStorage implements TokenStorage {
  Box? _box;

  Future<void> _ensureBoxOpen() async {
    _box ??= await Hive.openBox("token");
  }

  @override
  Future<void> clearTokens() async {
    await _ensureBoxOpen();
    await _box!.clear();
  }

  @override
  Future<String?> getAccessToken() async {
    await _ensureBoxOpen();
    return _box!.get(_accessTokenKey);
  }

  @override
  Future<String?> getRefreshToken() async {
    await _ensureBoxOpen();
    return _box!.get(_refreshTokenKey);
  }

  @override
  Future<void> saveTokens({
    required String accessToken,
    required String refreshToken,
  }) async {
    await _ensureBoxOpen();
    await _box!.put(_accessTokenKey, accessToken);
    await _box!.put(_refreshTokenKey, refreshToken);
  }

  @override
  Stream<(String?, String?)> watchChanged() async* {
    await _ensureBoxOpen();
    yield* _box!.watch().map(
      (event) => (_box!.get(_refreshTokenKey), _box!.get(_accessTokenKey)),
    );
  }
}
