/* import 'package:flutter/material.dart';
import '2/print/PrintPages.dart';
import '3/ShoppingCartPage.dart';
import 'HomePag.dart';
import 'Widget/TitleText.dart';

class ViewPagePrint extends StatefulWidget {
  @override
  _ViewPagePrintState reateState() => _ViewPagePrintState();
}

class _ViewPagePrintState extends State<ViewPagePrint>
    with TickerProviderStateMixin {
  TabController _controller;

  int _currentStep = 0;
  StepperType stepperType = StepperType.horizontal;
  bool currStep = false;
  switchStepType() {
    setState(() => stepperType == StepperType.vertical
        ? stepperType = StepperType.horizontal
        : stepperType = StepperType.vertical);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.swap_horizontal_circle),
          onPressed: switchStepType,
        ),
        appBar: AppBar(
            title: TEXT(
          txt: "الطباعة",
        )),
        backgroundColor: Colors.white,
        body: Column(children: <Widget>[
          ListTile(
            leading: TEXT(
              txt: "*ملحوظة !",
              color: Colors.red,
              size: 25,
            ),
            title: TEXT(
              txt:
                  "حجم الملف المسموح: 100MB, \nانواع الملفات المسموحة: doc, docx, ppt, pptx, pdf*",
              color: Colors.black,
              size: 12,
            ),
          ),
          ListTile(
            leading: TEXT(
              txt: "* ملحوظة هامة!",
              color: Colors.red,
              size: 21,
            ),
            title: TEXT(
              txt: "يرجاء الانتظار حتي يتم استكمال رفع الملف واظهار تنبيه بذلك",
              color: Colors.black,
              size: 12,
            ),
          ),
          // _steppers(),
          Stepper(
            type: StepperType.vertical,
            steps: [
              Step(
                title: Text("Create a survey"),
                content: Text("Are you happy with our service?"),
              ),
              Step(
                title: Text("Add Questions"),
                content: Text("No questions added"),
              ),
            ],
          ),
        ]));
  }

  Widget _steppers() {
    return Expanded(
      child: Stepper(
        physics: ClampingScrollPhysics(),
        steps: _listStepper(),
        type: stepperType,
        currentStep: this._currentStep,
        onStepTapped: (step) {
          setState(() {
            this._currentStep = step;
          });
        },
/*         onStepContinue: () {
          setState(() {
            if (this._currentStep < this._listStepper().length - 1) {
              this._currentStep = this._currentStep + 1;
            } else {
              //Logic
              print('complete');
            }
          });
        },
        onStepCancel: () {
          setState(() {
            if (this._currentStep > 0) {
              this._currentStep = this._currentStep - 1;
            } else {
              this._currentStep = 0;
            }
          });
        }, */
      ),
    );
  }

  List<Step> _listStepper() {
    List<Step> _steps = [
      Step(
          title: TEXT(txt: "رفع الملفات"),
          content: Column(
            children: <Widget>[
              ListTile(
                title: Center(child: TEXT(txt: "لرفع ملفك اضغط هنا")),
                subtitle: Icon(
                  Icons.cloud_download,
                  size: 100,
                  color: Colors.grey,
                ),
              )
            ],
          ),
          isActive: _currentStep >= 0,
          state: StepState.complete),
      Step(
          title: TEXT(txt: 'تحديد التغليف'),
          content: Container(
              height: MediaQuery.of(context).size.height / 2,
              width: double.infinity,
              child: HomePag()),
          isActive: _currentStep >= 1,
          state: StepState.disabled),
      Step(
          title: TEXT(txt: 'السلة'),
          content: ShoppingCartPage(),
          isActive: _currentStep >= 2,
          state: StepState.indexed),
    ];
    return _steps;
  }

  Widget steps() {
    Form(
      // key: _formKey,
      child: Stepper(
        steps: steps(),
        currentStep: currStep,
        onStepContinue: () {
          setState(() {
            if (formKeys[currStep].currentState.validate()) {
              if (currStep < steps().length - 1) {
                currStep += 1;
              } else if (steps().length == 2) {
                print('Done');
              } else {
                currStep = 0;
              }
            }
          });
        },
        onStepTapped: (step) {
          setState(() {
            currStep = step;
            print(step);
          });
        },
      ),
    );
    List<Step> steps() {
      return [
        Step(
          title: const Text('Enter Previous PinCode'),
          isActive: currStep == 0 ? true : false,
          state: StepState.indexed,
          content: Form(
           // key: formKeys[0],
            child: TextFormField(
              autofocus: true,
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value.isEmpty || value != userModelHive.pinCodeNumber) {
                  return 'PinCode Invalid';
                }
                return null;
              },
            ),
          ),
        ),
        Step(
          title: const Text('Enter New PinCode'),
          isActive: true,
          state: StepState.indexed,
          content: Form(
          //  key: formKeys[1],
            child: TextFormField(
              autofocus: true,
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Provided PinCode';
                } else if (value.length < 4 || value.length > 6) {
                  return "More than 4 Less than 6";
                }
                return null;
              },
            ),
          ),
        ),
      ];
    }
  }
}
 */
