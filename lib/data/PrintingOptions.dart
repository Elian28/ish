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
  int id;
  String name;
  List<nameZ> name_Z;
  nameX({this.name, this.name_Z, this.id});
}

class nameZ {
  String name;
  nameZ({this.name});
}

//city(Neighborhood(street(street1)))
List listdata = [
  city(id: 0, name: "A0", Nbrhood: [
    Neighborhood(id: 0, name: 'عادي', strt: [
      street(id: 0, name: ' اسود', name_x: [
        nameX(id: 0, name: "بدون تغليف", name_Z: [
          nameZ(name: "0"),
          nameZ(name: "0"),
        ]),
        nameX(id: 1, name: "حافظ إنبوبي", name_Z: [
          nameZ(name: "222222"),
          nameZ(name: "111111"),
          nameZ(name: "444876"),
          nameZ(name: "879789"),
        ]),
      ]),
      street(id: 1, name: 'ملون', name_x: [
        nameX(id: 0, name: "بدون تغليف", name_Z: [
          nameZ(name: "111111"),
          nameZ(name: "222222"),
        ]),
        nameX(id: 1, name: "حافظ إنبوبي", name_Z: [
          nameZ(name: "222222"),
          nameZ(name: "111111"),
          nameZ(name: "444876"),
          nameZ(name: "879789"),
        ]),
      ]),
    ]),
    Neighborhood(id: 1, name: 'فلم أبيض', strt: [
      street(id: 0, name: 'اسود', name_x: [
        nameX(id: 0, name: "عماره", name_Z: [
          nameZ(name: "عماره"),
        ]),
        nameX(id: 1, name: "oiuy", name_Z: [
          nameZ(name: "عماره"),
        ]),
        nameX(id: 2, name: "jjk", name_Z: [
          nameZ(name: "ناتتن"),
        ]),
        nameX(id: 3, name: "oiuh", name_Z: [
          nameZ(name: "ناتتن"),
        ])
      ]),
      street(id: 1, name: 'ملون', name_x: [
        nameX(id: 0, name: "iuy", name_Z: [
          nameZ(name: "ناتتننممتنتم"),
        ]),
        nameX(id: 1, name: "jjjk", name_Z: [
          nameZ(name: "ناتتننممتنتممنتم"),
        ]),
        nameX(id: 2, name: "hjk", name_Z: [
          nameZ(name: "ناتتننممتنتممنتمتنمن"),
        ]),
        nameX(id: 3, name: "lljk", name_Z: [
          nameZ(name: "٨٧٦٥"),
        ]),
        nameX(id: 4, name: "jhj", name_Z: [
          nameZ(name: "٨٧٦٥نت"),
        ]),
      ]),
    ]),
  ]),
  city(id: 1, name: "A1", Nbrhood: [
    Neighborhood(id: 0, name: 'عادي', strt: [
      street(id: 0, name: ' اسود', name_x: [
        nameX(id: 0, name: "بدون تغليف", name_Z: [
          nameZ(name: "0"),
          nameZ(name: "0"),
        ]),
        nameX(id: 1, name: "حافظ إنبوبي", name_Z: [
          nameZ(name: "222222"),
          nameZ(name: "111111"),
          nameZ(name: "444876"),
          nameZ(name: "879789"),
        ]),
      ]),
      street(id: 1, name: 'ملون', name_x: [
        nameX(id: 0, name: "بدون تغليف", name_Z: [
          nameZ(name: "111111"),
          nameZ(name: "222222"),
        ]),
        nameX(id: 1, name: "حافظ إنبوبي", name_Z: [
          nameZ(name: "222222"),
          nameZ(name: "111111"),
          nameZ(name: "444876"),
          nameZ(name: "879789"),
        ]),
      ]),
    ]),
    Neighborhood(id: 1, name: 'فلم أبيض', strt: [
      street(id: 0, name: 'اسود', name_x: [
        nameX(id: 0, name: "عماره", name_Z: [
          nameZ(name: "عماره"),
        ]),
        nameX(id: 1, name: "oiuy", name_Z: [
          nameZ(name: "عماره"),
        ]),
        nameX(id: 2, name: "jjk", name_Z: [
          nameZ(name: "ناتتن"),
        ]),
        nameX(id: 3, name: "oiuh", name_Z: [
          nameZ(name: "ناتتن"),
        ])
      ]),
      street(id: 1, name: 'ملون', name_x: [
        nameX(id: 0, name: "iuy", name_Z: [
          nameZ(name: "ناتتننممتنتم"),
        ]),
        nameX(id: 1, name: "jjjk", name_Z: [
          nameZ(name: "ناتتننممتنتممنتم"),
        ]),
        nameX(id: 2, name: "hjk", name_Z: [
          nameZ(name: "ناتتننممتنتممنتمتنمن"),
        ]),
        nameX(id: 3, name: "lljk", name_Z: [
          nameZ(name: "٨٧٦٥"),
        ]),
        nameX(id: 4, name: "jhj", name_Z: [
          nameZ(name: "٨٧٦٥نت"),
        ]),
      ]),
    ]),
  ]),
  city(id: 2, name: "A2", Nbrhood: [
    Neighborhood(id: 0, name: 'عادي', strt: [
      street(id: 0, name: ' اسود', name_x: [
        nameX(id: 0, name: "بدون تغليف", name_Z: [
          nameZ(name: "0"),
          nameZ(name: "0"),
        ]),
        nameX(id: 1, name: "حافظ إنبوبي", name_Z: [
          nameZ(name: "222222"),
          nameZ(name: "111111"),
          nameZ(name: "444876"),
          nameZ(name: "879789"),
        ]),
      ]),
      street(id: 1, name: 'ملون', name_x: [
        nameX(id: 0, name: "بدون تغليف", name_Z: [
          nameZ(name: "111111"),
          nameZ(name: "222222"),
        ]),
        nameX(id: 1, name: "حافظ إنبوبي", name_Z: [
          nameZ(name: "222222"),
          nameZ(name: "111111"),
          nameZ(name: "444876"),
          nameZ(name: "879789"),
        ]),
      ]),
    ]),
    Neighborhood(id: 1, name: 'فلم أبيض', strt: [
      street(id: 0, name: 'اسود', name_x: [
        nameX(id: 0, name: "عماره", name_Z: [
          nameZ(name: "عماره"),
        ]),
        nameX(id: 1, name: "oiuy", name_Z: [
          nameZ(name: "عماره"),
        ]),
        nameX(id: 2, name: "jjk", name_Z: [
          nameZ(name: "ناتتن"),
        ]),
        nameX(id: 3, name: "oiuh", name_Z: [
          nameZ(name: "ناتتن"),
        ])
      ]),
      street(id: 1, name: 'ملون', name_x: [
        nameX(id: 0, name: "iuy", name_Z: [
          nameZ(name: "ناتتننممتنتم"),
        ]),
        nameX(id: 1, name: "jjjk", name_Z: [
          nameZ(name: "ناتتننممتنتممنتم"),
        ]),
        nameX(id: 2, name: "hjk", name_Z: [
          nameZ(name: "ناتتننممتنتممنتمتنمن"),
        ]),
        nameX(id: 3, name: "lljk", name_Z: [
          nameZ(name: "٨٧٦٥"),
        ]),
        nameX(id: 4, name: "jhj", name_Z: [
          nameZ(name: "٨٧٦٥نت"),
        ]),
      ]),
    ]),
  ]),
  city(id: 3, name: "A3", Nbrhood: [
    Neighborhood(id: 0, name: 'عادي', strt: [
      street(id: 0, name: ' اسود', name_x: [
        nameX(id: 0, name: "بدون تغليف", name_Z: [
          nameZ(name: "111111"),
          nameZ(name: "222222"),
        ]),
        nameX(id: 1, name: "حافظ إنبوبي", name_Z: [
          nameZ(name: "222222"),
          nameZ(name: "111111"),
          nameZ(name: "444876"),
          nameZ(name: "879789"),
        ]),
        nameX(id: 2, name: "تدبيس ركن", name_Z: [
          nameZ(name: "222222"),
          nameZ(name: "111111"),
          nameZ(name: "444876"),
          nameZ(name: "879789"),
        ]),
      ]),
      street(id: 1, name: 'ملون', name_x: [
        nameX(id: 0, name: "بدون تغليف", name_Z: [
          nameZ(name: "111111"),
          nameZ(name: "222222"),
        ]),
        nameX(id: 1, name: "حافظ إنبوبي", name_Z: [
          nameZ(name: "222222"),
          nameZ(name: "111111"),
          nameZ(name: "444876"),
          nameZ(name: "879789"),
        ]),
        nameX(id: 2, name: "تدبيس ركن", name_Z: [
          nameZ(name: "222222"),
          nameZ(name: "111111"),
          nameZ(name: "444876"),
          nameZ(name: "879789"),
        ]),
      ]),
    ]),
    Neighborhood(id: 1, name: 'لماع', strt: [
      street(id: 0, name: 'اسود', name_x: [
        nameX(id: 0, name: "بدون تغليف", name_Z: [
          nameZ(name: "111111"),
          nameZ(name: "222222"),
        ]),
        nameX(id: 1, name: "حافظ إنبوبي", name_Z: [
          nameZ(name: "222222"),
          nameZ(name: "111111"),
          nameZ(name: "444876"),
          nameZ(name: "879789"),
        ]),
        nameX(id: 2, name: "تدبيس ركن", name_Z: [
          nameZ(name: "222222"),
          nameZ(name: "111111"),
          nameZ(name: "444876"),
          nameZ(name: "879789"),
        ]),
      ]),
      street(id: 1, name: 'ملون', name_x: [
        nameX(id: 0, name: "بدون تغليف", name_Z: [
          nameZ(name: "111111"),
          nameZ(name: "222222"),
        ]),
        nameX(id: 1, name: "حافظ إنبوبي", name_Z: [
          nameZ(name: "222222"),
          nameZ(name: "111111"),
          nameZ(name: "444876"),
          nameZ(name: "879789"),
        ]),
        nameX(id: 2, name: "تدبيس ركن", name_Z: [
          nameZ(name: "222222"),
          nameZ(name: "111111"),
          nameZ(name: "444876"),
          nameZ(name: "879789"),
        ]),
      ]),
    ]),
    Neighborhood(id: 2, name: 'لاصق', strt: [
      street(id: 0, name: ' اسود', name_x: [
        nameX(id: 0, name: "بدون تغليف", name_Z: [
          nameZ(name: "111111"),
          nameZ(name: "222222"),
        ]),
        nameX(id: 1, name: "حافظ إنبوبي", name_Z: [
          nameZ(name: "222222"),
          nameZ(name: "111111"),
          nameZ(name: "444876"),
          nameZ(name: "879789"),
        ]),
        nameX(id: 2, name: "تدبيس ركن", name_Z: [
          nameZ(name: "222222"),
          nameZ(name: "111111"),
          nameZ(name: "444876"),
          nameZ(name: "879789"),
        ]),
      ]),
      street(id: 1, name: 'ملون', name_x: [
        nameX(id: 0, name: "بدون تغليف", name_Z: [
          nameZ(name: "111111"),
          nameZ(name: "222222"),
        ]),
        nameX(id: 1, name: "حافظ إنبوبي", name_Z: [
          nameZ(name: "222222"),
          nameZ(name: "111111"),
          nameZ(name: "444876"),
          nameZ(name: "879789"),
        ]),
      ]),
    ]),
    Neighborhood(id: 3, name: 'مقوي', strt: [
      street(id: 0, name: 'اسود', name_x: [
        nameX(id: 0, name: "بدون تغليف", name_Z: [
          nameZ(name: "111111"),
          nameZ(name: "222222"),
        ]),
        nameX(id: 1, name: "حافظ إنبوبي", name_Z: [
          nameZ(name: "222222"),
          nameZ(name: "111111"),
          nameZ(name: "444876"),
          nameZ(name: "879789"),
        ]),
        nameX(id: 2, name: "تدبيس ركن", name_Z: [
          nameZ(name: "222222"),
          nameZ(name: "111111"),
          nameZ(name: "444876"),
          nameZ(name: "879789"),
        ]),
      ]),
      street(id: 1, name: 'ملون', name_x: [
        nameX(id: 0, name: "بدون تغليف", name_Z: [
          nameZ(name: "111111"),
          nameZ(name: "222222"),
        ]),
        nameX(id: 1, name: "حافظ إنبوبي", name_Z: [
          nameZ(name: "222222"),
          nameZ(name: "111111"),
          nameZ(name: "444876"),
          nameZ(name: "879789"),
        ]),
        nameX(id: 2, name: "تدبيس ركن", name_Z: [
          nameZ(name: "222222"),
          nameZ(name: "111111"),
          nameZ(name: "444876"),
          nameZ(name: "879789"),
        ]),
      ]),
    ]),
  ]),
  city(id: 4, name: "A4", Nbrhood: [
    Neighborhood(id: 0, name: 'عادي', strt: [
      street(id: 0, name: ' تلقائي (طولي/عرضي)', name_x: [
        nameX(id: 0, name: "بدون تغليف", name_Z: [
          nameZ(name: "0"),
          nameZ(name: "0"),
        ]),
        nameX(id: 1, name: "حافظ إنبوبي", name_Z: [
          nameZ(name: "222222"),
          nameZ(name: "111111"),
          nameZ(name: "444876"),
          nameZ(name: "879789"),
        ]),
      ]),
      street(id: 1, name: 'شريحتين بوقة طولية', name_x: [
        nameX(id: 0, name: "بدون تغليف", name_Z: [
          nameZ(name: "111111"),
          nameZ(name: "222222"),
        ]),
        nameX(id: 1, name: "حافظ إنبوبي", name_Z: [
          nameZ(name: "222222"),
          nameZ(name: "111111"),
          nameZ(name: "444876"),
          nameZ(name: "879789"),
        ]),
      ]),
      street(id: 0, name: ' ٤ شرائح بورقة طولية', name_x: [
        nameX(id: 0, name: "بدون تغليف", name_Z: [
          nameZ(name: "0"),
          nameZ(name: "0"),
        ]),
        nameX(id: 1, name: "حافظ إنبوبي", name_Z: [
          nameZ(name: "222222"),
          nameZ(name: "111111"),
          nameZ(name: "444876"),
          nameZ(name: "879789"),
        ]),
      ]),
      street(id: 1, name: 'شريحتين بوقة عرضية', name_x: [
        nameX(id: 0, name: "بدون تغليف", name_Z: [
          nameZ(name: "111111"),
          nameZ(name: "222222"),
        ]),
        nameX(id: 1, name: "حافظ إنبوبي", name_Z: [
          nameZ(name: "222222"),
          nameZ(name: "111111"),
          nameZ(name: "444876"),
          nameZ(name: "879789"),
        ]),
      ]),
      street(id: 0, name: ' ٤ شرائح بورقة عرضية', name_x: [
        nameX(id: 0, name: "بدون تغليف", name_Z: [
          nameZ(name: "0"),
          nameZ(name: "0"),
        ]),
        nameX(id: 1, name: "حافظ إنبوبي", name_Z: [
          nameZ(name: "222222"),
          nameZ(name: "111111"),
          nameZ(name: "444876"),
          nameZ(name: "879789"),
        ]),
      ]),
    ]),
    Neighborhood(id: 1, name: 'فلم أبيض', strt: [
      street(id: 0, name: 'اسود', name_x: [
        nameX(id: 0, name: "عماره", name_Z: [
          nameZ(name: "عماره"),
        ]),
        nameX(id: 1, name: "oiuy", name_Z: [
          nameZ(name: "عماره"),
        ]),
        nameX(id: 2, name: "jjk", name_Z: [
          nameZ(name: "ناتتن"),
        ]),
        nameX(id: 3, name: "oiuh", name_Z: [
          nameZ(name: "ناتتن"),
        ])
      ]),
      street(id: 1, name: 'ملون', name_x: [
        nameX(id: 0, name: "iuy", name_Z: [
          nameZ(name: "ناتتننممتنتم"),
        ]),
        nameX(id: 1, name: "jjjk", name_Z: [
          nameZ(name: "ناتتننممتنتممنتم"),
        ]),
        nameX(id: 2, name: "hjk", name_Z: [
          nameZ(name: "ناتتننممتنتممنتمتنمن"),
        ]),
        nameX(id: 3, name: "lljk", name_Z: [
          nameZ(name: "٨٧٦٥"),
        ]),
        nameX(id: 4, name: "jhj", name_Z: [
          nameZ(name: "٨٧٦٥نت"),
        ]),
      ]),
    ]),
  ]),
  city(id: 5, name: "A5", Nbrhood: [
    Neighborhood(id: 0, name: 'عادي', strt: [
      street(id: 0, name: ' اسود', name_x: [
        nameX(id: 0, name: "بدون تغليف", name_Z: [
          nameZ(name: "0"),
          nameZ(name: "0"),
        ]),
        nameX(id: 1, name: "حافظ إنبوبي", name_Z: [
          nameZ(name: "222222"),
          nameZ(name: "111111"),
          nameZ(name: "444876"),
          nameZ(name: "879789"),
        ]),
      ]),
      street(id: 1, name: 'ملون', name_x: [
        nameX(id: 0, name: "بدون تغليف", name_Z: [
          nameZ(name: "111111"),
          nameZ(name: "222222"),
        ]),
        nameX(id: 1, name: "حافظ إنبوبي", name_Z: [
          nameZ(name: "222222"),
          nameZ(name: "111111"),
          nameZ(name: "444876"),
          nameZ(name: "879789"),
        ]),
      ]),
    ]),
    Neighborhood(id: 1, name: 'فلم أبيض', strt: [
      street(id: 0, name: 'اسود', name_x: [
        nameX(id: 0, name: "عماره", name_Z: [
          nameZ(name: "عماره"),
        ]),
        nameX(id: 1, name: "oiuy", name_Z: [
          nameZ(name: "عماره"),
        ]),
        nameX(id: 2, name: "jjk", name_Z: [
          nameZ(name: "ناتتن"),
        ]),
        nameX(id: 3, name: "oiuh", name_Z: [
          nameZ(name: "ناتتن"),
        ])
      ]),
      street(id: 1, name: 'ملون', name_x: [
        nameX(id: 0, name: "iuy", name_Z: [
          nameZ(name: "ناتتننممتنتم"),
        ]),
        nameX(id: 1, name: "jjjk", name_Z: [
          nameZ(name: "ناتتننممتنتممنتم"),
        ]),
        nameX(id: 2, name: "hjk", name_Z: [
          nameZ(name: "ناتتننممتنتممنتمتنمن"),
        ]),
        nameX(id: 3, name: "lljk", name_Z: [
          nameZ(name: "٨٧٦٥"),
        ]),
        nameX(id: 4, name: "jhj", name_Z: [
          nameZ(name: "٨٧٦٥نت"),
        ]),
      ]),
    ]),
  ]),
];
//-----------------------------------------------------------
