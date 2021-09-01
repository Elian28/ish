/* /* import 'package:flutter/material.dart';

class cartConstant {
  static int packageCount;
  static List<int> list;
}

class OrderPage extends StatefulWidget {
  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  int data = 3;

  void refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          automaticallyImplyLeading: true,
          iconTheme: IconThemeData(
            color: Colors.black54, //change your color here
          ),
          backgroundColor: Colors.white,
          elevation: 1,
          title: Text(
            "",
            style: TextStyle(color: Colors.black54),
          ),
          centerTitle: true),
      body: Container(
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
      ),
      bottomNavigationBar: _buildTotalContainer(),
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
                      "المجموع الفرعي",
                      style: TextStyle(
                          color: Color(0xFF9BA7C6),
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      cartConstant.packageCount.toString(),
                      style: TextStyle(
                          color: Color(0xFF6C6D6D),
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold),
                    )
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
          Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("إجمالي سلة التسوق",
                    style: TextStyle(
                        color: Color(0xFF9BA7C6),
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold)),
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
//              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => SignInPage()));
              },
              child: Container(
                  height: 50.0,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(35.0),
                  ),
                  child: Center(
                      child: Text("باشرالخروج من الفندق",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold))))),
          SizedBox(height: 20.0),
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
    return Card(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
            child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFFD3D3D3), width: 2.0),
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
                                  if (_counter > 20) {
                                    _counter = 20;
                                  }
                                });

                                widget.callback();
                              },
                              child: Icon(Icons.add, color: Color(0xFFD3D3D3))),
                          Text(
                            "$_counter",
                            style:
                                TextStyle(fontSize: 18.0, color: Colors.grey),
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
                              child:
                                  Icon(Icons.remove, color: Color(0xFFD3D3D3))),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 20.0),
                  Container(
                    height: 70.0,
                    width: 70.0,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                "https://i.pinimg.com/564x/9c/7a/83/9c7a8334ee3cbe278db6d957039c0021.jpg"),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(35.0),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black54,
                              blurRadius: 5.0,
                              offset: Offset(0.0, 2.0))
                        ]),
                  ),
                  SizedBox(width: 20.0),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "الطلب",
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 5.0),
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
                                            color: Color(0xFFD3D3D3),
                                            fontWeight: FontWeight.bold)),
                                    SizedBox(
                                      width: 5.0,
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      child: Text(
                                        getPrice(_counter, 2000).toString(),
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10.0,
                                    )
                                  ])
                                ]))
                      ]),
                  Spacer(),
                  GestureDetector(
                      onTap: () {},
                      child: Icon(
                        Icons.cancel,
                        color: Colors.grey,
                      ))
                ])));
  }
}

class OrderPage1 extends StatefulWidget {
  @override
  _OrderPage1State createState() => _OrderPage1State();
}

class _OrderPage1State extends State<OrderPage1> {
  Future<List<double>> getData() async {
    return items;
  }

  Future<double> removeIt(int index) async {
    return items.removeAt(index);
  }

  List<double> items = [100.0, 900.0, 300.0, 400.0];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: FutureBuilder<List<double>>(
        future: getData(),
        builder: (BuildContext context, AsyncSnapshot<List<double>> snapshot) {
          if (snapshot.hasData)
            return Column(
              children: <Widget>[
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) => ListTile(
                    title: Text('Items : ${snapshot.data[index]}'),
                    trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () async {
                          await removeIt(index);
                          setState(() {});
                        }),
                  ),
                ),
                Container(
                  child:
                      Text('Sum is: ${snapshot.data.fold(0, (a, b) => a + b)}'),
                )
              ],
            );

          return Center(child: CircularProgressIndicator());
        },
      ),
    ));
  }
}
 */

import 'package:flutter/material.dart';

class PDDF extends StatefulWidget {
  @override
  _PDDFState createState() => _PDDFState();
}

class _PDDFState extends State<PDDF> {
  Future<List<double>> getData() async {
    return items;
  }

  Future<double> removeIt(int index) async {
    return items.removeAt(index);
  }

  List<double> items = [100.0, 200.0, 300.0, 400.0];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: FutureBuilder<List<double>>(
        future: getData(),
        builder: (BuildContext context, AsyncSnapshot<List<double>> snapshot) {
          if (snapshot.hasData)
            return Column(
              children: <Widget>[
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) => ListTile(
                    title: Text('Items : ${snapshot.data[index]}'),
                    trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () async {
                          await removeIt(index);
                          setState(() {});
                        }),
                  ),
                ),
                Container(
                  child:
                      Text('Sum is: ${snapshot.data.fold(0, (a, b) => a + b)}'),
                )
              ],
            );

          return Center(child: CircularProgressIndicator());
        },
      ),
    ));
  }
}
 */