import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ptint/3/app.dart';
import 'package:ptint/card/PersonalCards.dart';
import 'package:ptint/card/cra.dart';
import 'package:ptint/staye/printNew.dart';
import '../3/_New.dart';
import '_GradientPainter.dart';

// الطباعة صفحة الرئيسية حقت
class Pri extends StatefulWidget {
  @override
  _PriState createState() => _PriState();
}

class _PriState extends State<Pri> {
  bool _osLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
/*         floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.blue,
            child: Icon(Icons.add),
            onPressed: () {}), */
        endDrawer: AppDrawer1(),
        appBar: AppBar(title: Text("الطلبات")),
        body: Padding(
            padding: const EdgeInsets.all(15),
            child: _osLoading ? _loading() : _form(context)));
  }

  Widget _loading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _form(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          color: Colors.red,
          height: 150,
        ),
        form(context),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              children: <Widget>[
                _categories(
                    "كروت شخصية",
                    //////"https://png.pngtree.com/png-clipart/20200709/original/pngtree-photography-business-card-png-image_3553119.jpg",
                    BoxFit.cover,
                    LongPersonalCard()),
              ],
            ),
            _categories(
                "111111",
                ////"https://images.pexels.com/photos/669615/pexels-photo-669615.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
                BoxFit.cover,
                Cards(

                )),
            _categories(
                "بروشور / فلاير ",
                ////"https://khamsat.hsoubcdn.com/images/services/57MediaQuery.of(context).size.height / 5526/ebb9c2b1b81de20669d8126548216ac6.jpg",
                BoxFit.cover,
                Cards()),
          ],
        ),
        SizedBox(width: 0, height: MediaQuery.of(context).size.height / 55),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              children: <Widget>[
                _categories(
                    "فولدر",
                    ////"https://www.my.alphagraphics.com.sa/images/product/folder-large.jpg",
                    BoxFit.cover,
                    LongPersonalCard()),
              ],
            ),
            SizedBox(),
            _categories(
                "ورق مراسلات ",
                ////"https://cdn.salla.sa/4IKxkmzZdkM5414YeNvxuqPtnos98lX49zxUg7Y4.jpeg",
                BoxFit.cover,
                LongPersonalCard()),
            SizedBox(),
            _categories(
                "اظرف",
                ////"https://cdn.pixabay.com/photo/2020/03/18/08/06/envelope-4943161_1280.jpg",
                BoxFit.cover,
                LongPersonalCard()),
            SizedBox(),
          ],
        ),
        SizedBox(width: 0, height: MediaQuery.of(context).size.height / 55),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              children: <Widget>[
                _categories(
                    "بوستر / ستيكر",
                    ////"https://i.pinimg.com/originals/ee/6d/ea/ee6dea171adMediaQuery.of(context).size.height / 552c39c45401400f2a2dc.jpg",
                    BoxFit.cover,
                    LongPersonalCard()),
              ],
            ),
            SizedBox(),
            _categories(
                /* " مانيوال تدريبي / كتاب", */
                "أكياس ورقية",
                //"https://mimgcdn.haraj.com.sa/userfiles30/2019-1-3/469x465-1_-caodI063d8N8XW.jpg",
                BoxFit.cover,
                LongPersonalCard()),
            SizedBox(),
            _categories(
                "شهادات",
                //"https://www.publicdomainpictures.net/pictures/290000/velka/online-certificate.jpg",
                BoxFit.cover,
                LongPersonalCard()),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              children: <Widget>[
                _categories(
                    "مجلات",
                    //"https://images.pexels.com/photos/623046/pexels-photo-623046.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
                    BoxFit.cover,
                    LongPersonalCard()),
              ],
            ),
            SizedBox(),
            _categories(
                " كتالوج / منيو طعام",
                //"https://images.pexels.com/photos/3636100/pexels-photo-3636100.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500",
                BoxFit.cover,
                LongPersonalCard()),
            SizedBox(),
            _categories(
                "ملصقات",
                //"https://upload.3dlat.com/uploads/3dlat.com_28_18_18a6_9c59cddc60733.jpg",
                BoxFit.cover,
                LongPersonalCard()),
            SizedBox(),
          ],
        ),
        SizedBox(width: 0, height: MediaQuery.of(context).size.height / 55),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              children: <Widget>[
                _categories(
                    "رسالة علمية",
                    //"https://master-theses.com/wp-content/uploads/%D9%83%D8%AA%D8%A7%D8%A8%D8%A9-%D8%B1%D8%B3%D8%A7%D9%84%D8%A9-%D8%B9%D9%84%D9%85%D9%8A%D8%A9-600x400.jpg",
                    BoxFit.contain,
                    LongPersonalCard()),
              ],
            ),
            SizedBox(),
            _categories(
                " طباعة ألوان / إسود",
                //"https://images.unsplash.com/photo-1503694978374-8a2fa686963a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80",
                BoxFit.fill,
                LongPersonalCard()),
            SizedBox(),
            _categories(
                /* لوحات */
                "١١١ ",
                //"https://upload.3dlat.com/uploads/3dlat.com_28_18_18a6_9c59cddc60733.jpg",
                BoxFit.cover,
                LongPersonalCard()),
            SizedBox(),
          ],
        ),
        SizedBox(width: 0, height: MediaQuery.of(context).size.height / 55),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              children: <Widget>[
                _categories(
                    "رول اب",
                    //"https://www.arkanaltasmem.com/wp-content/uploads/2020/02/391134-qpoUU-1566MediaQuery.of(context).size.height / 5537MediaQuery.of(context).size.height / 55-5d5afb8cabcdb-250x222.jpg",
                    BoxFit.cover,
                    LongPersonalCard()),
              ],
            ),
            SizedBox(),
            _categories(
                " أوت دور",
                //"https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTXLYQ1WrQWGxFhwPOymtgcEn9wkIxg31ZTBw&usqp=CAU",
                BoxFit.cover,
                LongPersonalCard()),
            SizedBox(),
            _categories(
                "إن دور",
                //"https://eg.sptechs.com/emarket/thumbs/e600/item413600.jpg",
                BoxFit.fill,
                LongPersonalCard()),
            SizedBox(),
          ],
        ),
        SizedBox(width: 0, height: MediaQuery.of(context).size.height / 55),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              children: <Widget>[
                _categories(
                    "بلوك نوت",
                    //    ////"https://pbs.twimg.com/media/BZERx5dIUAANVJQ.jpg",
                    BoxFit.fill,
                    LongPersonalCard()),
              ],
            ),
            SizedBox(),
            _categories(
                "كارت ID ",
                //  ////"https://www.nabadv.com/images/cards/plastic-card-id.png",
                BoxFit.cover,
                LongPersonalCard()),
            SizedBox(),
            _categories(
                "111ff",
                //   ////"https://upload.3dlat.com/uploads/3dlat.com_28_18_18a6_9c59cddc60733.jpg",
                BoxFit.cover,
                LongPersonalCard()),
            SizedBox(),
          ],
        ),
        SizedBox(width: 0, height: MediaQuery.of(context).size.height / 55),
      ],
    );
  }

