/* /* import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:hive_flutter/hive_flutter.dart';

enum Option { DELETE, UPDATE, INSERT }

class MyHomePage90 extends StatefulWidget {
  @override
  _MyHomePage90State createState() => _MyHomePage90State();
}

class _MyHomePage90State extends State<MyHomePage90> {
  Box<String> friendsBox;
  TextEditingController idController = TextEditingController();
  TextEditingController valueController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    friendsBox = Hive.box<String>("friends"); //name same as openBox
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hive"),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
              child: ValueListenableBuilder(
            valueListenable: friendsBox.listenable(),
            // import hive_flutter package if listenable() throw error
            builder: (context, Box<String> friends, _) => friends.values.isEmpty
                ? Center(
                    child: Text(
                      "No data is Stored",
                      textScaleFactor: 1.5,
                    ),
                  )
                : ListView.separated(
                    itemBuilder: (context, index) {
                      String key = friends.keys.toList()[index];
                      String value = friends.get(key);
                      return ListTile(
                        title: Text(
                          value,
                          textScaleFactor: 1.5,
                        ),
                        subtitle: Text(
                          key,
                          textScaleFactor: 1.5,
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => Divider(),
                    itemCount: friends.keys.toList().length,
                  ),
          )),
          Container(
            height: 60.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                MaterialButton(
                  child: Text(
                    "Insert",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.green,
                  onPressed: () {
                    showMeDialog(context, Option.INSERT);
                  },
                ),
                MaterialButton(
                  child: Text(
                    "Update",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.green,
                  onPressed: () {
                    showMeDialog(context, Option.UPDATE);
                  },
                ),
                MaterialButton(
                  child: Text(
                    "Delete",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.green,
                  onPressed: () {
                    showMeDialog(context, Option.DELETE);
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void showMeDialog(BuildContext context, Option option) {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: Container(
              padding: EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TextField(
                    controller: idController,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Option.DELETE == option
                      ? SizedBox()
                      : TextField(
                          controller: valueController,
                        ),
                  SizedBox(
                    height: 16,
                  ),
                  FlatButton(
                    child: Text("Submit"),
                    onPressed: () {
                      String key = idController.text ?? "";
                      String value = valueController.text ?? "";
                      switch (option) {
                        case Option.INSERT:
                          friendsBox.put(key, value);
                          Navigator.pop(context);
                          break;
                        case Option.UPDATE:
                          friendsBox.put(key, value);
                          Navigator.pop(context);
                          break;
                        case Option.DELETE:
                          friendsBox.delete(key);
                          Navigator.pop(context);
                          break;
                      }
                    },
                  )
                ],
              ),
            ),
          );
        });
  }
}
 */

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:ptint/Hype/data.dart';
import 'package:ptint/themes/AppTheme.dart';
import 'package:ptint/themes/LightColor.dart';
import 'package:ptint/themes/TitleText.dart';

class ViewDataScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var box = Hive.box('example_db');
    List<Map<dynamic, dynamic>> data = box.get('data');
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Hive View'),
      ),
      body: Container(
        child: data == null
            ? Container(child: Center(child: Text("List is empty")))
            : ListView.builder(
                itemCount: data.length,
                shrinkWrap: true,
                padding: EdgeInsets.all(16),
                itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          String key = box.keys.toList()[index];
                          String value = box.getAt(index);
                          return ListTile(
                            title: Text(
                              value,
                              textScaleFactor: 1.5,
                            ),
                            subtitle: Text(
                              key,
                              textScaleFactor: 1.5,
                            ),
                          );
                        },
                        separatorBuilder: (context, index) => Divider(),
                        itemCount: box.keys
                            .toList()
                            .length) /*  Text(
                    data[index]['name'],
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ), */
                    ),
              ),
      ),
    );
  }
}



class DataInsertScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Hive Insert'),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: MaterialButton(
                onPressed: () async{
                  var box = Hive.box('example_db');
                  box.put('data', dataToInsert);
                },
                color: Colors.blue,
                child: Text('INSERT DATA'),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Center(
              child: MaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ViewDataScreen(),
                    ),
                  );
                },
                color: Colors.blue,
                child: Text('VIEW DATA'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
//!
enum Option { DELETE, UPDATE, INSERT }

class MyHomePage90 extends StatefulWidget {
  @override
  _MyHomePage90State createState() => _MyHomePage90State();
}

class _MyHomePage90State extends State<MyHomePage90> {
  Box<String> friendsBox;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // friendsBox = Hive.box<String>("friends");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(""),
        ),
        body: Column(children: <Widget>[
          Expanded(
              child: ValueListenableBuilder(
                  valueListenable: friendsBox.listenable(),
                  builder: (context, Box<String> friends, _) =>
                      friends.values.isEmpty
                          ? Center(
                              child: Text(
                                "No data is Stored",
                                textScaleFactor: 1.5,
                              ),
                            )
                          : ListView.separated(
                              itemBuilder: (context, index) {
                                String key = friends.keys.toList()[index];
                                String value = friends.getAt(index);
                                return ListTile(
                                  title: Text(
                                    value,
                                    textScaleFactor: 1.5,
                                  ),
                                  subtitle: Text(
                                    key,
                                    textScaleFactor: 1.5,
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) => Divider(),
                              itemCount: friends.keys.toList().length))),
          Container(
              height: 60.0,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        showMeDialog(context, Option.INSERT);
                      },
                    ),
                    IconButton(
                        icon: Icon(Icons.update),
                        onPressed: () {
                          showMeDialog(context, Option.UPDATE);
                        }),
                    IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          showMeDialog(context, Option.DELETE);
                        })
                  ]))
        ]));
  }

  //!
  bool isSelected = false;
  List savePdf = [];

  bool isLoading = true;
  bool activation = true;

  String name = "طباعة طاقية او قبعة";
