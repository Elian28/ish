import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LongPersonalCard extends StatefulWidget {
  @override
  _LongPersonalCardState createState() => new _LongPersonalCardState();
}

class _LongPersonalCardState extends State<LongPersonalCard> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  List<String> _cardSize = <String>[
    '',
    '5 سم * 9 سم',
  ];
  List<String> _printFormat = <String>[
    '',
    'وجهه',
    'وجهين',
  ];
  List<String> _paperType = <String>[
    '',
    'كوشيه 300 جرام',
  ];
  List<String> _quantity = <String>[
    '',
    '100',
    '200',
    '300',
    '400',
    '500',
    '1000'
  ];
  List<String> _cut = <String>[
    '',
    'قص بزاويه عاديه',
    'قص بزاويه راوند مثل البطاقه',
  ];
  List<String> _cellophane = <String>[
    '',
    'سلوفان مط',
    'سلوفان لامع',
    ' لايوجد',
  ];
  String cardSizeolor = '';
  String printFormat = '';
  String paperType = '';
  String quantity = '';
  String cut = '';
  String cellophane = '';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("كروت شخصية"),
      ),
      body: new SafeArea(
          top: false,
          bottom: false,
          child: new Form(
              key: _formKey,
              autovalidate: true,
              child: new ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                children: <Widget>[
                  new FormField(
                    builder: (FormFieldState state) {
                      return InputDecorator(
                        decoration: InputDecoration(
                          labelText: 'مقاس الكارت',
                        ),
                        isEmpty: cardSizeolor == '',
                        child: new DropdownButtonHideUnderline(
                          child: new DropdownButton(
                            value: cardSizeolor,
                            isDense: true,
                            onChanged: (String newValue) {
                              setState(() {
                                cardSizeolor = newValue;
                                state.didChange(newValue);
                              });
                            },
                            items: _cardSize.map((String value) {
                              return new DropdownMenuItem(
                                value: value,
                                child: new Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      );
                    },
                  ),
                  new FormField(
                    builder: (FormFieldState state) {
                      return InputDecorator(
                        decoration: InputDecoration(
                          labelText: ' شكل الطباعة',
                        ),
                        isEmpty: printFormat == '',
                        child: new DropdownButtonHideUnderline(
                          child: new DropdownButton(
                            value: printFormat,
                            isDense: true,
                            onChanged: (String newValue) {
                              setState(() {
                                printFormat = newValue;
                                state.didChange(newValue);
                              });
                            },
                            items: _printFormat.map((String value) {
                              return new DropdownMenuItem(
                                value: value,
                                child: new Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      );
                    },
                  ),
                  new FormField(
                    builder: (FormFieldState state) {
                      return InputDecorator(
                        decoration: InputDecoration(
                          labelText: ' نوع الورقة',
                        ),
                        isEmpty: paperType == '',
                        child: new DropdownButtonHideUnderline(
                          child: new DropdownButton(
                            value: paperType,
                            isDense: true,
                            onChanged: (String newValue) {
                              setState(() {
                                paperType = newValue;
                                state.didChange(newValue);
                              });
                            },
                            items: _paperType.map((String value) {
                              return new DropdownMenuItem(
                                value: value,
                                child: new Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      );
                    },
                  ),
                  new FormField(
                    builder: (FormFieldState state) {
                      return InputDecorator(
                        decoration: InputDecoration(
                          labelText: ' سلوفان',
                        ),
                        isEmpty: quantity == '',
                        child: new DropdownButtonHideUnderline(
                          child: new DropdownButton(
                            value: quantity,
                            isDense: true,
                            onChanged: (String newValue) {
                              setState(() {
                                quantity = newValue;
                                state.didChange(newValue);
                              });
                            },
                            items: _cellophane.map((String value) {
                              return new DropdownMenuItem(
                                value: value,
                                child: new Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      );
                    },
                  ),
                  new FormField(
                    builder: (FormFieldState state) {
                      return InputDecorator(
                        decoration: InputDecoration(
                          labelText: ' الكمية ( عدد النسخ )',
                        ),
                        isEmpty: cut == '',
                        child: new DropdownButtonHideUnderline(
                          child: new DropdownButton(
                            value: cut,
                            isDense: true,
                            onChanged: (String newValue) {
                              setState(() {
                                cut = newValue;
                                state.didChange(newValue);
                              });
                            },
                            items: _quantity.map((String value) {
                              return new DropdownMenuItem(
                                value: value,
                                child: new Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      );
                    },
                  ),
                  new FormField(
                    builder: (FormFieldState state) {
                      return InputDecorator(
                        decoration: InputDecoration(
                          labelText: ' شكل قص الزوايا',
                        ),
                        isEmpty: cellophane == '',
                        child: new DropdownButtonHideUnderline(
                          child: new DropdownButton(
                            value: cellophane,
                            isDense: true,
                            onChanged: (String newValue) {
                              setState(() {
                                cellophane = newValue;
                                state.didChange(newValue);
                              });
                            },
                            items: _cut.map((String value) {
                              return new DropdownMenuItem(
                                value: value,
                                child: new Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      );
                    },
                  ),
                  new TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'أكتب ملاحظاتك مع الطلب',
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  new TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'موعد تسليم الطلب',
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 20),
                  Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text("تكلفة الصفحة "),
                          Text("تكلفة النسخة "),
                          Text("إجمالى التكلفة"),
                          Text(""),
                        ],
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'كود الخصم',
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ],
                  ),
                  new Container(
                      padding: const EdgeInsets.only(left: 40.0, top: 20.0),
                      child: new RaisedButton(
                        child: Text('تاكيد الطلب'),
                        onPressed: null,
                      )),
                ],
              ))),
    );
  }
}
