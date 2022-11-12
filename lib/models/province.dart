part of 'models.dart';

// class Province extends Equatable {
//   final String? provinceId;
//   final String? province;

class Province {
  Province({
    this.provinceId,
    this.province,
  });

  String? provinceId;
  String? province;

    factory Province.fromJson(Map<String, dynamic> json) => Province(
        provinceId: json["province_id"],
        province: json["province"],
      );

  Map<String, dynamic> toJson() => {
        "province_id": provinceId,
        "province": province,
      };
}

//   factory Province.fromJson(String data) {
//     return Province.fromProvince(json.decode(data) as Map<String, dynamic>);
//   }

//   String toJson() => json.encode(toProvince());

//   Province copyWith({
//     String? provinceId,
//     String? province,
//   }) {
//     return Province(
//       provinceId: provinceId ?? this.provinceId,
//       province: province ?? this.province,
//     );
//   }

//   @override
//   bool get stringify => true;

//   @override
//   List<Object?> get props => [provinceId, province];
// }