//الفئات
  Widget _categories(
      String txt, /* String img, */ BoxFit box, dynamic _onTaps) {
    return Column(
      children: <Widget>[
        InkWell(
          onTap: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (BuildContext context) => _onTaps));
          },
          child: Container(
            width: MediaQuery.of(context).size.width / 4,
            height: MediaQuery.of(context).size.height / 7,
/*             decoration: BoxDecoration(
                color: Colors.cyan,
                image: DecorationImage(image: NetworkImage(img), fit: box),
                //  borderRadius: BorderRadius.all(Radius.circular(75.0)),
                boxShadow: [
                  BoxShadow(blurRadius: 7.0, color: Colors.yellow[800])
                ]), */
          ),
        ),
        Text(txt, style: TextStyle(fontSize: 16)),
      ],
    );
  }
}

// مربع ملون
Widget form(BuildContext context) {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        UnicornOutlineButton(
          strokeWidth: 2,
          radius: 16,
          gradient: LinearGradient(
            //TODO
             colors: [Colors.black, Colors.redAccent] ),
          child: Text('اقرب قرطاسية', style: TextStyle(fontSize: 16)),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => PrintNew()));
          },
        ),
        UnicornOutlineButton(
          strokeWidth: 2,
          radius: 16,
          gradient: LinearGradient(
            
            
            
            colors: [Colors.black, Colors.redAccent ]),
          child: Text('ارسل غرض', style: TextStyle(fontSize: 16)),
          onPressed: () {},
        ),
        UnicornOutlineButton(
          strokeWidth: 2,
          radius: 16,
          gradient: LinearGradient(colors: [Colors.black, Colors.redAccent]),
          child: Text('اطلب خدمة', style: TextStyle(fontSize: 16)),
          onPressed: () {
            return Navigator.of(context).push(
                MaterialPageRoute(builder: (BuildContext context) => News()));
          },
        ),
      ],
    ),
  );
}
