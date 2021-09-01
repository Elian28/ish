import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ptint/auth/Login..dart';
import 'package:ptint/yes/Settings.dart';

//# الاعدادات
class MMMM extends StatefulWidget {
  @override
  _MMMMState createState() => _MMMMState();
}

class _MMMMState extends State<MMMM> {
  bool switchs = false;
  bool value1 = false;
  bool value2 = false;

  void onChanged1(bool value) => setState(() => value1 = value);
  void onChanged2(bool value) => setState(() => value2 = value);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      // backgroundColor: Colors.grey[200],
      appBar: AppBar(title: Text("الاعدادات")),
      body: Column(
        children: <Widget>[
/*           Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
                color: Colors.cyan,
                image: DecorationImage(
                    image: NetworkImage(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcStFrtYVqibijXHBM_CR6LmifYmuRVcFzzH2gvbo7QvM09LsL_I"),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.all(Radius.circular(75.0)),
                boxShadow: [BoxShadow(blurRadius: 7.0, color: Colors.cyan)]),
          ),
          SizedBox(
            height: 40,
          ),
          Text("اسم المستخدم"),
          Container(
            height: 50,
            width: 350,
            decoration:
                BoxDecoration(border: Border.all(color: Colors.black26)),
            child: TextFormField(
              // controller: listOrder[index],
              decoration: InputDecoration(),
            ),
          ),

          Text("الايميل"),
          Container(
            height: 50,
            width: 350,
            decoration:
                BoxDecoration(border: Border.all(color: Colors.black26)),
            child: TextFormField(
              // controller: listOrder[index],
              decoration: InputDecoration(),
            ),
          ),

          Text("رقم الهاتف"),
          Container(
            height: 50,
            width: 350,
            decoration:
                BoxDecoration(border: Border.all(color: Colors.black26)),
            child: TextFormField(
              decoration: InputDecoration(),
            ),
          ),
          Text("رقم السري"),

          Container(
            height: 50,
            width: 350,
            decoration:
                BoxDecoration(border: Border.all(color: Colors.black26)),
            child: TextFormField(
              decoration: InputDecoration(),
            ),
          ), */
          Card(
            child: ListTile(
              title: Text("نوع الخدمة المقدمة"),
              onTap: () async {
//                FirebaseAuth.instance.currentUser().then((_) {
                var user = FirebaseAuth.instance.currentUser;
                if (user != null) {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Settings()));
                  /* Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (BuildContext context) => Settings()));*/
                } else {
                  // No User signed In.
                }
                /*
                FirebaseAuth.instance.currentUser.then((_) {
                  Navigator.of(context).pop();
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (BuildContext context) => Settings()));
                }).catchError((onError) {});
              
              */
              },
            ),
          ),
          Card(
            child: new ListTile(
                title: Text(
                  "  سياسة الاستخدام  ",
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {
                  _profilePush();
                }),
          ),

          //
          Card(
            child: new ListTile(
                title: Text(
                  "  الاسئلة الشائعة  ",
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => Settings()));
                }),
          ),
          //
          Card(
              child: new ListTile(
                  title: Text(
                    "   الشكاوي والاقتراحات  ",
                    style: TextStyle(fontSize: 20),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return DefaultTabController(
                          length: 2,
                          child: Scaffold(
                              appBar: AppBar(
                                title: Text("الشكاوي والاقتراحات"),
                                bottom: TabBar(
                                  tabs: <Widget>[
                                    Tab(
                                      text: "شكاوي",
                                    ),
                                    Tab(
                                      text: "اقتراحات",
                                    ),
                                  ],
                                ),
                              ),
                              body: TabBarView(children: <Widget>[
                                Center(
                                  child: Column(
                                    children: <Widget>[
                                      Text("رقم الطلب "),
                                      Text("عنوان الشكوى "),
                                      Text("اكتب تعليقك "),
                                    ],
                                  ),
                                ),
                                Center(
                                    child: Column(children: <Widget>[
                                  SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              55),
                                  TextFormField(
                                    // controller: nameController,
                                    decoration: InputDecoration(
                                      labelText: "عنوان المقترح",
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                    ),
                                    // The validator receives the text that the user has entered.
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Enter Pet Name';
                                      }
                                      return null;
                                    },
                                  ),
                                  SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              55),
                                  TextFormField(
                                      maxLength: 300,
                                      maxLines: 9,
                                      // controller: nameController,
                                      decoration: InputDecoration(
                                        labelText: "اكتب تعليقك",
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                      ),
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return 'Enter Pet Name';
                                        }
                                        return null;
                                      })
                                ]))
                              ])));
                    }));
                  })),
          //
          Card(
            child: new ListTile(
                title: Text(
                  "    شرح التطبيق   ",
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {
                  _passwordPush();
                }),
          ),
          //
          Card(
            child: new ListTile(
                title: Text(
                  "   اللغة   ",
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {
                  language();
                }),
          ),
          //
          Card(
            child: new ListTile(
              title: Text(
                "  قيم التطبيق  ",
                style: TextStyle(fontSize: 20),
              ),
              /*      onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => PushHelp()));
                } */
            ),
          ),
          //          //
          Divider(),
          ListTile(
            title: Text("تسجيل خروج"),
            leading: Icon(Icons.exit_to_app),
            onTap: () async {
              FirebaseAuth.instance.signOut().then((_) {
                Navigator.of(context).pop();
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (BuildContext context) => Login()));
              }).catchError((onError) {});
            },
          ),
