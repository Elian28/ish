/* class Todo {
  final String title;
  final String description;

  Todo(this.title, this.description);
}

class TodosScreen extends StatelessWidget {
  final List<Todo> todos;

  TodosScreen({Key key, @required this.todos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemCount: todos.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(todos[index].title),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(todo: todos[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  // Declare a field that holds the Todo.
  final Todo todo;

  // In the constructor, require a Todo.
  DetailScreen({Key key, @required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Use the Todo to create the UI.
    return Scaffold(
      appBar: AppBar(
        title: Text(todo.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(todo.description),
      ),
    );
  }
}

class CategoryPage extends StatefulWidget {
  static String id = 'categoryPage';

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                'All Categories',
              ),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: <Widget>[
                      Expanded(
                        child: ListTile(
                          leading: GestureDetector(
                            onTap: () {
                              setState(() {
                                isClicked = !isClicked;
                              });
                            },
                            child: Icon(
                              categories[index].icon,
                            ),
                          ),
                          title: Visibility(
                            visible: isClicked,
                            child: Text(
                              categories[index].name,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                            itemCount: 1,
                            itemBuilder: (context, index) {
                              return ListTile(
                                leading: Text('Hello!'),
                              );
                            }),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
        //   bottomNavigationBar: NavBar(),
      ),
    );
  }
}
 */

/* class MenuShow extends StatefulWidget {
  final String email;
  const MenuShow({Key key, this.email}) : super(key: key);

  @override
  MyTabsState createState() => new MyTabsState(email);
}

class MyTabsState extends State<MenuShow> with SingleTickerProviderStateMixin {
  String email;
  MyTabsState(this.email);
  TabController controller;
  String item1;
  String item2;
  String item3;
  String item4;
  String item5;
  var firestore = Firestore.instance;
  var menuData;
  String tabName;
  int tabLength;
  var tab;
  int i = 0;

  getcategories() {
    return firestore
        .collection('restaurants')
        .document(email)
        .collection('Menu')
        .document(email + 'Menu')
        .collection('Categories')
        .getDocuments();
  }

  @override
  void initState() {
    super.initState();
    getcategories().then((QuerySnapshot docs) {
      if (docs.documents.isNotEmpty) {
        tab = docs.documents;
        tabLength = docs.documents.length;
        docs.documents.forEach((menuData) {
          tabName = menuData.data['name'];
          print(tabName);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabLength,
      child: new Scaffold(
        appBar: new AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: Icon(
              Icons.keyboard_backspace,
            ),
            onPressed: () => Navigator.pop(context),
          ),
          centerTitle: true,
          title: Text(
            "Menu",
          ),
          elevation: 0.0,
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.notifications,
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return Text("data");
                    },
                  ),
                );
              },
            ),
          ],
          bottom: TabBar(
            tabs: [
              Tab(
                text: "One",
              ),
              Tab(
                text: "Two",
              ),
              Tab(
                text: "Three",
              ),
              Tab(
                text: "Four",
              ),
            ],
          ),
        ),
//        bottomNavigationBar: new Material(
//            color: Colors.deepOrange,
//            child: new TabBar(
//                controller: controller,
//                tabs: <Tab>[
//                  new Tab(icon: new Icon(Icons.arrow_forward)),
//                  new Tab(icon: new Icon(Icons.arrow_downward)),
//                  new Tab(icon: new Icon(Icons.arrow_back)),
//                  new Tab(icon: new Icon(Icons.arrow_back)),
//                  new Tab(icon: new Icon(Icons.arrow_back)),
//                ]
//            )
//        ),
        body: new TabBarView(children: <Widget>[
         
          // new burgerShow.BurgerShow(),
        ]),

        bottomNavigationBar: Container(
          height: 50.0,
          child: RaisedButton(
            child: Text(
              "Make A Reservation",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            color: Theme.of(context).accentColor,
            onPressed: () {
         /*      Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Menu()), */
            //  );
            },
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
 */

import 'dart:ui';

import 'package:flutter/material.dart';

class Productss {
  String productId;
  // String image;
  String name;
  String price;
  String category;
  String image;
  bool isliked;
  bool isSelected;

  Productss(
      {this.productId,
      this.name,
      this.category,
      this.price,
      this.isliked,
      this.isSelected = false,
      this.image});
}

class CategoryS {
  String id;
  String name;
  String image;
  bool isSelected;
  List<Productss> productList;

  CategoryS(
      {this.productList,
      this.id,
      this.name,
      this.isSelected = false,
      this.image});
}

class ShowProductScreen extends StatefulWidget {
  @override
  _ShowProductScreenState createState() => _ShowProductScreenState();
}

