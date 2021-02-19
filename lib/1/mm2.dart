/* import 'package:flutter/material.dart';

class city {
  int id;
  String name;
  List<Neighborhood> Nbrhood;
  city({this.id, this.name, this.Nbrhood});
}

class Neighborhood {
  int id;
  String name;
  List<street> strt;
  Neighborhood({this.id, this.name, this.strt});
}

class street {
  int id;
  String name;
  List<nameX> name_x;
  street({this.id, this.name, this.name_x});
}

class nameX {
  String name;
  nameX({this.name});
}

//city(Neighborhood(street(street1)))
List listdata = [
  city(id: 0, name: "مكة", Nbrhood: [
    Neighborhood(id: 0, name: 'الزاهر', strt: [
      street(id: 0, name: 'مخطط ٣', name_x: [
        nameX(name: "فندق"),
        nameX(name: "عماره"),
      ]),
      street(id: 1, name: 'مخطط٢', name_x: [
        nameX(name: "فندق"),
        nameX(name: "عماره"),
      ]),
      street(id: 2, name: 'مخطط9', name_x: [
        nameX(name: "فندق"),
        nameX(name: "عماره"),
      ]),
    ]),
    Neighborhood(id: 1, name: 'العوالي', strt: [
      street(id: 0, name: 'اسود', name_x: [
        nameX(name: "فندق"),
        nameX(name: "عماره"),
        nameX(name: "فندق"),
        nameX(name: "عماره"),
      ]),
      street(id: 1, name: 'ملون', name_x: [
        nameX(name: "فندق"),
        nameX(name: "عماره"),
        nameX(name: "فندق"),
        nameX(name: "عماره"),
        nameX(name: "فندق"),
        nameX(name: "عماره"),
      ]),
    ]),
  ]),
  city(id: 1, name: "جدة", Nbrhood: [
    Neighborhood(id: 0, name: 'النسيم', strt: [
      street(id: 0, name: 'اسود', name_x: [
        nameX(name: "فندق"),
        nameX(name: "عماره"),
        nameX(name: "فندق"),
        nameX(name: "عماره"),
        nameX(name: "فندق"),
        nameX(name: "عماره"),
        nameX(name: "فندق"),
        nameX(name: "عماره"),
      ]),
      street(id: 1, name: 'ملون', name_x: [
        nameX(name: "فندق"),
        nameX(name: "عماره"),
        nameX(name: "فندق"),
        nameX(name: "عماره"),
        nameX(name: "فندق"),
        nameX(name: "عماره"),
        nameX(name: "فندق"),
        nameX(name: "عماره"),
      ]),
    ]),
    Neighborhood(id: 1, name: 'الخالدية', strt: [
      street(id: 0, name: 'اسود', name_x: [
        nameX(name: "فندق"),
        nameX(name: "عماره"),
      ]),
      street(id: 1, name: 'ملون', name_x: [
        nameX(name: "فندق"),
        nameX(name: "عماره"),
      ]),
    ]),
  ]),
  city(id: 2, name: "الرياض", Nbrhood: [
    Neighborhood(id: 0, name: 'النظيم', strt: [
      street(id: 0, name: 'اسود', name_x: [
        nameX(name: "فندق"),
        nameX(name: "عماره"),
        nameX(name: "فندق"),
        nameX(name: "عماره"),
      ]),
      street(id: 2, name: 'ملون', name_x: [
        nameX(name: "فندق"),
        nameX(name: "عماره"),
      ]),
    ]),
    Neighborhood(id: 1, name: 'خريص', strt: [
      street(id: 0, name: 'اسود', name_x: [
        nameX(name: "فندق"),
        nameX(name: "عماره"),
        nameX(name: "فندق"),
        nameX(name: "عماره"),
      ]),
      street(id: 1, name: 'ملون', name_x: [
        nameX(name: "فندق"),
        nameX(name: "عماره"),
        nameX(name: "فندق"),
        nameX(name: "عماره"),
      ]),
    ]),
  ]),
  city(id: 3, name: "الطايف", Nbrhood: [
    Neighborhood(id: 0, name: 'الهدا', strt: [
      street(id: 0, name: 'اسود', name_x: [
        nameX(name: "فندق"),
        nameX(name: "عماره"),
        nameX(name: "فندق"),
        nameX(name: "عماره"),
        nameX(name: "تدبيس ركن"),
      ]),
      street(id: 1, name: 'ملون', name_x: [
        nameX(name: "فندق"),
        nameX(name: "عماره"),
        nameX(name: "فندق"),
        nameX(name: "عماره"),
        nameX(name: "تدبيس ركن"),
      ]),
    ]),
    Neighborhood(id: 1, name: 'الشفا', strt: [
      street(id: 0, name: 'اسود', name_x: [
        nameX(name: "فندق"),
        nameX(name: "عماره"),
        nameX(name: "فندق"),
        nameX(name: "عماره"),
      ]),
      street(id: 1, name: 'ملون', name_x: [
        nameX(name: "فندق"),
        nameX(name: "عماره"),
        nameX(name: "فندق"),
        nameX(name: "عماره"),
      ]),
    ]),
    Neighborhood(id: 2, name: 'شهار', strt: [
      street(id: 0, name: 'اسود', name_x: [
        nameX(name: "فندق"),
        nameX(name: "عماره"),
        nameX(name: "فندق"),
        nameX(name: "عماره"),
      ]),
      street(id: 2, name: 'ملون', name_x: [
        nameX(name: "فندق"),
        nameX(name: "عماره"),
        nameX(name: "فندق"),
        nameX(name: "عماره"),
      ]),
    ]),
  ]),
];
//-----------------------------------------------------------

class A123 extends StatefulWidget {
  @override
  _A123State createState() => _A123State();
}

class _A123State extends State<A123> {
  int _radioValue = -1;
  String radioValue;
  int _radioValue1 = -1;
  String radioValue1;
  int _radioValue2 = -1;
  String radioValue2;

  void _handleRadioValueChange(value) {
    setState(() {
      _radioValue = value;
      switch (_radioValue) {
        case 0:
          {
            radioValue = "غير";
            print("radioValue5 is $radioValue");
          }
          break;
        case 1:
          {
            radioValue = "عادي";
            print("radioValue5 is $radioValue");
          }
          break;
      }
    });
  }

//---------------------
  int selected_city = 0;
  int selected_Nbrhood = 0;
  int selected_str = 0;
  int selected_name = 0;
  List<DropdownMenuItem<int>> cityDrop = [];
  List<DropdownMenuItem<int>> NbrhoodDrop = [];
  List<DropdownMenuItem<int>> strDrop = [];
  List<DropdownMenuItem<int>> nameDrop = [];

  void loadCity() {
    cityDrop = [];
    for (int i = 0; i < listdata.length; i++) {
      cityDrop.add(new DropdownMenuItem(
          child: new Text("${listdata[i].name}"), value: i));
    }
  }

  void loadNbrhood() {
    NbrhoodDrop = [];
    for (int i = 0; i < listdata[selected_city].Nbrhood.length; i++) {
      setState(() {
        NbrhoodDrop.add(new DropdownMenuItem(
            child: new Text("${listdata[selected_city].Nbrhood[i].name}"),
            value: i));
      });
    }
  }

  void loadstr() {
    strDrop = [];
    for (int i = 0;
        i < listdata[selected_city].Nbrhood[selected_Nbrhood].strt.length;
        i++) {
      setState(() {
        strDrop.add(new DropdownMenuItem(
            child: new Text(
                "${listdata[selected_city].Nbrhood[selected_Nbrhood].strt[i].name}"),
            value: i));
      });
    }
  }

//city(Neighborhood(strt(namez)))
  void namestr() {
    nameDrop = [];
    for (int i = 0;
        i <
            listdata[selected_city]
                .Nbrhood[selected_Nbrhood]
                .strt[selected_str]
                .name_x
                .length;
        i++) {
      nameDrop.add(new DropdownMenuItem(
          child: new Text(
              "${listdata[selected_city].Nbrhood[selected_Nbrhood].strt[selected_str].name_x[i].name}"),
          value: i));
    }
  }

  @override
  Widget build(BuildContext context) {
    loadCity();
    loadstr();
    loadNbrhood();
    namestr();
    return Scaffold(
        appBar: AppBar(),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
              Padding(
                  padding: const EdgeInsets.fromLTRB(0, 8.0, 0, 10.0),
                  child: Container(
                      width: 325.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black45,
                            offset: Offset(0.1, 0.1),
                            blurRadius: 0.1,
                          )
                        ],
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          value: selected_city,
                          items: cityDrop,
                          underline: Container(
                            height: 0,
//                                    color: Colors.transparent,
                          ),
                          hint: new Text('حجن الورق'),
                          onChanged: (value) {
                            setState(() {
                              selected_city = int.parse(value.toString());
                              selected_Nbrhood = 0;
                              selected_str = 0;
                              selected_name = 0;
                              loadNbrhood();
                              loadstr();
                              namestr();
                            });
                          },
                        ),
                      ))),

              //
              selected_city != 1
                  ? Container()
                  : Padding(
                      padding: const EdgeInsets.fromLTRB(0, 8.0, 0, 10.0),
                      child: Container(
                          width: 325.0,
                          height: 50.0,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black45,
                                offset: Offset(0.1, 0.1),
                                blurRadius: 0.1,
                              )
                            ],
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white,
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                              value: selected_Nbrhood,
                              items: NbrhoodDrop,
                              underline: Container(
                                height: 0,
//                                    color: Colors.transparent,
                              ),
                              hint: new Text('choose'),
                              onChanged: (value) {
                                setState(() {
                                  selected_Nbrhood =
                                      int.parse(value.toString());
                                  selected_str = 0;
                                  selected_name = 0;
                                  print("select $value");
                                  loadNbrhood();
                                  loadstr();
                                  namestr();
                                });
                              },
                            ),
                          ))),

              //---------------------------
              //
              Padding(
                  padding: const EdgeInsets.fromLTRB(0, 8.0, 0, 10.0),
                  child: Container(
                      width: 325.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black45,
                            offset: Offset(0.1, 0.1),
                            blurRadius: 0.1,
                          )
                        ],
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          value: selected_str,
                          items: strDrop,
                          underline: Container(
                            height: 0,
//                                    color: Colors.transparent,
                          ),
                          hint: new Text('choose'),
                          onChanged: (value) {
                            setState(() {
                              selected_str = int.parse(value.toString());
                              selected_name = 0;
                              print("select $value");
                              loadstr();
                              namestr();
                            });
                          },
                        ),
                      ))),

              //---------------------------
              Padding(
                  padding: const EdgeInsets.fromLTRB(0, 8.0, 0, 10.0),
                  child: Container(
                      width: 325.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black45,
                            offset: Offset(0.1, 0.1),
                            blurRadius: 0.1,
                          )
                        ],
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          value: selected_name,
                          items: nameDrop,
                          underline: Container(
                            height: 0,
                          ),
                          hint: new Text('choose'),
                          onChanged: (value) {
                            setState(() {
                              selected_name = int.parse(value.toString());
                              print("select $value");
                              namestr();
                            });
                          },
                        ),
                      ))),
              new Container(
                  child: new Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                    new Text(
                      'نوع التبرع:',
                      style: new TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Radio(
                          value: 0,
                          groupValue: _radioValue,
                          onChanged: _handleRadioValueChange,
                        ),
                        new Text(
                          'مال ',
                          style: new TextStyle(fontSize: 16.0),
                        ),
                        new Radio(
                          value: 1,
                          groupValue: _radioValue,
                          onChanged: _handleRadioValueChange,
                        ),
                        new Text(
                          'اغراض',
                          style: new TextStyle(fontSize: 16.0),
                        ),
                      ],
                    ),
                  ])),
            ])));
  }
}
 */