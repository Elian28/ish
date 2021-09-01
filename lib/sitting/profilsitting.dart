import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ptint/home/toolshome/custombottom.dart';
import 'package:ptint/sitting/profilebody.dart';

import '../meu.dart';
import '../themePprovider.dart';

class ProfileScreen extends StatelessWidget {
  static String routeName = "/profile";
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("الملف الشخصي"),
      ),
      body: SettingProfile(
        tru: themeProvider.isLightTheme,
      ),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.profile),
    );
  }
}