class _ShowProductScreenState extends State<ShowProductScreen>
    with TickerProviderStateMixin {
  List<CategoryS> categoryList = List();

  TabController _tabController;

  @override
  void initState() {
    super.initState();

    //Add data

    for (int i = 0; i < 10; i++) {
      List<Productss> productList = List();
      for (int j = 0; j < 50; j++) {
        Productss product = Productss(
          productId: "$i-$j",
          price: "${(j + 1) * 10}",
          name: "Product $i-$j",
          image: "assets/icon/Untitled-3@60x60x1.png",
        );

        productList.add(product);
      }

      CategoryS category = CategoryS(
        id: "$i",
        name: "Category $i",
        image: "assets/icon/Untitled-3@60x60x1.png",
        productList: productList,
      );

      categoryList.add(category);
    }

    _tabController = TabController(vsync: this, length: categoryList.length);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          Container(
            height: 100.0,
            child: TabBar(
              controller: _tabController,
              isScrollable: true,
              tabs: categoryList.map((CategoryS category) {
                return CategoryWidget(
                  category: category,
                );
              }).toList(),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(5.0),
              child: TabBarView(
                controller: _tabController,
                children: categoryList.map((CategoryS category) {
                  return Container(
                    child: GridView.count(
                      crossAxisCount: 1,
                      childAspectRatio: 6 / 5,
                      controller: ScrollController(keepScrollOffset: false),
                      scrollDirection: Axis.vertical,
                      children: category.productList.map(
                        (Productss product) {
                          return ProductWidget(
                            product: product,
                          );
                        },
                      ).toList(),
                    ),
                  );
                }).toList(),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CategoryWidget extends StatelessWidget {
  final CategoryS category;

  const CategoryWidget({this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Image(
              image: NetworkImage(category.image),
              height: 60.0,
            ),
          ),
          Text(category.name)
        ],
      ),
    );
  }
}

class ProductWidget extends StatelessWidget {
  final Productss product;

  const ProductWidget({this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(8.0),
        ),
        border: Border.all(
          color: Colors.orange,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Image(
            image: NetworkImage(product.image),
            /*      image: NetworkImage(
                'https://arab2p.com/wp-content/uploads/2015/11/2016.07.02.15.42.19.png'),
            fit: BoxFit.contain,
            //height: 80.0,
           */
          ),
          Text(product.name)
        ],
      ),
    );
  }
}

class AppData {
  static List<Product> productList = [
    Product(
        id: 1,
        title: 'Elean',
        price: 240.00,
        isSelected: true,
        isliked: false,
        image:
            'https://arab2p.com/wp-content/uploads/2015/11/2016.07.02.15.42.19.png',
        category: "Trending Now"),
    Product(
        id: 2,
        title: ',Elean',
        price: 220.00,
        isliked: false,
        image:
            'https://arab2p.com/wp-content/uploads/2015/11/2016.07.02.15.42.19.png',
        category: "Trending Now"),
  ];
  static List<Product> cartList = [
    Product(
        id: 1,
        title: 'Elean',
        price: 240.00,
        isSelected: true,
        isliked: false,
        image:
            'https://arab2p.com/wp-content/uploads/2015/11/2016.07.02.15.42.19.png',
        category: "Trending Now"),
    Product(
        id: 2,
        title: 'Elean',
        price: 190.00,
        isliked: false,
        image:
            'https://arab2p.com/wp-content/uploads/2015/11/2016.07.02.15.42.19.png',
        category: "Trending Now"),
    Product(
        id: 1,
        title: 'Elean',
        price: 220.00,
        isliked: false,
        image:
            'https://arab2p.com/wp-content/uploads/2015/11/2016.07.02.15.42.19.png',
        category: "Trending Now"),
    Product(
        id: 2,
        title: 'Elean',
        price: 240.00,
        isSelected: true,
        isliked: false,
        image:
            'https://arab2p.com/wp-content/uploads/2015/11/2016.07.02.15.42.19.png',
        category: "Trending Now"),
  ];

/*   static List<Category> categoryList = [
    Category(
        id: 1,
        titleRegions: "الكل ",
        image:
            'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80',
        isSelected: true),
    Category(
      id: 2,
      titleRegions: "الدمام",
      image:
          'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    ),
    Category(
      id: 3,
      titleRegions: "الرياض",
      image:
          'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    ),
    Category(
      id: 4,
      titleRegions: "ابها",
      image:
          'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    ),
  ];

 */

}

class Product {
  int id;
  String title;
  String category;
  String image;
  double price;
  bool isliked;
  bool isSelected;

  Product(
      {this.id,
      this.title,
      this.category,
      this.price,
      this.isliked,
      this.isSelected = false,
      this.image});
}

class Category {
  int id;
  String titleRegions;
  String image;
  bool isSelected;
  List<Product> productList;
  Category(
      {this.productList,
      this.id,
      this.titleRegions,
      this.isSelected = false,
      this.image});
}

class SubCategories {
  final String title;
  final String id;

  SubCategories({
    this.title,
    this.id,
  });
}
