import 'package:flutter/material.dart';
import 'package:ptint/themes/LightColor.dart';

import 'gg.dart';

class cartConstant {
  static int packageCount;
  static List<int> list;
}

class OrderPage extends StatefulWidget {
  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  int data = 1;

  void refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        builder: (context, snapshot) {
//            var datas = snapshot.data;
          return ListView.builder(
            physics: ClampingScrollPhysics(),
            shrinkWrap: true,
            itemCount: data,
            itemBuilder: (BuildContext context, int index) {
//                Cart cart = datas[index];
              return CartListView(refresh);
            },
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            scrollDirection: Axis.vertical,
          );
        },
      ),
    );
  }

  Widget _buildTotalContainer() {
    return Container(
        height: 220.0,
        padding: EdgeInsets.only(left: 10.0, right: 10.0),
        child: Column(children: <Widget>[
          SizedBox(height: 10.0),
          Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "سعر الطباعة",
                      style: TextStyle(
                          color: Color(0xFF9BA7C6),
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(cartConstant.packageCount.toString(),
                        style: TextStyle(
                            color: Color(0xFF6C6D6D),
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold))
                  ])),
          SizedBox(height: 15),
          Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("خصم",
                    style: TextStyle(
                        color: Color(0xFF9BA7C6),
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold)),
                Text("0.0",
                    style: TextStyle(
                        color: Color(0xFF6C6D6D),
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold))
              ]),
          SizedBox(height: 10.0),
          Divider(height: 2.0),
          SizedBox(height: 20.0),
          Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "إجمالي سلة التسوق",
                  style: TextStyle(
                      color: Color(0xFF9BA7C6),
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold),
                ),
                Text("8000",
                    style: TextStyle(
                        color: Color(0xFF6C6D6D),
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold))
              ]),
          SizedBox(
            height: 20.0,
          ),
          GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => PageHome()));
              },
              child: Container(
                  height: 50.0,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(35.0),
                  ),
                  child: Center(
                      child: Text("تاكيد الطلب",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold)))))
        ]));
  }
}

class CartListView extends StatefulWidget {
  final VoidCallback callback;

  CartListView(this.callback);
  @override
  _CartListViewState createState() => _CartListViewState();
}

class _CartListViewState extends State<CartListView> {
  int _counter = 1;
  int getPrice(int i, int priceC) {
    cartConstant.packageCount = i * priceC;
    return cartConstant.packageCount;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
                child: Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: Color(0xFFD3D3D3), width: 2.0),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10.0,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              InkWell(
                                  onTap: () {
                                    setState(() {
                                      _counter++;
                                      if (_counter > 100) {
                                        _counter = 1;
                                      }
                                    });

                                    widget.callback();
                                  },
                                  child: Icon(Icons.add,
                                      color: Color(0xFFD3D3D3))),
                              Text(
                                "$_counter",
                                style: TextStyle(
                                    fontSize: 18.0, color: Colors.grey),
                              ),
                              InkWell(
                                  onTap: () {
                                    setState(() {
                                      _counter--;
                                      if (_counter < 2) {
                                        _counter = 1;
                                      }
                                    });

                                    widget.callback();
                                  },
                                  child: Icon(Icons.remove,
                                      color: Color(0xFFD3D3D3))),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(width: 20.0),
                      Expanded(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                            Text(
                              " الطباعة",
                              style: TextStyle(
                                  fontSize: 12.0, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "تفاصيل الطباعة, تفاصيل الطباعة,تفاصيل الطباعة,تفاصيل الطباعة,تفاصيل الطباعةتفاصيل الطباعةتفاصيل الطباعة",
                              style: TextStyle(
                                  fontSize: 12.0, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 5.0),
                            Container(
                                height: 25.0,
                                width: 120.0,
                                child: ListView(
                                    scrollDirection: Axis.horizontal,
                                    children: <Widget>[
                                      Row(children: <Widget>[
                                        Text("السعر",
                                            style: TextStyle(
                                                fontSize: 11,
                                                color: Color(0xFFD3D3D3),
                                                fontWeight: FontWeight.bold)),
                                        SizedBox(width: 5.0),
                                        InkWell(
                                          onTap: () {},
                                          child: Text(
                                            getPrice(_counter, 1).toString(),
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.red,
                                              fontSize: 11,
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 10.0)
                                      ])
                                    ]))
                          ])),
                      //  Spacer(),
                      /*     
                      Expanded(
                        child: Container(
                          height: 70.0,
                          width: 70.0,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("https://www.hiamag.com/sites/default/files/styles/album/public/hiaimages/14/05/2019/8078296184654819.jpg"),
                                  fit: BoxFit.cover),
                              // borderRadius: BorderRadius.circular(35.0),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black54,
                                    blurRadius: 5.0,
                                    offset: Offset(0.0, 2.0))
                              ]),
                        ),
                      ), */
                      Align(
                          alignment: Alignment.bottomLeft,
                          child: Container(
                              height: 70,
                              width: 70,
                              child: Stack(children: <Widget>[
                                Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Container(
                                        decoration: BoxDecoration(
                                            color: LightColor.lightGrey,
                                            borderRadius:
                                                BorderRadius.circular(10))))
                              ]))),
                    ]))),
        Expanded(
            child: GestureDetector(
                onTap: () {},
                child: Icon(Icons.cancel, color: LightColor.iconColor))),
      ],
    );
  }
}
