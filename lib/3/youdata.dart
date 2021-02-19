import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UserData extends StatefulWidget {
  @override
  _UserDataState createState() => _UserDataState();
}

class _UserDataState extends State<UserData> {
  final _key = GlobalKey<FormState>();
  final fromkeyCountry = GlobalKey<FormState>();

  TextEditingController _txtName = TextEditingController();
  TextEditingController _txtTradeName = TextEditingController();
  TextEditingController _txtEmail = TextEditingController();
  TextEditingController _txtMobile = TextEditingController();
  TextEditingController _txtPassword = TextEditingController();
  TextEditingController _txtConfirmPassword = TextEditingController();
  TextEditingController _txtIDNumber = TextEditingController();

  String serviceType = "نوع الخدمة المقدمة";
  var _error;
  bool isError = false;
  bool _available = false;
  //Position _currentPosition;
  bool _hidePassword = true;
  bool _hideConfirmPassword = true;
  var _password;
  bool _move = false;
  String dropdownValue = 'توصيل';
  var listOfPets = ["توصيل", "الاستيلام من الفرع", "كلها"];
  //ااجلها شوي

  String lisrDropdownviewCountry;

  @override
  void dispose() {
    _txtName.dispose();
    _txtTradeName.dispose();
    _txtEmail.dispose();
    _txtMobile.dispose();
    _txtPassword.dispose();
    _txtConfirmPassword.dispose();
    _txtIDNumber.dispose();
    super.dispose();
  }

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("تعديل البروفايل"),
             centerTitle: true,
            actions: <Widget>[
              GestureDetector(
                  onTap: () async {
                    FirebaseDatabase.instance
                        .reference()
                        .child("profile")
                        .orderByChild(_txtName.text)
                        .equalTo("Dasun Shanaka")
                        .once();
                  },
                  child: Container(
                      padding: EdgeInsets.only(top: 17, right: 25),
                      child: Text('حفظ', style: TextStyle(fontSize: 18))))
            ] 
      ),
