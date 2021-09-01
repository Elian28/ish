import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        child: Column(children: [
          ListView(
            children: <Widget>[
              // ***PROFILE IMAGE
              Container(
                height: 250,
                child: DrawerHeader(
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        Material(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              'assets/images/user.png',
                              width: 200,
                              height: 200
                            ) ) ) ] ) ) ) ),
              // ***LIST TILE
               /*   CustomListTile(Icons.person, 'Profile',()=>{}),
            CustomListTile(Icons.add_location, 'Condominium',()=>{}),
            CustomListTile(Icons.map, 'Plan',()=>{}),
            CustomListTile(Icons.color_lens, 'Design',()=>{}), */
            ] ),
             Expanded(child: Text("data") // Your image here
              )
        ]) ) ); }
}
 
//قم بتحويل الصور التي تم النقر فوقها من هاتفك إلى ملف pdf في رفرفة باستخدام image_clicker وحزمة pdf
/* import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class IsPDF extends StatefulWidget {
  @override
  _IsPDFState createState() => _IsPDFState();
}

class _IsPDFState extends State<IsPDF> {
  List<File> _files = [];
  final pdf = pw.Document();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        centerTitle: true,
      ),
      body: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: new GridView.builder(
              itemCount: _files.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemBuilder: (context, index) {
                return displaySelectedFile(_files[index]);
              },
            ),
          ),
          Positioned(
            left: 30.0,
            bottom: 18.0,
            child: RaisedButton(
              onPressed: () {
                for (var i = 0; i < _files.length; i++) {
                  // added this
                  var image = PdfImage.file(
                    pdf.document,
                    bytes: File(_files[i].path).readAsBytesSync(),
                  );

                  pdf.addPage(pw.Page(
                      pageFormat: PdfPageFormat.a4,
                      build: (pw.Context context) {
                        return pw.Center(child: pw.Image(image));
                      }));
                }
              },
              color: Colors.blue,
              child: Text(
                'Get PDF',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          File cameraFile;
          print('Pressed');
          cameraFile = await ImagePicker.pickImage(source: ImageSource.camera);
          print(cameraFile.path);
          List<File> temp = _files;
          temp.add(cameraFile);
          setState(() {
            _files = temp;
          });
        },
        child: Icon(Icons.camera_alt),
      ),
    );
  }

  Widget displaySelectedFile(File file) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: SizedBox(
        height: 200.0,
        width: 200.0,
        child: Image.file(file),
      ),
    );
  }
}
 */



class MyAppIIMg extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Test(),
    );
  }
}

class Test extends StatefulWidget {
  Test({Key key}) : super(key: key);

  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  List<String> _images = new List<String>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        itemCount: _images.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemBuilder: (BuildContext context, int index) {
          return Container(
              padding: const EdgeInsets.all(2),
              child: Image.asset(_images[index], fit: BoxFit.cover));
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {

      ImagePicker().getImage(source: ImageSource.gallery)

          
         /*   ImagePicker.pickImage(source: ImageSource.gallery)*/.then((image) {
            if (image != null) {
              setState(() {
                _images.add(image.path);
              });
            }
          });
        }
      )
    );
  }
}
 

 