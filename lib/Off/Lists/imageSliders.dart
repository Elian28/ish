import 'package:flutter/material.dart';
import 'imgList.dart';

final List<String> _tltle = [
  "اطبعها عني \n تحتاج تطبع وماعندك سياره برنت ",
  "العروض",
  "ارسال ملخصك لكل القرطاسيات الموجودة مجاننا",
];
/* final List<dynamic> _onTap = [
  HomesScreen(),
  HomesScreen(),
  HomesScreen(),
  HomesScreen(),
]; */
BuildContext context;
final List<Widget> imageView = imgList
    .map((item) => Container(
          child: Container(
            margin: EdgeInsets.all(5.0),
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                child: Stack(
                  children: <Widget>[
                    InkWell(
                        onTap: () {},
                        child: Image.network(item,
                            fit: BoxFit.cover, width: 1000.0)),
                    Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(200, 0, 0, 0),
                              Color.fromARGB(0, 0, 0, 0)
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        child: Text(
                          ' ${_tltle.indexOf(item)}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        ))
    .toList();
