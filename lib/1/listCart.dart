//city(Neighborhood(street(street1)))
class city {
  int id;
  String name;
  List<Neighborhood> Nbrhood;

  city({this.id, this.name, this.Nbrhood});
}

//l
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

List listdata = [
  city(id: 0, name: "كرت سميك حراري", Nbrhood: [
    Neighborhood(id: 0, name: 'اختيار العدد', strt: [
      street(id: 0, name: ' وجة الطباعة', name_x: [
        nameX(id: 0, name: "نوع القصة", name_Z: [
          nameZ(name: "0"),
        ]),
        nameX(id: 1, name: "مقرم", name_Z: [
          nameZ(name: "222222"),
        ]),
        nameX(id: 2, name: "قصة خاصة", name_Z: [
          nameZ(name: "222222"),
        ]),
      ]),
      street(id: 1, name: 'وجهين', name_x: [
        nameX(id: 0, name: "بدون تغليف", name_Z: [
          nameZ(name: "111111"),
        ]),
        nameX(id: 1, name: "حافظ إنبوبي", name_Z: [
          nameZ(name: "879789"),
        ]),
      ]),
    ]),
    Neighborhood(id: 1, name: '1000', strt: [
      street(id: 0, name: ' اسود', name_x: [
        nameX(id: 1, name: "بدون تغليف", name_Z: [
          nameZ(name: "0"),
        ]),
        nameX(id: 1, name: "حافظ إنبوبي", name_Z: [
          nameZ(name: "222222"),
        ]),
      ]),
      street(id: 1, name: 'ملون', name_x: [
        nameX(id: 0, name: "بدون تغليف", name_Z: [
          nameZ(name: "222222"),
        ]),
        nameX(id: 1, name: "حافظ إنبوبي", name_Z: [
          nameZ(name: "222222"),
        ]),
      ]),
    ]),
    Neighborhood(id: 2, name: '2000', strt: [
      street(id: 0, name: ' اسود', name_x: [
        nameX(id: 1, name: "بدون تغليف", name_Z: [
          nameZ(name: "0"),
        ]),
        nameX(id: 1, name: "حافظ إنبوبي", name_Z: [
          nameZ(name: "222222"),
        ]),
      ]),
      street(id: 1, name: 'ملون', name_x: [
        nameX(id: 0, name: "بدون تغليف", name_Z: [
          nameZ(name: "222222"),
        ]),
        nameX(id: 1, name: "حافظ إنبوبي", name_Z: [
          nameZ(name: "222222"),
        ]),
      ]),
    ]),
    Neighborhood(id: 3, name: '3000', strt: [
      street(id: 0, name: ' اسود', name_x: [
        nameX(id: 1, name: "بدون تغليف", name_Z: [
          nameZ(name: "0"),
        ]),
        nameX(id: 1, name: "حافظ إنبوبي", name_Z: [
          nameZ(name: "222222"),
        ]),
      ]),
      street(id: 1, name: 'ملون', name_x: [
        nameX(id: 0, name: "بدون تغليف", name_Z: [
          nameZ(name: "222222"),
        ]),
        nameX(id: 1, name: "حافظ إنبوبي", name_Z: [
          nameZ(name: "222222"),
        ]),
      ]),
    ]),
  ]),

  //!
  city(id: 1, name: "بطاقات بلاستيك id", Nbrhood: [
    Neighborhood(id: 0, name: 'اختيار العدد', strt: [
      street(id: 0, name: ' وجة الطباعة', name_x: [
        nameX(id: 0, name: "نوع القصة", name_Z: [
          nameZ(name: "0"),
        ]),
        nameX(id: 1, name: "مقرم", name_Z: [
          nameZ(name: "222222"),
        ]),
        nameX(id: 2, name: "قصة خاصة", name_Z: [
          nameZ(name: "222222"),
        ]),
      ]),
      street(id: 1, name: 'وجهين', name_x: [
        nameX(id: 0, name: "بدون تغليف", name_Z: [
          nameZ(name: "111111"),
        ]),
        nameX(id: 1, name: "حافظ إنبوبي", name_Z: [
          nameZ(name: "879789"),
        ]),
      ]),
    ]),
    Neighborhood(id: 1, name: '10', strt: [
      street(id: 0, name: ' اسود', name_x: [
        nameX(id: 1, name: "بدون تغليف", name_Z: [
          nameZ(name: "0"),
        ]),
        nameX(id: 1, name: "حافظ إنبوبي", name_Z: [
          nameZ(name: "222222"),
        ]),
      ]),
      street(id: 1, name: 'ملون', name_x: [
        nameX(id: 0, name: "بدون تغليف", name_Z: [
          nameZ(name: "222222"),
        ]),
        nameX(id: 1, name: "حافظ إنبوبي", name_Z: [
          nameZ(name: "222222"),
        ]),
      ]),
    ]),
    Neighborhood(id: 2, name: '20', strt: [
      street(id: 0, name: ' اسود', name_x: [
        nameX(id: 1, name: "بدون تغليف", name_Z: [
          nameZ(name: "0"),
        ]),
        nameX(id: 1, name: "حافظ إنبوبي", name_Z: [
          nameZ(name: "222222"),
        ]),
      ]),
      street(id: 1, name: 'ملون', name_x: [
        nameX(id: 0, name: "بدون تغليف", name_Z: [
          nameZ(name: "222222"),
        ]),
        nameX(id: 1, name: "حافظ إنبوبي", name_Z: [
          nameZ(name: "222222"),
        ]),
      ]),
    ]),
    Neighborhood(id: 3, name: '50', strt: [
      street(id: 0, name: ' اسود', name_x: [
        nameX(id: 1, name: "بدون تغليف", name_Z: [
          nameZ(name: "0"),
        ]),
        nameX(id: 1, name: "حافظ إنبوبي", name_Z: [
          nameZ(name: "222222"),
        ]),
      ]),
      street(id: 1, name: 'ملون', name_x: [
        nameX(id: 0, name: "بدون تغليف", name_Z: [
          nameZ(name: "222222"),
        ]),
        nameX(id: 1, name: "حافظ إنبوبي", name_Z: [
          nameZ(name: "222222"),
        ]),
      ]),
    ]),
    Neighborhood(id: 3, name: '100', strt: [
      street(id: 0, name: ' اسود', name_x: [
        nameX(id: 1, name: "بدون تغليف", name_Z: [
          nameZ(name: "0"),
        ]),
        nameX(id: 1, name: "حافظ إنبوبي", name_Z: [
          nameZ(name: "222222"),
        ]),
      ]),
      street(id: 1, name: 'ملون', name_x: [
        nameX(id: 0, name: "بدون تغليف", name_Z: [
          nameZ(name: "222222"),
        ]),
        nameX(id: 1, name: "حافظ إنبوبي", name_Z: [
          nameZ(name: "222222"),
        ]),
      ]),
    ]),
    Neighborhood(id: 3, name: '200', strt: [
      street(id: 0, name: ' اسود', name_x: [
        nameX(id: 1, name: "بدون تغليف", name_Z: [
          nameZ(name: "0"),
        ]),
        nameX(id: 1, name: "حافظ إنبوبي", name_Z: [
          nameZ(name: "222222"),
        ]),
      ]),
      street(id: 1, name: 'ملون', name_x: [
        nameX(id: 0, name: "بدون تغليف", name_Z: [
          nameZ(name: "222222"),
        ]),
        nameX(id: 1, name: "حافظ إنبوبي", name_Z: [
          nameZ(name: "222222"),
        ]),
      ]),
    ])
  ]),

  city(id: 2, name: "كرت شفاف", Nbrhood: [
    Neighborhood(id: 1, name: '500', strt: [
      street(id: 0, name: ' افقي', name_x: [
        nameX(id: 0, name: "جهه الطباعة", name_Z: [
          nameZ(name: "0"),
        ]),
        nameX(id: 1, name: "جهه واحدة", name_Z: [
          nameZ(name: "222222"),
        ]),
      ]),
      street(id: 1, name: 'عامودي', name_x: [
        nameX(id: 0, name: "بدون تغليف", name_Z: [
          nameZ(name: "111111"),
        ]),
        nameX(id: 1, name: "حافظ إنبوبي", name_Z: [
          nameZ(name: "222222"),
        ]),
      ]),
    ]),
    Neighborhood(id: 1, name: '1000', strt: [
      street(id: 0, name: ' افقي', name_x: [
        nameX(id: 0, name: "بدون تغليف", name_Z: [
          nameZ(name: "0"),
        ]),
        nameX(id: 1, name: "حافظ إنبوبي", name_Z: [
          nameZ(name: "222222"),
        ]),
      ]),
      street(id: 1, name: 'عامودي', name_x: [
        nameX(id: 0, name: "بدون تغليف", name_Z: [
          nameZ(name: "111111"),
        ]),
        nameX(id: 1, name: "حافظ إنبوبي", name_Z: [
          nameZ(name: "222222"),
        ]),
      ]),
    ]),
  ]),

  city(id: 3, name: "كرت فيزيت سميك نافر مقرم الزوايا", Nbrhood: [
    Neighborhood(id: 0, name: '1000 كرت', strt: [
      street(id: 0, name: ' وجهين', name_x: [
        nameX(id: 0, name: "مقرم", name_Z: [
          nameZ(name: "111111"),
        ]),
        nameX(id: 1, name: "قصة خاصة", name_Z: [
          nameZ(name: "222222"),
        ]),
      ]),
    ]),
    Neighborhood(id: 1, name: '2000 كرت', strt: [
      street(id: 0, name: 'اسود', name_x: [
        nameX(id: 0, name: "بدون تغليف", name_Z: [
          nameZ(name: "111111"),
        ]),
        nameX(id: 1, name: "حافظ إنبوبي", name_Z: [
          nameZ(name: "222222"),
        ]),
      ]),
      street(id: 1, name: 'ملون', name_x: [
        nameX(id: 0, name: "بدون تغليف", name_Z: [
          nameZ(name: "222222"),
        ]),
        nameX(id: 1, name: "حافظ إنبوبي", name_Z: [
          nameZ(name: "222222"),
        ]),
      ]),
    ]),
    Neighborhood(id: 2, name: '3000 كرت', strt: [
      street(id: 0, name: ' اسود', name_x: [
        nameX(id: 0, name: "بدون تغليف", name_Z: [
          nameZ(name: "111111"),
        ]),
        nameX(id: 1, name: "حافظ إنبوبي", name_Z: [
          nameZ(name: "222222"),
        ]),
      ]),
      street(id: 1, name: 'ملون', name_x: [
        nameX(id: 0, name: "بدون تغليف", name_Z: [
          nameZ(name: "111111"),
        ]),
        nameX(id: 1, name: "حافظ إنبوبي", name_Z: [
          nameZ(name: "444876"),
        ]),
      ]),
    ]),
  ]),

  city(id: 4, name: "كرت فيزيت عادي", Nbrhood: [
    Neighborhood(id: 0, name: ' 100 كرت', strt: [
      street(id: 0, name: 'وجهه واحد', name_x: [
        nameX(id: 0, name: "250 غرام", name_Z: [
          nameZ(name: "111111"),
        ]),
        nameX(id: 1, name: "300 غرام", name_Z: [
          nameZ(name: "879789"),
        ]),
      ]),
      street(id: 1, name: 'وجهين', name_x: [
        nameX(id: 0, name: "بدون تغليف", name_Z: [
          nameZ(name: "111111"),
        ]),
        nameX(id: 1, name: "كيس شفاف", name_Z: [
          nameZ(name: "222222"),
        ]),
        nameX(id: 2, name: "تدبيس ركن", name_Z: [
          nameZ(name: "222222"),
        ]),
        //---------------------------------------
        nameX(id: 4, name: "تدبيس جانبي", name_Z: [
          nameZ(name: "222222"),
        ]),
        nameX(id: 5, name: " سلك", name_Z: [
          nameZ(name: "111111"),
        ]),
        nameX(id: 6, name: " بلاستك حلزوني", name_Z: [
          nameZ(name: "222222"),
        ]),
        //---------------------------------------
        nameX(id: 7, name: " تخييط", name_Z: [
          nameZ(name: "222222"),
        ]),
        nameX(id: 8, name: "كعب مسمار ", name_Z: [
          nameZ(name: "222222"),
        ]),
        nameX(id: 9, name: " كعب حراري", name_Z: [
          nameZ(name: "879789"),
        ]),
        //---------------------------------------

        nameX(id: 10, name: " ملف خرمين", name_Z: [
          nameZ(name: "222222"),
        ]),
        nameX(id: 11, name: " ملف ٣ أخرام", name_Z: [
          nameZ(name: "222222"),
        ]),
        //---------------------------------------
      ]),
    ]),
    Neighborhood(id: 1, name: '1000 كرت', strt: [
      street(id: 0, name: ' تلقائي (طولي/عررضي)', name_x: [
        nameX(id: 0, name: "بدون تغليف", name_Z: [
          nameZ(name: "111111"),
          nameZ(name: "222222"),
        ]),
        nameX(id: 1, name: "كيس شفاف", name_Z: [
          nameZ(name: "222222"),
          nameZ(name: "111111"),
          nameZ(name: "444876"),
          nameZ(name: "879789"),
        ]),
        nameX(id: 2, name: " سلك", name_Z: [
          nameZ(name: "222222"),
          nameZ(name: "111111"),
          nameZ(name: "444876"),
          nameZ(name: "879789"),
        ]),
        nameX(id: 3, name: "كعب مسمار ", name_Z: [
          nameZ(name: "222222"),
          nameZ(name: "111111"),
          nameZ(name: "444876"),
          nameZ(name: "879789"),
        ]),
        nameX(id: 4, name: " كعب حراري", name_Z: [
          nameZ(name: "222222"),
          nameZ(name: "111111"),
          nameZ(name: "444876"),
          nameZ(name: "879789"),
        ]),
        nameX(id: 5, name: " ملف خرمين", name_Z: [
          nameZ(name: "222222"),
          nameZ(name: "111111"),
          nameZ(name: "444876"),
          nameZ(name: "879789"),
        ]),
        nameX(id: 6, name: " ملف ٣ أخرام", name_Z: [
          nameZ(name: "222222"),
          nameZ(name: "111111"),
          nameZ(name: "444876"),
          nameZ(name: "879789"),
        ]),
        //---------------------------------------
      ]),
      street(id: 1, name: 'شريحتين بورقة طولي', name_x: [
        nameX(id: 0, name: "بدون تغليف", name_Z: [
          nameZ(name: "111111"),
          nameZ(name: "222222"),
        ]),
        nameX(id: 1, name: "كيس شفاف", name_Z: [
          nameZ(name: "222222"),
          nameZ(name: "111111"),
          nameZ(name: "444876"),
          nameZ(name: "879789"),
        ]),
        nameX(id: 2, name: " سلك", name_Z: [
          nameZ(name: "222222"),
          nameZ(name: "111111"),
          nameZ(name: "444876"),
          nameZ(name: "879789"),
        ]),
        nameX(id: 3, name: "كعب مسمار ", name_Z: [
          nameZ(name: "222222"),
          nameZ(name: "111111"),
          nameZ(name: "444876"),
          nameZ(name: "879789"),
        ]),
        nameX(id: 4, name: " كعب حراري", name_Z: [
          nameZ(name: "222222"),
          nameZ(name: "111111"),
          nameZ(name: "444876"),
          nameZ(name: "879789"),
        ]),
        nameX(id: 5, name: " ملف خرمين", name_Z: [
          nameZ(name: "222222"),
          nameZ(name: "111111"),
          nameZ(name: "444876"),
          nameZ(name: "879789"),
        ]),
        nameX(id: 6, name: " ملف ٣ أخرام", name_Z: [
          nameZ(name: "222222"),
          nameZ(name: "111111"),
          nameZ(name: "444876"),
          nameZ(name: "879789"),
        ]),
        //---------------------------------------
      ]),
      street(id: 2, name: 'شريحتين بورقة عرضي', name_x: [
        nameX(id: 0, name: "بدون تغليف", name_Z: [
          nameZ(name: "111111"),
          nameZ(name: "222222"),
        ]),
        nameX(id: 1, name: "كيس شفاف", name_Z: [
          nameZ(name: "222222"),
          nameZ(name: "111111"),
          nameZ(name: "444876"),
          nameZ(name: "879789"),
        ]),
        nameX(id: 2, name: " سلك", name_Z: [
          nameZ(name: "222222"),
          nameZ(name: "111111"),
          nameZ(name: "444876"),
          nameZ(name: "879789"),
        ]),
        nameX(id: 3, name: "كعب مسمار ", name_Z: [
          nameZ(name: "222222"),
          nameZ(name: "111111"),
          nameZ(name: "444876"),
          nameZ(name: "879789"),
        ]),
        nameX(id: 4, name: " كعب حراري", name_Z: [
          nameZ(name: "222222"),
          nameZ(name: "111111"),
          nameZ(name: "444876"),
          nameZ(name: "879789"),
        ]),
        nameX(id: 5, name: " ملف خرمين", name_Z: [
          nameZ(name: "222222"),
          nameZ(name: "111111"),
          nameZ(name: "444876"),
          nameZ(name: "879789"),
        ]),
        nameX(id: 6, name: " ملف ٣ أخرام", name_Z: [
          nameZ(name: "222222"),
          nameZ(name: "111111"),
          nameZ(name: "444876"),
          nameZ(name: "879789"),
        ]),
        //---------------------------------------
      ]),
      street(id: 3, name: '4 شرائع بورقة طولي', name_x: [
        nameX(id: 0, name: "بدون تغليف", name_Z: [
          nameZ(name: "111111"),
          nameZ(name: "222222"),
        ]),
        nameX(id: 1, name: "كيس شفاف", name_Z: [
          nameZ(name: "222222"),
          nameZ(name: "111111"),
          nameZ(name: "444876"),
          nameZ(name: "879789"),
        ]),
        nameX(id: 2, name: " سلك", name_Z: [
          nameZ(name: "222222"),
          nameZ(name: "111111"),
          nameZ(name: "444876"),
          nameZ(name: "879789"),
        ]),
        nameX(id: 3, name: "كعب مسمار ", name_Z: [
          nameZ(name: "222222"),
          nameZ(name: "111111"),
          nameZ(name: "444876"),
          nameZ(name: "879789"),
        ]),
        nameX(id: 4, name: " كعب حراري", name_Z: [
          nameZ(name: "222222"),
          nameZ(name: "111111"),
          nameZ(name: "444876"),
          nameZ(name: "879789"),
        ]),
        nameX(id: 5, name: " ملف خرمين", name_Z: [
          nameZ(name: "222222"),
          nameZ(name: "111111"),
          nameZ(name: "444876"),
          nameZ(name: "879789"),
        ]),
        nameX(id: 6, name: " ملف ٣ أخرام", name_Z: [
          nameZ(name: "222222"),
          nameZ(name: "111111"),
          nameZ(name: "444876"),
          nameZ(name: "879789"),
        ]),
        //---------------------------------------
      ]),
      street(id: 4, name: '4 شرائع بورقة عرضي', name_x: [
        nameX(id: 0, name: "بدون تغليف", name_Z: [
          nameZ(name: "111111"),
          nameZ(name: "222222"),
        ]),
        nameX(id: 1, name: "كيس شفاف", name_Z: [
          nameZ(name: "222222"),
          nameZ(name: "111111"),
          nameZ(name: "444876"),
          nameZ(name: "879789"),
        ]),
        nameX(id: 2, name: " سلك", name_Z: [
          nameZ(name: "222222"),
          nameZ(name: "111111"),
          nameZ(name: "444876"),
          nameZ(name: "879789"),
        ]),
        nameX(id: 3, name: "كعب مسمار ", name_Z: [
          nameZ(name: "222222"),
          nameZ(name: "111111"),
          nameZ(name: "444876"),
          nameZ(name: "879789"),
        ]),
        nameX(id: 4, name: " كعب حراري", name_Z: [
          nameZ(name: "222222"),
          nameZ(name: "111111"),
          nameZ(name: "444876"),
          nameZ(name: "879789"),
        ]),
        nameX(id: 5, name: " ملف خرمين", name_Z: [
          nameZ(name: "222222"),
          nameZ(name: "111111"),
          nameZ(name: "444876"),
          nameZ(name: "879789"),
        ]),
        nameX(id: 6, name: " ملف ٣ أخرام", name_Z: [
          nameZ(name: "222222"),
          nameZ(name: "111111"),
          nameZ(name: "444876"),
          nameZ(name: "879789"),
        ]),
        //---------------------------------------
      ]),
    ]),
    Neighborhood(id: 2, name: '2000 كرت', strt: [
      street(id: 0, name: '-', name_x: [
        nameX(id: 0, name: "بدون تغليف", name_Z: [
          nameZ(name: "111111"),
          nameZ(name: "222222"),
        ]),
        nameX(id: 1, name: "كيس شفاف", name_Z: [
          nameZ(name: "222222"),
          nameZ(name: "111111"),
          nameZ(name: "444876"),
          nameZ(name: "879789"),
        ]),
      ]),
    ]),
    Neighborhood(id: 3, name: '3000 كرت', strt: [
      street(id: 0, name: ' تلقائي (طولي/عررضي)', name_x: [
        nameX(id: 0, name: "بدون تغليف", name_Z: [
          nameZ(name: "111111"),
          nameZ(name: "222222"),
        ]),
        nameX(id: 1, name: "كيس شفاف", name_Z: [
          nameZ(name: "222222"),
          nameZ(name: "111111"),
          nameZ(name: "444876"),
          nameZ(name: "879789"),
        ]),
      ]),
      street(id: 1, name: 'شريحتين بورقة طولي', name_x: [
        nameX(id: 0, name: "بدون تغليف", name_Z: [
          nameZ(name: "111111"),
          nameZ(name: "222222"),
        ]),
        nameX(id: 1, name: "كيس شفاف", name_Z: [
          nameZ(name: "222222"),
          nameZ(name: "111111"),
          nameZ(name: "444876"),
          nameZ(name: "879789"),
        ]),
      ]),
      street(id: 2, name: 'شريحتين بورقة عرضي', name_x: [
        nameX(id: 0, name: "بدون تغليف", name_Z: [
          nameZ(name: "111111"),
          nameZ(name: "222222"),
        ]),
        nameX(id: 1, name: "كيس شفاف", name_Z: [
          nameZ(name: "222222"),
          nameZ(name: "111111"),
          nameZ(name: "444876"),
          nameZ(name: "879789"),
        ]),
      ]),
      street(id: 3, name: '4 شرائع بورقة طولي', name_x: [
        nameX(id: 0, name: "بدون تغليف", name_Z: [
          nameZ(name: "111111"),
          nameZ(name: "222222"),
        ]),
        nameX(id: 1, name: "كيس شفاف", name_Z: [
          nameZ(name: "222222"),
          nameZ(name: "111111"),
          nameZ(name: "444876"),
          nameZ(name: "879789"),
        ]),
      ]),
      street(id: 4, name: '4 شرائع بورقة عرضي', name_x: [
        nameX(id: 0, name: "بدون تغليف", name_Z: [
          nameZ(name: "111111"),
          nameZ(name: "222222"),
        ]),
        nameX(id: 1, name: "كيس شفاف", name_Z: [
          nameZ(name: "222222"),
        ]),
      ]),
    ]),
  ]),

  city(id: 5, name: "كرت مقمش", Nbrhood: [
    Neighborhood(id: 0, name: 'عادي', strt: [
      street(id: 0, name: 'ملون', name_x: [
        nameX(id: 0, name: "بدون تغليف", name_Z: [
          nameZ(name: "111111"),
          nameZ(name: "222222"),
        ]),
      ]),
    ]),
    Neighborhood(id: 1, name: ' لماع', strt: [
      street(id: 0, name: 'ملون', name_x: [
        nameX(id: 0, name: "بدون تغلليف", name_Z: [
          nameZ(name: "ناتتننممتنتم"),
        ]),
        nameX(id: 1, name: "سلك", name_Z: [
          nameZ(name: "ناتتننممتنتممنتم"),
        ]),
        nameX(id: 2, name: "كعب مسمار", name_Z: [
          nameZ(name: "ناتتننممتنتممنتمتنمن"),
        ]),
      ]),
    ]),
    Neighborhood(id: 2, name: 'مقوي', strt: [
      street(id: 0, name: 'ملون', name_x: [
        nameX(id: 0, name: "بدون تغليف", name_Z: [
          nameZ(name: "111111"),
        ]),
      ]),
    ]),
  ]),
  city(id: 6, name: "كروت البسة", Nbrhood: [
    Neighborhood(id: 0, name: 'عادي', strt: [
      street(id: 0, name: 'ملون', name_x: [
        nameX(id: 0, name: "بدون تغليف", name_Z: [
          nameZ(name: "111111"),
          nameZ(name: "222222"),
        ]),
      ]),
    ]),
    Neighborhood(id: 1, name: ' لماع', strt: [
      street(id: 0, name: 'ملون', name_x: [
        nameX(id: 0, name: "بدون تغلليف", name_Z: [
          nameZ(name: "ناتتننممتنتم"),
        ]),
        nameX(id: 1, name: "سلك", name_Z: [
          nameZ(name: "ناتتننممتنتممنتم"),
        ]),
        nameX(id: 2, name: "كعب مسمار", name_Z: [
          nameZ(name: "ناتتننممتنتممنتمتنمن"),
        ]),
      ]),
    ]),
    Neighborhood(id: 2, name: 'مقوي', strt: [
      street(id: 0, name: 'ملون', name_x: [
        nameX(id: 0, name: "بدون تغليف", name_Z: [
          nameZ(name: "111111"),
        ]),
      ]),
    ]),
  ]),
  city(id: 7, name: "كروت مغناطيس", Nbrhood: [
    Neighborhood(id: 0, name: 'اختيار العدد', strt: [
      street(id: 0, name: 'ملون', name_x: [
        nameX(id: 0, name: "بدون تغليف", name_Z: [
          nameZ(name: "111111"),
          nameZ(name: "222222"),
        ]),
      ]),
    ]),
    Neighborhood(id: 1, name: ' 1000', strt: [
      street(id: 0, name: 'ملون', name_x: [
        nameX(id: 0, name: "بدون تغلليف", name_Z: [
          nameZ(name: "ناتتننممتنتم"),
        ]),
        nameX(id: 1, name: "سلك", name_Z: [
          nameZ(name: "ناتتننممتنتممنتم"),
        ]),
        nameX(id: 2, name: "كعب مسمار", name_Z: [
          nameZ(name: "ناتتننممتنتممنتمتنمن"),
        ]),
      ]),
    ]),
    Neighborhood(id: 2, name: '2000', strt: [
      street(id: 0, name: 'ملون', name_x: [
        nameX(id: 0, name: "بدون تغليف", name_Z: [
          nameZ(name: "111111"),
        ]),
      ]),
    ]),
    Neighborhood(id: 2, name: '3000', strt: [
      /*  street(id: 0, name: 'ملون', name_x: [
        nameX(id: 0, name: "بدون تغليف", name_Z: [
          nameZ(name: "111111"),
        ]),
      ]),*/
    ]),
  ]),
];
