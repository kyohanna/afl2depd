part of 'models.dart';

// class City extends Equatable {
//   final String? cityId;
//   final String? provinceId;
//   final String? province;
//   final String? type;
//   final String? cityName;
//   final String? postalCode;

class City {
  City({
    this.cityId,
    this.provinceId,
    this.province,
    this.type,
    this.cityName,
    this.postalCode,
  });

  String? cityId;
  String? provinceId;
  String? province;
  String? type;
  String? cityName;
  String? postalCode;

  factory City.fromJson(Map<String, dynamic> json) => City(
        cityId: json['city_id'],
        provinceId: json['province_id'],
        province: json['province'],
        type: json['type'],
        cityName: json['city_name'],
        postalCode: json['postal_code'],
      );


  Map<String, dynamic> toJson() => {
        'city_id': cityId,
        'province_id': provinceId,
        'province': province,
        'type': type,
        'city_name': cityName,
        'postal_code': postalCode,
      };
}

//   factory City.fromJson(String data) {
//     return City.fromMap(json.decode(data) as Map<String, dynamic>);
//   }

//   String toJson() => json.encode(toMap());

//   City copyWith({
//     String? cityId,
//     String? provinceId,
//     String? province,
//     String? type,
//     String? cityName,
//     String? postalCode,
//   }) {
//     return City(
//       cityId: cityId ?? this.cityId,
//       provinceId: provinceId ?? this.provinceId,
//       province: province ?? this.province,
//       type: type ?? this.type,
//       cityName: cityName ?? this.cityName,
//       postalCode: postalCode ?? this.postalCode,
//     );
//   }

//   @override
//   bool get stringify => true;

//   @override
//   List<Object?> get props {
//     return [
//       cityId,
//       provinceId,
//       province,
//       type,
//       cityName,
//       postalCode,
//     ];
//   }
// }





