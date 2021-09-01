import 'package:flutter/material.dart';
import 'package:sk_onboarding_screen/flutter_onboarding.dart';
import 'package:sk_onboarding_screen/sk_onboarding_screen.dart';

class Animations2 extends StatefulWidget {
  @override
  _Animations2State createState() => _Animations2State();
}

class _Animations2State extends State<Animations2> {
  final pages = [
    SkOnboardingModel(
        title: 'طباعة',
        description: 'كل الطابعات تحت خدمتك',
        titleColor: Colors.black,
        descripColor: const Color(0xFF929794),
        imagePath: 'https://m7et.com/wp-content/uploads/2020/04/7330-1-300x300.jpg'),
    SkOnboardingModel(
        title: 'خدمة تعليمية',
        description: 'نسههل لك يجاد اشخاص يقومون باعمالك التعليمية',
        titleColor: Colors.black,
        descripColor: const Color(0xFF929794),
        imagePath: 'https://m7et.com/wp-content/uploads/2020/04/7330-1-300x300.jpg'),
    SkOnboardingModel(
        title: 'سلم واستلم',
        description:
            'تقوم بضافتك كتبتك التي لا تحاجها وايضا يوجود الكثير من الكتب النستعملةةة',
        titleColor: Colors.black,
        descripColor: const Color(0xFF929794),
        imagePath: 'https://m7et.com/wp-content/uploads/2020/04/7330-1-300x300.jpg'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SKOnboardingScreen(

        bgColor: Colors.white,
        themeColor: const Color(0xFFF3a979f),
        pages: pages,
        skipClicked: (value) {
          Navigator.of(context).pop();
        },
        getStartedClicked: (value) {
                    Navigator.of(context).pop();

        },
        
      ),
    );
  }
}