/*           Card(
            child: SwitchListTile(
              value: switchs,
              onChanged: (bool value) {
                setState(() {
                  switchs = value;
                });
              },
              title: Text("إشعارات العروض"),
            ),
          ), */
        ],
      ),
    );
  }

  void language() async {
    // اللغة
    return showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FlatButton(
                child: Text('العربية'),
                onPressed: () {
                  //   Navigator.of(context).pop(context());
                  Navigator.pop(context);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50),
              child: FlatButton(
                child: Text('الانجليزية'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        );
      },
    );
  }

  void _passwordPush() {
    //تغير كلمة السر
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return new Scaffold(
          appBar: AppBar(title: Text("تغير كلمة السر")),
          body: ListView(
            children: <Widget>[
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'كلمة السر الحالية',
                ),
              ),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'كلمة السر الجديدة',
                ),
              ),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'اعادة كتابة كلمة السر ',
                ),
              ),
              RaisedButton(
                color: Colors.cyan[700],
                child: Text("ارسال"),
                onPressed: () {},
              ),
            ],
          ));
    }));
  }

  void _profilePush() {
    //معلومات الحساب
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return new Scaffold(
          appBar: AppBar(title: Text("البريد الالكتروني")),
          body: ListView(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: ' اسم المستخدم',
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'الاسم الاخير',
                ),
              ),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'تاريخ الميلاذ',
                ),
              ),
              RaisedButton(
                color: Colors.cyan[700],
                child: Text("ارسال"),
                onPressed: () {},
              ),
            ],
          ));
    }));
  }

  void neverSatisfied() async {
    // تسجيل الخروج
    return showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('تسجيل الخروج '),
          content: SingleChildScrollView(
            child: Text('هل انت متاكد من  انك تريد تسجيل الخروج'),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('متاكد'),
              onPressed: () {
                FirebaseAuth.instance.signOut().then((_) {
                  Navigator.of(context).pop();
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (BuildContext context) => Login()));
                }).catchError((onError) {});
                /*   ListTile(
                  title: Text("تسجيل خروج"),
                  leading: Icon(Icons.exit_to_app),
                  onTap: () async {
                    FirebaseAuth.instance.signOut().then((_) {
                      Navigator.of(context).pop();
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (BuildContext context) => Login()));
                    }).catchError((onError) {});
                  },
                ); */
              },
            ),
            FlatButton(
              child: Text('الغاء'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
