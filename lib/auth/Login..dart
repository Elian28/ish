import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ptint/3/HomesScreen.dart';
import 'package:ptint/auth/SignIn.dart';
import 'package:ptint/themes/AppTheme.dart';
import 'package:ptint/themes/LightColor.dart';

/*   Future mapSendAttachmentEventToState(SendAttachmentEvent event) async {
    String url = await storageRepository.uploadFile(
        event.file, Paths.getAttachmentPathByFileType(event.fileType));
    String username = SharedObjects.prefs.getString(Constants.sessionUsername);
    String name = SharedObjects.prefs.getString(Constants.sessionName);
    Message message;
    if (event.fileType == FileType.IMAGE)
      message = ImageMessage(url, DateTime.now().millisecondsSinceEpoch, name, username);
    else if (event.fileType == FileType.VIDEO)
      message = VideoMessage(url, DateTime.now().millisecondsSinceEpoch, name, username);
    else
      message = FileMessage(url, DateTime.now().millisecondsSinceEpoch, name, username);
    await chatRepository.sendMessage(event.chatId, message);
  } */
enum FormType { login, register }

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

//
class _LoginState extends State<Login> {
  final _key = GlobalKey<FormState>();

//

  final fromkeyCountry = GlobalKey<FormState>();

  TextEditingController _txtEmail = TextEditingController();
  TextEditingController _txtPassword = TextEditingController();

  String serviceType = "نوع الخدمة المقدمة";
  var _error;
  bool isError = false;
  bool available = false;
  bool _hidePassword = true;
  var password;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  //Position _currentPosition;
  //ااجلها شوي

  String lisrDropdownviewCountry;

  @override
  void dispose() {
    _txtEmail.dispose();
    _txtPassword.dispose();
    super.dispose();
  }

  @override
  Future<void> resetPassword(String email) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: (_isLoading) ? loading() : registration());
  }

  Widget loading() {
    return Container(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget registration() {
    return SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(40),
            child: Form(
                key: _key,
                child: SingleChildScrollView(
                    child: Column(children: <Widget>[
                  SizedBox(height: MediaQuery.of(context).size.height / 20),
                  Text(
                    "تسجيل الدخول ",
                    style: TextStyle(fontSize: 30),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 20),
                  TextFormField(
                    enableSuggestions: false,
                    autocorrect: false,
                    textCapitalization: TextCapitalization.none,
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
                      errorStyle: TextStyle(color: Colors.white),
                      hintStyle: TextStyle(color: Colors.white),
                    ),
                    validator: (val) {
                      if (val.isEmpty || !val.contains('@')) {
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
                    onSaved: (value) {
                      _txtEmail.text = value;
                    },
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 55),
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
                        labelText: 'كلمة السر*',
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
                        password = value;
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
                    onSaved: (value) {
                      _txtPassword.text = value;
                    },
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 55),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("هل انت جديد :"),
                        FlatButton(
                            child: Text("انشاء حساب",
                                style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    color: Colors.cyan,
                                    fontSize: 12)),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          SignIn())); //االتسجيل
                            })
                      ]),
                  FlatButton(
                    onPressed: () {
                      //!

                      //!
                    },
                    child: Text(
                      'نسيان كلمة المرور؟',
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 55),
                  InkWell(
                      onTap: () {},
                      child: CupertinoButton(
                          color: LightColor.iconColor,
                          child: Text("الدخول"),
                          onPressed: _onSignInClick))
                ])))));
  }

  void _showDialog() {
    // dialog implementation
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("الرجاء ادخال ايميلك!"),
        content: TextFormField(
          controller: _txtEmail,
          decoration: InputDecoration(
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
            labelText: 'البريد الالكتروني*',
            hintText: "renad@gmail.com",
          ),
          onSaved: (value) {
            _txtEmail.text = value;
          },
        ),
        actions: [
          FlatButton(
            child: Text("ارسال"),
            onPressed: () async {
              //  var response = await checkEmail();
              setState(() {
                //  this._txtEmail = response;
              });
              if (_key.currentState.validate()) {
                _key.currentState.save();
                try {
                  await FirebaseAuth.instance
                      .sendPasswordResetEmail(email: _txtEmail.text);
                } catch (e) {
                  print(e);
                }
              }
            },
          )
        ],
      ),
    );
  }

  void _onSignInClick() async {
    if (!_key.currentState.validate()) {
      setState(() {
        _isLoading = false;
        available = true;
      });
    } else {
      setState(() {
        _isLoading = true;
        available = false;
      });
      final newUser = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
        email: _txtEmail.text.trim(),
        password: _txtPassword.text.trim(),
      )
          .then((_) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => HomesScreen()));
      }).catchError((err) {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                  elevation: 0,
                  contentTextStyle: TextStyle(
                    color: Colors.grey[700],
                    decorationStyle: TextDecorationStyle.dotted,
                  ),
                  title: Center(child: Text("يرجى اعادة المحاولة")),
                  content: Text(
                      "لا يتطابق البريد الإلكتروني وكلمة المرور اللذان أدخلتهما مع سجلاتنا . يرجى إعادة التحقق والمحاولة مرة أخرى ."),
                  actions: [
                    FlatButton(
                        child: Text("اعادة المحاولة"),
                        onPressed: () {
                          setState(() {
                            _isLoading = false;
                            available = false;
                            Navigator.of(context).pop();
                          });
                        })
                  ]);
            });
      });
    }
  }
}
