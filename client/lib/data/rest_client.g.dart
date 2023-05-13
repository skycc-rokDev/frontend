// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rest_client.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      status: json['status'] as int,
      message: json['message'] as String,
      token: json['token'] as String,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'token': instance.token,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as int?,
      email: json['email'] as String,
      name: json['name'] as String?,
      age: json['age'] as int?,
      gender: json['gender'] as String?,
      address: json['address'] as String?,
      picture: json['picture'] as String?,
      regDate: json['regDate'] as String?,
      birth: json['birth'] as String?,
      familyRole: json['familyRole'] as String?,
    )..emotion = json['emotion'] as String?;

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'name': instance.name,
      'age': instance.age,
      'gender': instance.gender,
      'address': instance.address,
      'picture': instance.picture,
      'regDate': instance.regDate,
      'birth': instance.birth,
      'familyRole': instance.familyRole,
      'emotion': instance.emotion,
    };

Family _$FamilyFromJson(Map<String, dynamic> json) => Family(
      id: json['id'] as int,
      name: json['name'] as String,
      code: json['code'] as String,
      regDate: json['regDate'] as String,
    );

Map<String, dynamic> _$FamilyToJson(Family instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
      'regDate': instance.regDate,
    };

FamilyInfo _$FamilyInfoFromJson(Map<String, dynamic> json) => FamilyInfo(
      id: json['id'] as int,
      name: json['name'] as String,
      code: json['code'] as String,
      regDate: json['regDate'] as String,
      point: json['point'] as int,
      users: (json['users'] as List<dynamic>)
          .map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FamilyInfoToJson(FamilyInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
      'regDate': instance.regDate,
      'point': instance.point,
      'users': instance.users,
    };

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _RestClient implements RestClient {
  _RestClient(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'http://13.125.208.1:3000';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<Data> authentication({required dynamic jsondata}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = jsondata;
    final _result =
        await _dio.fetch<Map<String, dynamic>>(_setStreamType<Data>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/auth/register',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Data.fromJson(_result.data!);
    return value;
  }

  @override
  Future<Data> login({required dynamic jsondata}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = jsondata;
    final _result =
        await _dio.fetch<Map<String, dynamic>>(_setStreamType<Data>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/auth/login',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Data.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
