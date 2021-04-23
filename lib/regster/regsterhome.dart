import 'package:flutter/material.dart';
import 'package:ptint/regster/regsterbody.dart';

class SignUpScreen extends StatelessWidget {
  static String routeName = "/sign_up";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("سجل"),
      ),
      body: RegBody(),
    );
  }
}
