import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:ptint/themes/TitleText.dart';

class NumberList {
  String number;
  int index;
  NumberList({this.number, this.index});
}

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  // Default Radio Button Selected Item.
  String radioItemHolder = 'وجهه';
  String radioItemHolderColor = 'اسود';

  // Group Value for Radio Button.
  int id = 1;
  int idColor = 1;

  List<NumberList> nList = [
    NumberList(
      index: 1,
      number: "وجهه",
    ),
    NumberList(
      index: 2,
      number: "وجهين",
    ),
  ];
  List<NumberList> nListColor = [
    NumberList(
      index: 1,
      number: "اسود",
    ),
    NumberList(
      index: 2,
      number: "ملون",
    ),
  ];

//---------------------
  int selected_city = 0;
  int selected_Nbrhood = 0;
  int selected_str = 0;
  int selected_Hotel = 0;
  List<DropdownMenuItem<int>> sizeDrop = [];
  List<DropdownMenuItem<int>> papertypeDrop = [];
  List<DropdownMenuItem<int>> paperColorDrop = [];
  List<DropdownMenuItem<int>> nameXDrop = [];
  List<DropdownMenuItem<int>> paperOpenDrop = [];
//
  int _radioValue = -1;
  String radioValue;
  int _radioValue1 = -1;
  String radioValue1;

  final _fromkey = GlobalKey<FormState>();

  var _autovalidate = false;
  bool _osLoading = false;

  String idUsers;

  //-------------------------------------
  int numOfItems = 1;

  String _txtDescription;
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  bool _activation = false;
/*   TimeOfDay roomBooked =
      TimeOfDay.fromDateTime(DateTime.parse('2021-10-20 16:30:04Z'));
 */
  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime(2021, 10, 1));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  Future<Null> _selectTime(BuildContext context) async {
    final TimeOfDay picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null && picked != selectedTime)
      setState(() {
        selectedTime = picked;
      });
  }

  String paperSize, paperType, paperColor, aspectsPrinting, packagingOptions;
  bool inp = true;

  @override
  Widget build(BuildContext context) {
    //  hotelstr();
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
        ),
        body: Column(
          children: [
            TEXT(txt: 'نوع الورق'),
            Padding(
                padding: const EdgeInsets.fromLTRB(0, 8.0, 0, 10.0),
                child: Container(
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
                        value: selected_Nbrhood,
                        items: papertypeDrop,
                        underline: Container(
                          height: 0,
//                                    color: Colors.transparent,
                        ),
                        hint: TEXT(txt: 'choose'),
                        onChanged: (value) {
                          setState(() {
                            selected_Nbrhood = int.parse(value.toString());
                            selected_str = 0;
                            selected_Hotel = 0;

                            print("select $value");
                          });
                        },
                      ),
                    ))),
          ],
        ));
  }

  SizedBox buildOutlineButton({IconData icon, Function press}) {
    return SizedBox(
      width: 40,
      height: 32,
      child: OutlineButton(
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(13),
        ),
        onPressed: press,
        child: Icon(icon),
      ),
    );
  }

  Future getidUsers() async {
    var idUser = FirebaseAuth.instance.currentUser;
    idUsers = idUser.uid;
    print(idUser.uid);
  }
}
