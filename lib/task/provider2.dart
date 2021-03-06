import 'package:flutter/material.dart';

class CounterProvider extends InheritedWidget {
  Widget child;

  int counter = 0;
  CounterProvider({this.child});

  @override
  bool updateShouldNotify(CounterProvider oldWidget) {
    return oldWidget.counter != counter;
  }

  static CounterProvider of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType();
}

class HomeItem2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = CounterProvider.of(context);
    return Scaffold(
        appBar: AppBar(title: Text("CounterProvider"), actions: [
          Row(
            children: [
              InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => Item2()));
                  },
                  child: Icon(Icons.shopping_cart)),
            ],
          ),
        ]),
        body: Center(child: StatefulBuilder(builder:
            (BuildContext context, void Function(void Function()) setState) {
          return Column(children: [
            InkWell(child: Center(child: Text("${provider.counter}"))),
            IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  setState(() {
                    provider.counter++;
                  });
                })
          ]);
        })));
  }
}

class Item2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var p = CounterProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Item2"),
      ),
      body: Center(child: StatefulBuilder(builder:
          (BuildContext context, void Function(void Function()) setState) {
        return Column(children: [
          InkWell(child: Center(child: Text("${p.counter}"))),
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                setState(() {
                  p.counter++;
                });
              })
        ]);
      })),
    );
  }
}
