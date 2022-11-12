part of 'services.dart';

class MasterDataService {
  //service untuk mendapatkan list provinsi
  static Future<List<Province>> getProvinces() async {
    var response = await http.get(
      Uri.https(Const.baseUrl, "/starter/province"),
      headers: <String, String>{
        'Content-Type': 'application/json: charset=UTF-8',
        'key': Const.apiKey,
      },
    );
    // variable job digunakan untuk parsing response body dari service
    var job = json.decode(response.body);

    List<Province> result = [];
    //kondisi  jika respon statucodenya 200 maka hasil response dari service akan di masukan kedalam model list provinsi
    if (response.statusCode == 200) {
      result = (job['rajaongkir']['results'] as List)
          .map((e) => Province.fromJson(e))
          .toList();
    }

    return result;
  }

// service untuk mendapatkan list city
  static Future<List<City>> getCity(var provId) async {
    var response = await http.get(
      Uri.https(Const.baseUrl, "/starter/city"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'key': Const.apiKey,
      },
    );
    // variable job digunakan untuk parsing response body dari service
    var job = json.decode(response.body);

    List<City> result = [];
    List<City> selectedCities = [];
    selectedCities.clear();
    // kondisi jika rescode nya 200 maka hasil dari service akan di masukan kedalam list model
    if (response.statusCode == 200) {
      result = (job['rajaongkir']['results'] as List)
          .map((e) => City.fromJson(e))
          .toList();
    }
    //looping di bawah di gunakan untuk filter untuk mendapatkan city sesuai dengan id provinsi
    for (var c in result) {
      if (c.provinceId == provId) {
        selectedCities.add(c);
      }
    }

    return selectedCities;
  }
}
