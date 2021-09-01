import 'package:flutter/material.dart';

class Neighborhood {
  int id;
  String name;
  List<street> strt;
  Neighborhood({this.id, this.name, this.strt});
}

class city {
  int id;
  String name;
  List<Neighborhood> Nbrhood;
  city({this.id, this.name, this.Nbrhood});
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
  city(id: 0, name: "طفل"),
  city(id: 1, name: "طفلة"),
  city(id: 2, name: "زوج"),
  city(id: 3, name: "زوجة"),
  city(id: 4, name: "جد"),
  city(id: 5, name: "جدة"),
];

class LK extends StatefulWidget {
  @override
  _LKState createState() => _LKState();
}

class _LKState extends State<LK> {
  List<DropdownMenuItem<int>> sizeDrop = [];
  // ignore: non_constant_identifier_names
  int selected_Papersize = 0;

  void loadCity() {
    sizeDrop = [];
    for (int i = 0; i < listdata.length; i++) {
      sizeDrop.add(new DropdownMenuItem(
          child: new Text("${listdata[i].name}"), value: i));
    }
  }

  @override
  Widget build(BuildContext context) {
    loadCity();

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
          padding: const EdgeInsets.fromLTRB(0, 8.0, 0, 10.0),
          child: Column(
            children: [
              Container(
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
                      value: selected_Papersize,
                      items: sizeDrop,
                      underline: Container(
                        height: 0,
                      ),
                      hint: new Text('حجم الورق'),
                      onChanged: (value) {
                        setState(() {
                          selected_Papersize = value;
                          selected_Papersize = value;
                        });
                        loadCity();
                      },
                    ),
                  )),
              Text(selected_Papersize.toString()),
            ],
          )),
    );
  }
}
