part of 'pages.dart';

class Ongkirpage extends StatefulWidget {
  const Ongkirpage({Key? key}) : super(key: key);

  @override
  _OngkirpageState createState() => _OngkirpageState();
}

class _OngkirpageState extends State<Ongkirpage> {
  bool isLoading = false;
  bool isLoadingCOrg = false;
  bool isLoadingCDest = false;
  String dropdownvalue = 'jne';
  var kurir = ['jne', 'j&t', 'jnt'];

  final ctrlBerat = TextEditingController();

  dynamic provId;
  dynamic provinceData;
  Province? selectedProv;
  List<Province> listProvince = [];

  Future<List<Province>> getProvinces() async {
    setState(() {
      isLoading = true;
    });
    await MasterDataService.getProvinces().then((value) {
      setState(() {
        listProvince.addAll(value);
        isLoading = false;
      });
    });

    return listProvince;
  }

  dynamic cityId;
  dynamic cityData;
  City? selectedCity;
  City? selectedCity2;
  List<City>? listCity = <City>[];
  Future<List<City>> getCities(var provId) async {
    setState(() {
      isLoadingCOrg = true;
    });
    await MasterDataService.getCity(provId).then((value) {
      setState(() {
        listCity!.addAll(value);
        isLoadingCOrg = false;
      });
    });
    return listCity!;
  }

  dynamic provIdDest;
  dynamic provinceDataDest;
  Province? selectedProvDest;

  List<Province> listProvinceDest = [];
  Future<List<Province>> getProvincesDest() async {
    await MasterDataService.getProvinces().then((value) {
      setState(() {
        listProvinceDest.addAll(value);
      });
    });

    return listProvinceDest;
  }

  dynamic cityIdDest;
  dynamic cityDataDest;
  City? selectedCityDest;
  City? selectedCityDest2;
  List<City>? listCityDest = [];
  Future<List<City>> getCitiesDest(var provId) async {
    setState(() {
      isLoadingCDest = true;
    });
    await MasterDataService.getCity(provId).then((value) {
      setState(() {
        listCityDest!.addAll(value);
        isLoadingCDest = false;
      });
    });
    return listCityDest!;
  }