/*         appBar: AppBar(
            automaticallyImplyLeading: false,
            
/*             leading: IconButton(
              color: Colors.amber,
              icon: Icon(
                Icons.close,
                color: Colors.red,
              ),
              onPressed: () {},
            ),
            centerTitle: true,
            actions: <Widget>[
              GestureDetector(
                  onTap: () async {
                    FirebaseDatabase.instance
                        .reference()
                        .child("profile")
                        .orderByChild("Full Name")
                        .equalTo("Dasun Shanaka")
                        .once();
                  },
                  child: Container(
                      padding: EdgeInsets.only(top: 17, right: 25),
                      child: Text('حفظ', style: TextStyle(fontSize: 18))))
            ] */), */
        body: (_isLoading) ? loading() : registration(context));
  }

  Widget loading() {
    return Container(
      child: Center(
        child: CircularProgressIndicator()
      )
    );
  }

  Widget registration(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(40),
            child: Form(
                key: _key,
                child: Column(children: <Widget>[
                  Stack(children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width / 5,
                      height: MediaQuery.of(context).size.height / 10,
                      decoration: BoxDecoration(
                          color: Colors.cyan,
                          image: DecorationImage(
                              image: NetworkImage(
                                "https://upload.3dlat.com/uploads/3dlat.com_28_18_18a6_9c59cddc60733.jpg",
                              ),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.all(Radius.circular(75.0)),
                          boxShadow: [
                            BoxShadow(blurRadius: 7.0, color: Colors.cyan)
                          ]),
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width / 15,
                        height: MediaQuery.of(context).size.height / 30,
                        decoration: BoxDecoration(
                            color: Colors.white38,
                            border: Border.all(color: Colors.black45),
                            borderRadius:
                                BorderRadius.all(Radius.circular(75.0)),
                            boxShadow: [
                              BoxShadow(blurRadius: 0.0, color: Colors.black12)
                            ]),
                        child: Icon(Icons.create,
                            size: 20, color: Colors.cyan[700]))
                  ]),
                  SizedBox(height: MediaQuery.of(context).size.height / 20),
                  Container(
                    height: 40,
                    child: TextFormField(
                      controller: _txtName,
                      cursorColor: Colors.black54,
                      style: TextStyle(color: Colors.black54),
                      decoration: InputDecoration(
                        labelStyle: TextStyle(color: Colors.black54),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black54)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                        labelText: "الاسم الكامل* ",
                        hintText: "renad",
                      ),
                      validator: (val) {
                        if (val.isEmpty) {
                          return "الرجاء تعبية البيانات";
                        } else if (val.length > 11) {
                          return 'اسم المستخدم طويل جدا';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 55),
                  Container(
                     height: 40,
                    child: TextFormField(
                      controller: _txtEmail,
                      cursorColor: Colors.black54,
                      style: TextStyle(color: Colors.black54),
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          labelStyle: TextStyle(color: Colors.black54),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black54)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                          labelText: 'البريد الالكتروني*',
                          hintText: "renad@gmail.com",
                          suffixIcon: FlatButton(
                              onPressed: editEmail,
                              child: InkWell(
                                child: Container(
                                  width: MediaQuery.of(context).size.width / 15,
                                  height: MediaQuery.of(context).size.height / 30,
                                  decoration: BoxDecoration(
                                      color: Colors.white38,
                                      border: Border.all(color: Colors.black45),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(75.0)),
                                      boxShadow: [
                                        BoxShadow(
                                            blurRadius: 0.0,
                                            color: Colors.black12)
                                      ]),
                                  child: Icon(
                                    Icons.create,
                                    size: 20,
                                    color: Colors.cyan[700],
                                  ),
                                ),
                              ))),
                      validator: (val) {
                        if (val.isEmpty) {
                          return "الرجاء تعبية البيانات";
                        }
                        Pattern pattern =
                            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                        RegExp regex = new RegExp(pattern);
                        if (!regex.hasMatch(val)) {
                          return 'تنسيق البريد الإلكتروني غير صالح';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 55),
                  Container(
                     height: 40,
                    child: TextFormField(
                      controller: _txtPassword,
                      obscureText: _hidePassword,
                      cursorColor: Colors.black54,
                      style: TextStyle(color: Colors.black54),
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                          labelStyle: TextStyle(color: Colors.black54),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black54)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                          labelText: 'كلمة السر*',
                          hintText: '**********',
                          suffixIcon: FlatButton(
                              onPressed: editPassword,
                              child: InkWell(
                                child: Container(
                                  width: MediaQuery.of(context).size.width / 15,
                                  height: MediaQuery.of(context).size.height / 30,
                                  decoration: BoxDecoration(
                                      color: Colors.white38,
                                      border: Border.all(color: Colors.black45),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(75.0)),
                                      boxShadow: [
                                        BoxShadow(
                                            blurRadius: 0.0,
                                            color: Colors.black12)
                                      ]),
                                  child: Icon(
                                    Icons.create,
                                    size: 20,
                                    color: Colors.cyan[700],
                                  ),
                                ),
                              ))),
                      onChanged: (value) {
                        setState(() {
                          _password = value;
                        });
                      },
                      validator: (val) {
                        if (val.isEmpty) {
                          return "الرجاء تعبية البيانات";
                        } else if (val.length < 8) {
                          return 'يجب أن تكون كلمة المرور أطول من 8 أحرف';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 55),
                  Container(
                     height: 45,
                    child: TextFormField(
                      
                      controller: _txtMobile,
                      keyboardType: TextInputType.phone,
                      cursorColor: Colors.black54,
                      style: TextStyle(color: Colors.black54),
                      decoration: InputDecoration(
                        
                        labelStyle: TextStyle(color: Colors.black54),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black54)),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(width: 15),
                            borderRadius: BorderRadius.circular(5.0)),
                        labelText: "رقم الجوال",
                        hintText: "+966555555555",
                      ),
                      validator: (val) {
                        if (val.isEmpty) {
                          return "الرجاء تعبية البيانات";
                        } else if (val.length <= 9) {
                          return "يجب ان يكون رقم الهاتف من 10 ارقام";
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 55),
                  _eroorMassenger(context)
                ]))));
  }

  void editPassword() {
    setState(() {
      return showDialog(
        useRootNavigator: true,
        routeSettings: RouteSettings(),
        context: context,
        barrierDismissible: false, // user must tap button for close dialog!
        builder: (BuildContext context) {
          return Center(
            child: SingleChildScrollView(
              child: AlertDialog(
                content: Column(
                  children: <Widget>[
                    TextFormField(
                      controller: _txtPassword,
                      obscureText: _hidePassword,
                      cursorColor: Colors.black54,
                      style: TextStyle(color: Colors.black54),
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                          labelStyle: TextStyle(color: Colors.black54),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black54)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                          labelText: ' الحالية كلمة السر*',
                          hintText: _hidePassword ? '**********' : 'كلمة السر',
                          suffixIcon: FlatButton(
                              onPressed: () {
                                setState(() {
                                  _hidePassword = !_hidePassword;
                                });
                              },
                              child: Icon(
                                  _hidePassword
                                      ? Icons.remove_red_eye
                                      : Icons.visibility_off,
                                  color: _hidePassword
                                      ? Colors.black12
                                      : Colors.black54))),
                      onChanged: (value) {
                        setState(() {
                          _password = value;
                        });
                      },
                      validator: (val) {
                        if (val.isEmpty) {
                          return "الرجاء تعبية البيانات";
                        } else if (val.length < 8) {
                          return 'يجب أن تكون كلمة المرور أطول من 8 أحرف';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _txtPassword,
                      obscureText: _hidePassword,
                      cursorColor: Colors.black54,
                      style: TextStyle(color: Colors.black54),
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                          labelStyle: TextStyle(color: Colors.black54),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black54)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                          labelText: '  كلمة السر*',
                          hintText: _hidePassword ? '**********' : 'كلمة السر',
                          suffixIcon: FlatButton(
                              onPressed: () {
                                setState(() {
                                  _hidePassword = !_hidePassword;
                                });
                              },
                              child: Icon(
                                  _hidePassword
                                      ? Icons.remove_red_eye
                                      : Icons.visibility_off,
                                  color: _hidePassword
                                      ? Colors.black12
                                      : Colors.black54))),
                      onChanged: (value) {
                        setState(() {
                          _password = value;
                        });
                      },
                      validator: (val) {
                        if (val.isEmpty) {
                          return "الرجاء تعبية البيانات";
                        } else if (val.length < 8) {
                          return 'يجب أن تكون كلمة المرور أطول من 8 أحرف';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _txtConfirmPassword,
                      obscureText: _hideConfirmPassword,
                      cursorColor: Colors.black54,
                      style: TextStyle(color: Colors.black54),
                      decoration: InputDecoration(
                          labelStyle: TextStyle(color: Colors.black54),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black54)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                          labelText: 'التاكد من كلمة السر*',
                          hintText: _hideConfirmPassword
                              ? '**********'
                              : 'التاكد من كلمة السر',
                          suffixIcon: FlatButton(
                              onPressed: () {
                                setState(() {
                                  _hideConfirmPassword = !_hideConfirmPassword;
                                });
                              },
                              child: Icon(
                                  _hideConfirmPassword
                                      ? Icons.remove_red_eye
                                      : Icons.visibility_off,
                                  color: _hideConfirmPassword
                                      ? Colors.black12
                                      : Colors.black54))),
                      onChanged: (value) {
                        setState(() {
                          _password = value;
                        });
                      },
                      validator: (val) {
                        if (val.isEmpty) {
                          return "الرجاء تعبية البيانات";
                        } else if (val.length < 8) {
                          return 'يجب أن تكون كلمة المرور أطول من 8 أحرف';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
                actions: <Widget>[
                  FlatButton(
                    child: const Text('CANCEL'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  FlatButton(
                    child: const Text('تاكيد'),
                    onPressed: () {
                      /*    Navigator.of(context)
                                                .pop(ConfirmAction.ACCEPT); */
                    },
                  )
                ],
              ),
            ),
          );
        },
      );
    });
  }

  void editEmail() {
    setState(() {
      return showDialog(
        useRootNavigator: true,
        routeSettings: RouteSettings(),
        context: context,
        barrierDismissible: false, // user must tap button for close dialog!
        builder: (BuildContext context) {
          return Center(
            child: SingleChildScrollView(
              child: AlertDialog(
                content: Column(
                  children: <Widget>[
                    TextFormField(
                      controller: _txtPassword,
                      obscureText: _hidePassword,
                      cursorColor: Colors.black54,
                      style: TextStyle(color: Colors.black54),
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                        labelStyle: TextStyle(color: Colors.black54),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black54)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                        labelText: '  تغير البريد الالكتروني  *',
                        hintText: _hidePassword ? "@" : '  البريد الالكتروني',
                      ),
                      onChanged: (value) {
                        setState(() {
                          _password = value;
                        });
                      },
                      validator: (val) {
                        if (val.isEmpty) {
                          return "الرجاء تعبية البيانات";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _txtConfirmPassword,
                      obscureText: _hideConfirmPassword,
                      cursorColor: Colors.black54,
                      style: TextStyle(color: Colors.black54),
                      decoration: InputDecoration(
                        labelStyle: TextStyle(color: Colors.black54),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black54)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                        labelText: 'التاكد من البريد الالكتروني *',
                        hintText:
                            _hideConfirmPassword ? "@" : '  البريد الالكتروني',
                      ),
                      onChanged: (value) {
                        setState(() {
                          _password = value;
                        });
                      },
                      validator: (val) {
                        if (val.isEmpty) {
                          return "الرجاء تعبية البيانات";
                        } else if (val.length < 8) {
                          return 'يجب أن تكون كلمة المرور أطول من 8 أحرف';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
                actions: <Widget>[
                  FlatButton(
                    child: const Text('CANCEL'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  FlatButton(
                    child: const Text('تاكيد'),
                    onPressed: () {
                      /*    Navigator.of(context)
                                                .pop(ConfirmAction.ACCEPT); */
                    },
                  )
                ],
              ),
            ),
          );
        },
      );
    });
  }

  Widget _eroorMassenger(BuildContext context) {
    if (_error == null) {
      return Container();
    }
    return Container(
      child: Text(
        _error,
        style: TextStyle(color: Colors.red),
      ),
    );
  }

  Widget _nameTextField(String _name) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Full Name',
          //  style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          //  decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextFormField(
            autovalidate: false,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.perm_identity,
                color: Colors.white,
              ),
              hintText: 'Enter your Full Name',
              //  hintStyle: kHintTextStyle,
            ),
            initialValue: _name,
            validator: (String value) {
              if (value.isEmpty) {
                return 'Name is Required.';
              }
              if (value.length < 3) {
                return 'Name must be more than 2 charater';
              }
              return null;
            },
            onSaved: (String value) {
              return _name = value;
            },
          ),
        ),
      ],
    );
  }

  Widget _nICTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'NIC No:',
          // style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          // decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextFormField(
            keyboardType: TextInputType.text,
            autovalidate: false,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.assignment_ind,
                color: Colors.white,
              ),
              hintText: 'Enter your NIC Number',
              //hintStyle: kHintTextStyle,
            ),
            validator: (String value) {
              if (value.isEmpty) {
                return 'NIC is Required.';
              }
              return null;
            },
            onSaved: (String value) {
              //   return _nic = value;
            },
          ),
        ),
      ],
    );
  }

  @override
  Widget builds(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF73AEF5),
                      Color(0xFF61A4F1),
                      Color(0xFF478DE0),
                      Color(0xFF398AE5),
                    ],
                    stops: [0.1, 0.4, 0.7, 0.9],
                  ),
                ),
              ),
              Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 35.0,
                    vertical: 5.0,
                  ),
                  child: Form(
                    key: _key,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(height: 15.0),
                        // imageAvatar,
                        _nameTextField("_name"),
                        SizedBox(
                          height: 15.0,
                        ),
                        _nICTextField(),
                        SizedBox(
                          height: 15.0,
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
