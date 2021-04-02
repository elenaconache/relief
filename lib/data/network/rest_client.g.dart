// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rest_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _RestClient implements RestClient {
  _RestClient(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    baseUrl ??=
        'https://eu-api.backendless.com/F6A54640-91E5-D0DC-FF13-CC1C187D9700/6B0F25D5-E189-400F-8542-C3F52A78AD6D/';
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<List<Translation>> getTranslations(pageSize, offset) async {
    ArgumentError.checkNotNull(pageSize, 'pageSize');
    ArgumentError.checkNotNull(offset, 'offset');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'pageSize': pageSize,
      r'offset': offset
    };
    final _data = <String, dynamic>{};
    final _result = await _dio.request<List<dynamic>>('data/Translation',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) => Translation.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<ReliefUser> login(user) async {
    ArgumentError.checkNotNull(user, 'user');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(user?.toJson() ?? <String, dynamic>{});
    final _result = await _dio.request<Map<String, dynamic>>('users/login',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = ReliefUser.fromJson(_result.data);
    return value;
  }

  @override
  Future<ReliefUser> loginWithFacebook(user) async {
    ArgumentError.checkNotNull(user, 'user');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(user?.toJson() ?? <String, dynamic>{});
    final _result = await _dio.request<Map<String, dynamic>>(
        'users/social/facebook/sdk/login',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = ReliefUser.fromJson(_result.data);
    return value;
  }

  @override
  Future<ReliefUser> loginWithGoogle(user) async {
    ArgumentError.checkNotNull(user, 'user');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(user?.toJson() ?? <String, dynamic>{});
    final _result = await _dio.request<Map<String, dynamic>>(
        'users/social/googleplus/sdk/login',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = ReliefUser.fromJson(_result.data);
    return value;
  }

  @override
  Future<RegistrationResponse> register(user) async {
    ArgumentError.checkNotNull(user, 'user');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(user?.toJson() ?? <String, dynamic>{});
    final _result = await _dio.request<Map<String, dynamic>>('data/Users',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = RegistrationResponse.fromJson(_result.data);
    return value;
  }

  @override
  Future<void> resetPassword(email) async {
    ArgumentError.checkNotNull(email, 'email');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    await _dio.request<void>('users/restorepassword/$email',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    return null;
  }
}
