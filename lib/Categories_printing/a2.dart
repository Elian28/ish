import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class A2 extends StatefulWidget {
  @override
  _A2State createState() => _A2State();
}

class _A2State extends State<A2> {
  var fromKey = GlobalKey<FormState>();

  int _radioValue = -1;
  int _radioValue1 = -1;
  int _radioValue2 = -1;
  var radioValue;
  var radioValue1;
  var radioValue2;

  @override
  Widget build(BuildContext context) {
    var _mediaQuery = MediaQuery.of(context).size;

    return Container(
        child: Column(
      children: <Widget>[
        // SizedBox(height: 70,),
        Text(
          ' نوع الورق',
          style: TextStyle(
              fontSize: _mediaQuery.height / 40,
              color: Colors.blue,
              fontWeight: FontWeight.w900),
        ),
        // نوع الورق
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Radio(
                activeColor: Colors.blue,
                value: 0,
                groupValue: _radioValue,
                onChanged: _voidradioValue),

            Text(
              'عادي',
              style: TextStyle(fontSize: 16.0),
            ),
            Radio(
                activeColor: Colors.blue,
                value: 1,
                groupValue: _radioValue,
                onChanged: _voidradioValue),
            Text(
              'فلم ابيض',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            //
          ],
        ),
        Text(
          ' لون الحبر',
          style: TextStyle(
              fontSize: _mediaQuery.height / 40,
              color: Colors.blue,
              fontWeight: FontWeight.w900),
        ),
        // لون الطباعة
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Radio(
                activeColor: Colors.blue,
                value: 0,
                groupValue: _radioValue1,
                onChanged: _voidradioValue1),
            Text(
              'اسود',
              style: TextStyle(fontSize: _mediaQuery.height / 50),
            ),
            Radio(
                activeColor: Colors.blue,
                value: 1,
                groupValue: _radioValue1,
                onChanged: _voidradioValue1),
            Text(
              'ملون',
              style: TextStyle(fontSize: _mediaQuery.height / 50),
            ),
          ],
        ),
        SizedBox(
          height: _mediaQuery.height / 40,
        ),
        Text(
          "خيارات التغليف",
          style: TextStyle(
              fontSize: _mediaQuery.height / 40,
              color: Colors.blue,
              fontWeight: FontWeight.w900),
        ),
        // خيارات التغليف
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Radio(
                activeColor: Colors.blue,
                value: 0,
                groupValue: _radioValue2,
                onChanged: _voidradioValue2),
            Text(
              'بدون تغليف',
              style: TextStyle(fontSize: _mediaQuery.height / 50),
            ),
            Radio(
                activeColor: Colors.blue,
                value: 1,
                groupValue: _radioValue2,
                onChanged: _voidradioValue2),
            Text(
              'حافظ انبوبي',
              style: TextStyle(fontSize: _mediaQuery.height / 50),
            ),
          ],
        ),

        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("اذا كنت تريد حفظ الملخص"),
                    FlatButton(
                      child: Text(
                        "اضغط هنا",
                        style: TextStyle(color: Colors.red),
                      ),
                      onPressed: () {
/*                         Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) => AddPrint())); */
                      },
                    ),
                  ],
                ),
                RaisedButton(
                  color: Colors.cyan[400],
                  child: Text("طباعة"),
                  onPressed: () async {
                    //   if (_fromKey.currentState.validate()) {

                    Navigator.pop(context);

                    Fluttertoast.showToast(
                        msg: "تم ارسال الطلب بنجاح ",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.cyan[800],
                        textColor: Colors.white,
                        fontSize: MediaQuery.of(context).size.height / 35);
                  },
                ),
              ],
            ),
          ),
        )
      ],
    ));
  }

  void _voidradioValue(value) {
    setState(() {
      _radioValue = value;
      switch (_radioValue) {
        case 0:
          {
            radioValue = "عادي";
            print("radioValue2 is $radioValue");
          }
          break;
        case 1:
          {
            radioValue = "قلم ابيض";
            print("radioValue2 is $radioValue");
          }
          break;
      }
    });
  }

  void _voidradioValue1(value) {
    setState(() {
      _radioValue1 = value;
      switch (_radioValue1) {
        case 0:
          {
            radioValue1 = "اسود";
            print("radioValue2 is $radioValue1");
          }
          break;
        case 1:
          {
            radioValue1 = "ملون";
            print("radioValue2 is $radioValue1");
          }
          break;
      }
    });
  }

  void _voidradioValue2(value) {
    setState(() {
      _radioValue2 = value;
      switch (_radioValue2) {
        case 0:
          {
            radioValue2 = "بدون تغليف";
            print("radioValue2 is $radioValue2");
          }
          break;
        case 1:
          {
            radioValue2 = "حافظ انبوبي";
            print("radioValue2 is $radioValue2");
          }
          break;
      }
    });
  }
}
