abstract interface class TokenStorage {
  Future<String?> getAccessToken();

  Future<String?> getRefreshToken();

  Stream<(String?, String?)>watchChanged();

  Future<void> saveTokens({
    required String accessToken,
    required String refreshToken,
  });

  Future<void> clearTokens();
}