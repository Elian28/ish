/* /* 

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Book {
  String idBook;
  String image; // الصور
  String authorName; // اسم المؤلف
  String datePublication; // تاريخ النشر
  double price; // السعر
  int iphone; // رقم الهاتف
  String description; // الوصف
  String city; // المدينة
  String productStatus; // حال المنتج
  String name;
  String nameBook; // اسم الكتاب
  String darAlNasher; // دار النشر
  String bookLanguage; // لغة الكتاب
  String edition; // الطبعة
  var category;
  String alerts;

  Book({
    this.idBook,
    this.image,
    this.authorName,
    this.datePublication,
    this.price,
    this.iphone,
    this.description,
    this.productStatus,
    this.city,
    this.name,
    this.category,
    this.nameBook,
    this.darAlNasher,
    this.bookLanguage,
    this.edition,
    this.alerts,
  });

  viewBook() {
    FirebaseFirestore.instance.collection("Book").doc().set({
      "image": image,
      "idBook": idBook,
      "authorName": authorName,
      "datePublication": datePublication,
      "price": price,
      "iphone": iphone,
      "description": description,
      "productStatus": productStatus,
      "city": city,
      "university": name,
      "category": category,
      "nameBook": nameBook,
      "darAlNasher": darAlNasher,
      "bookLanguage": bookLanguage,
      "edition": edition,
      "alerts": alerts,
    });
  }
}

class IconTile extends StatelessWidget {
  final String imgAssetPath;
  final Color backColor;

  IconTile({this.imgAssetPath, this.backColor});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
            margin: EdgeInsets.only(right: 16),
            child: Container(
                height: 40,
                width: 35,
                decoration: BoxDecoration(
                    color: backColor, borderRadius: BorderRadius.circular(15)),
                child: Image.network(imgAssetPath, width: 20))));
  }
}
 */

import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;




class Book {
  String idBook;
  String image; // الصور
  String authorName; // اسم المؤلف
  String datePublication; // تاريخ النشر
  double price; // السعر
  int iphone; // رقم الهاتف
  String description; // الوصف
  String city; // المدينة
  String productStatus; // حال المنتج
  String university;
  String nameBook; // اسم الكتاب
  String darAlNasher; // دار النشر
  String bookLanguage; // لغة الكتاب
  String edition; // الطبعة
  var category;
  String alerts;

  Book({
    this.idBook,
    this.image,
    this.authorName,
    this.datePublication,
    this.price,
    this.iphone,
    this.description,
    this.productStatus,
    this.city,
    this.university,
    this.category,
    this.nameBook,
    this.darAlNasher,
    this.bookLanguage,
    this.edition,
    this.alerts,
  });

  viewBook() {
    FirebaseFirestore.instance.collection("Book").doc().set({
      "image": image,
      "idBook": idBook,
      "authorName": authorName,
      "datePublication": datePublication,
      "price": price,
      "iphone": iphone,
      "description": description,
      "productStatus": productStatus,
      "city": city,
      "university": university,
      "category": category,
      "nameBook": nameBook,
      "darAlNasher": darAlNasher,
      "bookLanguage": bookLanguage,
      "edition": edition,
      "alerts": alerts,
    });
  }

// تنزيل الثور
  Future<String> downloadImages(File image) async {
    String name = Random().nextInt(1000).toString() + "products";
    final Reference storageReference =  FirebaseStorage.instanceFor().ref().child(name);
    final UploadTask uploadTask = storageReference.putFile(image);
    TaskSnapshot responseSnapshot =await uploadTask.whenComplete(() => null);
    String url = await responseSnapshot.ref.getDownloadURL();
    return url;
  } // النهاية
}

// الفاتورة
class Transaction1 {
  String id;
  String title;
  double quantity;
  DateTime data;

  Transaction1({

    this.id,
    this.data,
    this.title,
    this.quantity,
  });
}

class Transaction {
  final String id;
  final String title;
  final double amount;
  final DateTime date;

  Transaction({
    this.id,
    this.title,
    this.amount,
    this.date,
  });
}


class Product1 with ChangeNotifier {
  final String id;
  final String title;
  final double price;
  final String description;
  final String imageUrl;
  bool isFavorite;
  Product1(
      {this.id,
      this.title,
      this.description,
      this.imageUrl,
      this.price,
      this.isFavorite = false});

  Future<void> toggleIsFavorite(String token) async {
    final oldFavorite = isFavorite;
    isFavorite = !isFavorite;
    notifyListeners();

    final url =
        'https://marketapp-fe785.firebaseio.com/products/$id.json?auth=$token';
    try {
      final response =
          await http.patch(url, body: json.encode({'isFavorite': isFavorite}));

      if (response.statusCode >= 400) {
        isFavorite = oldFavorite;
        notifyListeners();
      }
    } catch (_) {
      isFavorite = oldFavorite;
      notifyListeners();
    }
  }
}
 */