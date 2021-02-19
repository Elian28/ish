import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';

import 'package:ptint/1/mmm1.dart';
import 'package:ptint/1/nmm.dart';

import 'package:ptint/themes/LightColor.dart';
import 'package:ptint/themes/TitleText.dart';

import 'UploadFile.dart';

class ViewPagePrint extends StatefulWidget {
  @override
  _ViewPagePrintState createState() => _ViewPagePrintState();
}

class _ViewPagePrintState extends State<ViewPagePrint> {
  int _currentStep = 0;

  final GlobalKey<ScaffoldState> _scaffoldstate = GlobalKey<ScaffoldState>();

  /*  void _showSnackBarMsg(String msg) {
    _scaffoldstate.currentState.showSnackBar(new SnackBar(
      content: new Text(msg),
    ));
  } */

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 1.7,
      child: Scaffold(
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.grey),
            backgroundColor: Colors.white,
            elevation: 2,
            title: Text("الطباعة".toUpperCase(),
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 17,
                )),
            leading: IconButton(
                icon: Icon(Icons.close, size: 28),
                onPressed: () {
                  Navigator.of(context).pop();
                }),
          ),
          body: Form(
              key: _scaffoldstate,
              child: Column(children: [
                Theme(
                    data: ThemeData(primaryColor: LightColor.kShrinePink400),
                    child: StatefulBuilder(
                        builder: (BuildContext context, StateSetter setState) {
                      return Expanded(
                        child: Stepper(
                            type: StepperType.horizontal,
                            currentStep: _currentStep,
                            onStepTapped: (int step) =>
                                setState(() => _currentStep = step),
                            onStepContinue: _currentStep < 2
                                ? () => setState(() => _currentStep += 1)
                                : null,
                            onStepCancel: _currentStep > 0
                                ? () => setState(() => _currentStep -= 1)
                                : null,
                            controlsBuilder: (BuildContext context,
                                    {VoidCallback onStepContinue,
                                    VoidCallback onStepCancel}) =>
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(9, 20, 0, 10.0),
                                  child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        _currentStep == 0
                                            ? Text("")
                                            : RaisedButton(
                                                onPressed: onStepCancel,
                                                textColor: LightColor.grey,
                                                textTheme:
                                                    ButtonTextTheme.normal,
                                                child: Row(children: <Widget>[
                                                  const Icon(
                                                      Icons.chevron_left),
                                                  Text("رجوع")
                                                ]),
                                              ),
                                        RaisedButton(
                                            onPressed: onStepContinue,
                                            textColor: Colors.white,
                                            color: LightColor.iconColor,
                                            textTheme: ButtonTextTheme.normal,
                                            child: Row(children: <Widget>[
                                              _currentStep >= 2
                                                  ? Icon(Icons.done)
                                                  : Icon(Icons.chevron_right),
                                              _currentStep >= 2
                                                  ? InkWell(child: Text("منجز"))
                                                  : Text("التالي")
                                            ]))
                                      ]),
                                ),
                            steps: <Step>[
                              Step(
                                  title: Text("رفع الملفات",
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.grey[600])),
                                  content: UploadFile(),
                                  isActive: _currentStep >= 0,
                                  state: _currentStep >= 0
                                      ? StepState.complete
                                      : StepState.disabled),
                              //
                              Step(
                                  title: Text(" طباعة",
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.grey[600])),
                                  content: A123(),
                                  isActive: _currentStep >= 2,
                                  state: _currentStep >= 3
                                      ? StepState.complete
                                      : StepState.disabled),
                              /*     Step(
                                  title: TEXT(
                                    txt: 'طباعة',
                                    size: 15,
                                    color: Colors.grey[600],
                                  ),
                                  content: A123 /* Print */ (),
                                  isActive: _currentStep >= 2,
                                  state: _currentStep >= 3
                                      ? StepState.complete
                                      : StepState.disabled), */ //

                              Step(
                                  title: TEXT(
                                    txt: 'السلة',
                                    size: 15,
                                    color: Colors.grey[600],
                                  ),
                                  content: OrderPage(),
                                  isActive: _currentStep >= 3,
                                  state: _currentStep >= 3
                                      ? StepState.complete
                                      : StepState.disabled)
                            ]),
                      );
                    }))
              ]))),
    );
  }
}
