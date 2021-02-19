import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart'; 


class A1 extends StatefulWidget {
	@override
	_A1State createState() => new _A1State();
}

class _A1State extends State<A1> {

	int _radioValue = -1;
	String radioValue;
  	int _radioValue1 = -1;
	String radioValue1;
  	int _radioValue2 = -1;
	String radioValue2;
  


	void _handleRadioValueChange( value) {
		setState(() {
			_radioValue = value;
			switch (_radioValue) {
				case 0: { radioValue="غير"; print("radioValue5 is $radioValue"); } break;
				case 1: { radioValue="عادي"; print("radioValue5 is $radioValue"); } break;
			}
		});
	}
  	void _handleRadioValueChange1( value) {
		setState(() {
			_radioValue1 = value;
			switch (_radioValue1) {
				case 0: { radioValue1="غير"; print("radioValue5 is $radioValue1"); } break;
				case 1: { radioValue1="عادي"; print("radioValue5 is $radioValue1"); } break;
			}
		});
	}
  	void _handleRadioValueChange2( value) {
		setState(() {
			_radioValue2 = value;
			switch (_radioValue2) {
				case 0: { radioValue2="غير"; print("radioValue5 is $radioValue2"); } break;
				case 1: { radioValue2="عادي"; print("radioValue5 is $radioValue2"); } break;
			}
		});
	}

	@override
	Widget build(BuildContext context) {
		return new Container(
			
				child: new Column(
																		mainAxisAlignment:
																		MainAxisAlignment.center,
																		children: <Widget>[
																			new Text(
																				'اختر:',
																				style: new TextStyle(
																					fontWeight: FontWeight.bold,
																					fontSize: 18.0,
																				),
																			),
                                      		new Row(
																				mainAxisAlignment:
																				MainAxisAlignment.center,
																				children: <Widget>[
																					new Radio(
																						value: 0,
																						groupValue: _radioValue,
																						onChanged:
																						_handleRadioValueChange,
																					),
																					new Text(
																						'غير ',
																						style: new TextStyle(
																								fontSize: 16.0),
																					),
																					new Radio(
																						value: 1,
																						groupValue: _radioValue,
																						onChanged: _handleRadioValueChange,
																					),
																					new Text(
																						'عادي',
																						style: new TextStyle(
																								fontSize: 16.0),
																					),
																				],
																			),
		new Row(
																				mainAxisAlignment:
																				MainAxisAlignment.center,
																				children: <Widget>[
																					new Radio(
																						value: 0,
																						groupValue: _radioValue1,
																						onChanged:
																						_handleRadioValueChange1,
																					),
																					new Text(
																						'غير ',
																						style: new TextStyle(
																								fontSize: 16.0),
																					),
																					new Radio(
																						value: 1,
																						groupValue: _radioValue1,
																						onChanged: _handleRadioValueChange1,
																					),
																					new Text(
																						'عادي',
																						style: new TextStyle(
																								fontSize: 16.0),
																					),
																				],
																			),

																			new Row(
																				mainAxisAlignment:
																				MainAxisAlignment.center,
																				children: <Widget>[
																					new Radio(
																						value: 0,
																						groupValue: _radioValue2,
																						onChanged:
																						_handleRadioValueChange2,
																					),
																					new Text(
																						'غير ',
																						style: new TextStyle(
																								fontSize: 16.0),
																					),
																					new Radio(
																						value: 1,
																						groupValue: _radioValue2,
																						onChanged: _handleRadioValueChange2,
																					),
																					new Text(
																						'عادي',
																						style: new TextStyle(
																								fontSize: 16.0),
																					),
																				],
																			),

                RaisedButton(
                  color: Colors.cyan[400],
                  child: Text("طباعة"),
                  onPressed: () async {
                   
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
             
																			  ]
																					)) ;
	}




}