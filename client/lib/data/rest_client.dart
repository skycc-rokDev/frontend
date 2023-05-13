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
class User {
  User({
    required this.id,
    required this.email,
    required this.name,
    required this.age,
    required this.gender,
    required this.address,
    required this.picture,
    required this.regDate,
    required this.birth,
    required this.familyRole,
  });
  int? id;
  String email;
  String? name;
  int? age;
  String? gender;
  String? address;
  String? picture;
  String? regDate;
  String? birth;
  String? familyRole;
  String? emotion;

  // factory with null safety
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable()
class Family {
  Family({
    required this.id,
    required this.name,
    required this.code,
    required this.regDate,
  });

  int id;
  String name;
  String code;
  String regDate;

  factory Family.fromJson(Map<String, dynamic> json) => _$FamilyFromJson(json);
  Map<String, dynamic> toJson() => _$FamilyToJson(this);
}

@JsonSerializable()
class FamilyInfo {
  FamilyInfo({
    required this.id,
    required this.name,
    required this.code,
    required this.regDate,
    required this.point,
    required this.users,
  });

  int id;
  String name;
  String code;
  String regDate;
  int point;
  List<User> users;

  factory FamilyInfo.fromJson(Map<String, dynamic> json) =>
      _$FamilyInfoFromJson(json);
  Map<String, dynamic> toJson() => _$FamilyInfoToJson(this);
}