  @override
  void initState() {
    super.initState();
    getProvinces();
    getProvincesDest();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hitung Ongkir"),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
              width: double.infinity,
              height: double.infinity,
              child: Column(
                children: [
                  Flexible(
                    flex: 2,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              DropdownButton(
                                  value: dropdownvalue,
                                  icon: const Icon(Icons.arrow_drop_down),
                                  items: kurir.map((String items) {
                                    return DropdownMenuItem(
                                      value: items,
                                      child: Text(items),
                                    );
                                  }).toList(),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      dropdownvalue = newValue!;
                                    });
                                  }),
                              SizedBox(
                                width: 200,
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  controller: ctrlBerat,
                                  decoration: InputDecoration(
                                    labelText: 'Berat(gr)',
                                  ),
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  validator: (value) {
                                    return value == null || value == 0
                                        ? 'Berat harus diisi atau tidak boleh 0!'
                                        : null;
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        //ORIGIN
                        Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Origin",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    isLoading
                                        ? SizedBox(
                                            width: 150,
                                            child: Center(
                                                child: Uiloading.loadingDD()))
                                        : SizedBox(
                                            width: 150,
                                            height: 50,
                                            child: DropdownButton<Province>(
                                              isExpanded: true,
                                              value: selectedProv,
                                              icon: Icon(Icons.arrow_drop_down),
                                              items: listProvince.map(
                                                (Province items) {
                                                  return DropdownMenuItem<
                                                      Province>(
                                                    value: items,
                                                    child: Text(
                                                      items.province.toString(),
                                                    ),
                                                  );
                                                },
                                              ).toList(),
                                              onChanged: (Province? newValue) {
                                                setState(
                                                  () {
                                                    selectedProv = newValue!;
                                                    provId =
                                                        newValue.provinceId;
                                                    selectedCity =
                                                        selectedCity2;
                                                    listCity!.clear();
                                                    getCities(provId);
                                                  },
                                                );
                                              },
                                            ),
                                          ),
                                    isLoadingCOrg
                                        ? SizedBox(
                                            width: 150,
                                            child: Center(
                                                child: Uiloading.loadingDD()))
                                        : SizedBox(
                                            width: 150,
                                            height: 50,
                                            child: DropdownButton<City>(
                                              isExpanded: true,
                                              value: selectedCity,
                                              icon: Icon(Icons.arrow_drop_down),
                                              items: listCity!.map(
                                                (City items) {
                                                  return DropdownMenuItem<City>(
                                                    value: items,
                                                    child: Text(
                                                      items.cityName.toString(),
                                                    ),
                                                  );
                                                },
                                              ).toList(),
                                              onChanged: (City? newValue) {
                                                setState(
                                                  () {
                                                    selectedCity = newValue!;
                                                  },
                                                );
                                              },
                                            ),
                                          ),
                                  ],
                                ),
                                SizedBox(
                                  height: 30,
                                ),

                                //DESTINATION
                                Text(
                                  "Destination",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    isLoading
                                        ? SizedBox(
                                            width: 150,
                                            child: Center(
                                                child: Uiloading.loadingDD()))
                                        : SizedBox(
                                            width: 150,
                                            height: 50,
                                            child: DropdownButton<Province>(
                                              isExpanded: true,
                                              value: selectedProvDest,
                                              icon: Icon(Icons.arrow_drop_down),
                                              items: listProvinceDest.map(
                                                (Province items) {
                                                  return DropdownMenuItem<
                                                      Province>(
                                                    value: items,
                                                    child: Text(
                                                      items.province.toString(),
                                                    ),
                                                  );
                                                },
                                              ).toList(),
                                              onChanged: (Province? newValue) {
                                                setState(
                                                  () {
                                                    selectedProvDest =
                                                        newValue!;
                                                    provIdDest =
                                                        selectedProvDest!
                                                            .provinceId;
                                                    selectedCityDest =
                                                        selectedCityDest2;
                                                    listCityDest!.clear();
                                                    getCitiesDest(provIdDest);
                                                  },
                                                );
                                              },
                                            ),
                                          ),
                                    isLoadingCDest
                                        ? SizedBox(
                                            width: 150,
                                            child: Center(
                                                child: Uiloading.loadingDD()))
                                        : SizedBox(
                                            width: 150,
                                            height: 50,
                                            child: DropdownButton<City>(
                                              isExpanded: true,
                                              value: selectedCityDest,
                                              icon: Icon(Icons.arrow_drop_down),
                                              items: listCityDest!.map(
                                                (City items) {
                                                  return DropdownMenuItem<City>(
                                                    value: items,
                                                    child: Text(
                                                      items.cityName.toString(),
                                                    ),
                                                  );
                                                },
                                              ).toList(),
                                              onChanged: (City? newValue) {
                                                setState(
                                                  () {
                                                    selectedCityDest =
                                                        newValue!;
                                                  },
                                                );
                                              },
                                            ),
                                          ),
                                  ],
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Center(
                                  child: GestureDetector(
                                    onTap: () {
                                      if (selectedCity == null ||
                                          selectedCityDest == null ||
                                          selectedProv == null ||
                                          selectedProvDest == null) {
                                        Fluttertoast.showToast(
                                            msg:
                                                "Origin dan atau Destination masih belum diset",
                                            toastLength: Toast.LENGTH_LONG,
                                            gravity: ToastGravity.BOTTOM,
                                            timeInSecForIosWeb: 1,
                                            backgroundColor: Colors.red,
                                            textColor: Colors.white,
                                            fontSize: 16.0);
                                      } else {
                                        Fluttertoast.showToast(
                                            msg:
                                                "Origin = ${selectedCity!.cityName} dan Destination =${selectedCityDest!.cityName}",
                                            toastLength: Toast.LENGTH_LONG,
                                            gravity: ToastGravity.BOTTOM,
                                            timeInSecForIosWeb: 4,
                                            backgroundColor: Colors.green,
                                            textColor: Colors.white,
                                            fontSize: 15.0);
                                      }
                                    },
                                    child: Container(
                                      width: 100,
                                      height: 40,
                                      child: Center(child: Text('Submit')),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.blue),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Flexible(
                    flex: 2,
                    child: Container(),
                  ),
                ],
              )),
          isLoading == true ? Uiloading.loading() : Container(),
        ],
      ),
    );
  }
}
