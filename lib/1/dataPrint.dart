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