//!
  String radioItemHolder = "اسود";
  String radioItemHolderColor = "ملون";
  String radioItemHolderdirection = "ملون";

  // Group Value for Radio Button.
  int id = 1;
  int idColor = 1;
  int iddirection = 1;
//List _lists=["1":colorList,"2":nList,"3":xList];

  List<Item> colorList = [
    Item(
      index: 0,
      title: "a",
    ),
    Item(
      index: 1,
      title: "b",
    ),
  ];
  List<Item> nList = [
    Item(
      index: 1,
      title: "c",
    ),
    Item(
      index: 2,
      title: "d",
    ),
  ];

  List<Item> xLis = [
    Item(
      index: 1,
      title: "e",
    ),
    Item(
      index: 2,
      title: "f",
    ),
  ];

  List<Item> xList = [
    Item(
      index: 1,
      title: "d",
    ),
    Item(
      index: 2,
      title: "e",
    ),
  ];
  int numOfItems = 1;

  void showMeDialog(BuildContext context, Option option) {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: Container(
              padding: EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                      height: MediaQuery.of(context).size.height / 1.4,
                      child: Scaffold(
                          body: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                            Text(
                              "*",
                              style: TextStyle(
                                  //   fontSize: _fullHeight / 60,
                                  color: LightColor.subTitleTextColor,
                                  fontWeight: FontWeight.w900),
                            ),
                            Container(
                                height: AppTheme.fullHeight(context) / 15,
                                child: Column(
                                    children: nList
                                        .map((data) => Flexible(
                                            fit: FlexFit.tight,
                                            child: RadioListTile(
                                                title:
                                                    TEXT(txt: "${data.title}"),
                                                groupValue: id,
                                                value: data.index,
                                                onChanged: (val) {
                                                  setState(() {
                                                    radioItemHolder =
                                                        data.title;
                                                    id = data.index;
                                                  });
                                                })))
                                        .toList())),
                            Text(
                              "*",
                              style: TextStyle(
                                  // fontSize: _fullHeight / 60,
                                  color: LightColor.subTitleTextColor,
                                  fontWeight: FontWeight.w900),
                            ),
                            Container(
                                height: AppTheme.fullHeight(context) / 10,
                                child: Column(
                                    children: colorList
                                        .map((data) => Flexible(
                                            fit: FlexFit.tight,
                                            child: RadioListTile(
                                                title:
                                                    TEXT(txt: "${data.title}"),
                                                groupValue: idColor,
                                                value: data.index,
                                                onChanged: (val) {
                                                  setState(() {
                                                    radioItemHolderColor =
                                                        data.title;
                                                    idColor = data.index;
                                                  });
                                                })))
                                        .toList())),
                            Text(
                              "*",
                              style: TextStyle(
                                  //  fontSize: _fullHeight / 60,
                                  color: LightColor.subTitleTextColor,
                                  fontWeight: FontWeight.w900),
                            ),
                            Container(
                                height: AppTheme.fullHeight(context) / 15,
                                child: Column(
                                    children: xList
                                        .map((data) => Flexible(
                                            fit: FlexFit.tight,
                                            child: RadioListTile(
                                                title:
                                                    TEXT(txt: "${data.title}"),
                                                groupValue: iddirection,
                                                value: data.index,
                                                onChanged: (val) {
                                                  setState(() {
                                                    radioItemHolderdirection =
                                                        data.title;
                                                    iddirection = data.index;
                                                  });
                                                })))
                                        .toList())),
                          ]))),
                  FlatButton(
                    child: Text("ارسال"),
                    onPressed: () {
                      String key;
                      String value;

                      if (key == null) {
                        key = idColor.toString();
                        key = id.toString();
                        key = iddirection.toString();
                      } else {
                        return "";
                      }

                      if (value == null) {
                        value = radioItemHolder.toString();
                        value = radioItemHolderColor.toString();
                        value = radioItemHolderdirection.toString();
                      } else {
                        return "";
                      }

                      //= radioItemHolder ?? "";
                      switch (option) {
                        case Option.INSERT:
                          friendsBox.put(key, value);
                          Navigator.pop(context);
                          break;
                        case Option.UPDATE:
                          friendsBox.put(key, value);
                          Navigator.pop(context);
                          break;
                        case Option.DELETE:
                          friendsBox.delete(key);
                          Navigator.pop(context);
                          break;
                      }
                    },
                  )
                ],
              ),
            ),
          );
        });
  }
}
 */
