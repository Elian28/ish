/* import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class FilePDF extends StatefulWidget {
  @override
  _FilePDFState createState() => _FilePDFState();
}

class _FilePDFState extends State<FilePDF> {

  static const MethodChannel _channel = const MethodChannel('file_picker');
  static const String _tag = 'FilePicker';
  FileType _pickingType;
  static Future<String> _getPath(String type) async {
    try {
      return await _channel.invokeMethod(type);
    } on PlatformException catch (e) {
      print("[$_tag] Platform exception: " + e.toString());
    } 
    return null;
  }

   Future<Map<String, dynamic>> getFilePath({FileType type = FileType.ANY, String fileExtension}) async {
    switch (type) {
      case FileType.ANY:
        final result = await _getPath('ANY');
        return <String, String>{'path': result};
      case FileType.CUSTOM:
        final result = await _getPath('__CUSTOM_' + (fileExtension ?? ''));
        return <String, String>{'path': result};
      default:
        final result = await _getPath('ANY');
        return <String, String>{'path': result};
    }}
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        


        InkWell(
          onTap: () async {
             await _getPath('ANY');
          },
                  child: Icon( Ionicons.md_cloud_download,
          size: MediaQuery.of(context).size.height / 8,
          color: Colors.grey),
        )]);
      
/*          FlatButton.icon(
                          label: Text("Pdf")
                          ,onPressed: ()async {
                          await _getPath('ANY');
                        }, icon: Icon(Icons.photo_filter,size: 90,),), */
      /*   Container(
       */    
  
  }
} */