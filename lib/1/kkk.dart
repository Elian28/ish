import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Repository repo = Repository();

  List<String> _states = ["Paper size"];
  List<String> _lgas = ["Choose .."];
  String _selectedState = "Paper size";
  String _selectedLGA = "Choose ..";

  @override
  void initState() {
    _states = List.from(_states)..addAll(repo.getStates());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(""),
          elevation: 0.1,
        ),
        body: SafeArea(
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 30),
                child: Column(children: <Widget>[
                  DropdownButton<String>(
                    isExpanded: true,
                    items: _states.map((String dropDownStringItem) {
                      return DropdownMenuItem<String>(
                        value: dropDownStringItem,
                        child: Text(dropDownStringItem),
                      );
                    }).toList(),
                    onChanged: (value) => _onSelectedState(value),
                    value: _selectedState,
                  ),
                  DropdownButton<String>(
                      isExpanded: true,
                      items: _lgas.map((String dropDownStringItem) {
                        return DropdownMenuItem<String>(
                          value: dropDownStringItem,
                          child: Text(dropDownStringItem),
                        );
                      }).toList(),
                      onChanged: (value) => _onSelectedLGA(value),
                      value: _selectedLGA)
                ]))));
  }

  void _onSelectedState(String value) {
    setState(() {
      _selectedLGA = "Choose ..";
      _lgas = ["Choose .."];
      _selectedState = value;
      _lgas = List.from(_lgas)..addAll(repo.getLocalByState(value));
    });
  }

  void _onSelectedLGA(String value) {
    setState(() => _selectedLGA = value);
  }
}

//
class Repository {

  List<Map> getAll() => _nigeria;

  getLocalByState(String state) => _nigeria
      .map((map) => StateModel.fromJson(map))
      .where((item) => item.state == state)
      .map((item) => item.lgas)
      .expand((i) => i)
      .toList();

  List<String> getStates() => _nigeria
      .map((map) => StateModel.fromJson(map))
      .map((item) => item.state)
      .toList();

  List _nigeria = [
    {
      "state": "مكةالمكرممة",
      "alias": "مكةالمكرممة",
      "lgas": [
        "razan1",
        "razan2",
        "razan3",
        "razan4",
        "razan5",
        "razan6",
        "razan7",
        "razan8",
        "razan9",
        "razan10",
      ]
    },
    {
      "state": "المدينه",
      "alias": "المدينه",
      "lgas": [
        "razag1",
        "razag2",
        "razag3",
        "razag4",
        "razag5",
        "razag6",
        "razag7",
        "razag8",
        "razag9",
        "razag10",
      ]
    },
    {
      "state": "جدة",
      "alias": "جدة",
      "lgas": [
        "elean1",
        "elean2",
        "elean3",
        "elean4",
        "elean5",
        "elean6",
        "elean7",
        "elean8",
        "elean9",
        "elean10",
      ]
    },
    {
      "state": "الرياض",
      "alias": "الرياض",
      "lgas": [
        "rawan1",
        "rawan2",
        "rawan3",
        "rawan4",
        "rawan5",
        "rawan6",
        "rawan7",
        "rawan8",
        "rawan9",
        "rawan10",
      ]
    },
    {
      "state": "الدممام",
      "alias": "الدممام",
      "lgas": [
        "renad1",
        "renad2",
        "renad3",
        "renad4",
        "renad5",
        "renad6",
        "renad7",
        "renad8",
        "renad9",
        "renad10",
      ]
    },
    {
      "state": "الخبر",
      "alias": "الخبر",
      "lgas": [
        "retal1",
        "retal2",
        "retal3",
        "retal4",
        "retal5",
        "retal6",
        "retal7",
        "retal8",
        "retal9",
        "retal10",
      ]
    },
  ];
}

class StateModel {
  String state;
  String alias;
  List<String> lgas;

  StateModel({this.state, this.alias, this.lgas});

  StateModel.fromJson(Map<String, dynamic> json) {
    state = json['state'];
    alias = json['alias'];
    lgas = json['lgas'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['state'] = this.state;
    data['alias'] = this.alias;
    data['lgas'] = this.lgas;
    return data;
  }
}
