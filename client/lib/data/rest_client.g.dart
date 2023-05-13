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

Card _$CardFromJson(Map<String, dynamic> json) => Card(
      uuid: json['uuid'] as String,
      email: json['email'] as String,
      email2: json['email2'] as String,
      company: json['company'] as String,
      name: json['name'] as String,
      phone: json['phone'] as String,
      site: json['site'] as String,
      address: json['address'] as String,
      role: json['role'] as String,
    );

Map<String, dynamic> _$CardToJson(Card instance) => <String, dynamic>{
      'uuid': instance.uuid,
      'email': instance.email,
      'email2': instance.email2,
      'company': instance.company,
      'name': instance.name,
      'phone': instance.phone,
      'site': instance.site,
      'address': instance.address,
      'role': instance.role,
    };

Cards _$CardsFromJson(Map<String, dynamic> json) => Cards(
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => Card.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CardsToJson(Cards instance) => <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
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

  @override
  Future<List<Cards>> getCardList({required dynamic token}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'token': token};
    _headers.removeWhere((k, v) => v == null);
    final Map<String, dynamic>? _data = null;
    final _result =
        await _dio.fetch<List<dynamic>>(_setStreamType<List<Cards>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/card/list',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => Cards.fromJson(i as Map<String, dynamic>))
        .toList();
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
