import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:json_annotation/json_annotation.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: 'http://13.125.208.1:3000')
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  /// Authentication
  @POST('/auth/register')
  Future<Data> authentication({@Body() required jsondata});

  @POST('/auth/login')
  Future<Data> login({@Body() required jsondata});

  @GET('/card/list')
  Future<List<Cards>> getCardList({@Header('token') required token});
}

@JsonSerializable()
class Data {
  Data({
    required this.status,
    required this.message,
    required this.token,
  });

  int status;
  String message;
  String token;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Card {
  Card({
    required this.uuid,
    required this.email,
    required this.email2,
    required this.company,
    required this.name,
    required this.phone,
    required this.site,
    required this.address,
    required this.role,
  });

  String uuid;
  String email;
  String email2;
  String company;
  String name;
  String phone;
  String site;
  String address;
  String role;

  // factory with null safety
  factory Card.fromJson(Map<String, dynamic> json) => _$CardFromJson(json);
  Map<String, dynamic> toJson() => _$CardToJson(this);
}

@JsonSerializable()
class Cards {
  Cards({
    required this.message,
    required this.data,
  });

  String message;
  List<Card> data;

  factory Cards.fromJson(Map<String, dynamic> json) => _$CardsFromJson(json);
  Map<String, dynamic> toJson() => _$CardsToJson(this);
}
