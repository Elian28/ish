/* import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:pdftron_flutter/pdftron_flutter.dart';

class MyApp666 extends StatefulWidget {
  @override
  _MyApp666State createState() => _MyApp666State();
}

class _MyApp666State extends State<MyApp666> {
  String _version = 'Unknown';

  @override
  void initState() {
    super.initState();
    initPlatformState();

    PdftronFlutter.openDocument(
        "https://pdftron.s3.amazonaws.com/downloads/pdfref.pdf");
  }

  // Platform messages are asynchronous, so we initialize via an async method.
  Future<void> initPlatformState() async {
    String version;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      PdftronFlutter.initialize("");
      version = await PdftronFlutter.version;
    } on PlatformException {
      version = 'Failed to get platform version.';
    }

    if (!mounted) return;

    setState(() {
      _version = version;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('PDFTron flutter app'),
        ),
        body: Center(
          child: Text('Running on: $_version\n'),
        ),
      ),
    );
  }
}
 */