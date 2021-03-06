import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ptint/1/mmm1.dart';
import 'package:ptint/1/nmm.dart';
import 'package:ptint/task/task.dart';
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
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 1.7,
      child: Scaffold(
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          appBar: AppBar(actions: [
            Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                    child: Badge(
                        badgeColor: LightColor.iconColor,
                        badgeContent: Text(
                          '0',
                          style: TextStyle(color: Colors.white),
                        ),
                        child: IconButton(
                            icon: Icon(Icons.shopping_cart_outlined),
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      HomeItem()));
                            }))))
          ]),
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
