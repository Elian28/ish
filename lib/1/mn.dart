import 'package:flutter/material.dart';
import 'package:shape_of_view/shape_of_view.dart';
import 'package:flutter/animation.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class MyApp1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new FirstPage(),
    );
  }
}

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {

  //create Instance of this class ExpandableView
  ExpandableView expandableView=new ExpandableView();

  List<String> list=['asset/frock1.png','asset/frock2.png',
  'asset/frock3.png','asset/frock4.png','asset/frock5.png',
  'asset/frock6.png','asset/frock8.png'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: new AppBar(
        backgroundColor: Colors.cyan[900],
        title: new Text("E-Commerce App",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.expand_more), onPressed: () {
            expandableView.expandedView.tappedEvent();
          })
        ],
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 5,
                ),
                myList(context),
                Row(
                  children: <Widget>[
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: Image.asset("asset/image2.png",
                              scale: 6.5,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: Image.asset("asset/img1.png",
                              scale: 6.5,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(5, 0, 10, 0),
                            child: Image.asset("asset/img7.png",
                              scale: 6.5,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: Image.asset("asset/img3.png",
                              scale: 6.5,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: Image.asset("asset/img4.png",
                              scale: 6.5,
                            ),
                          )

                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                        child: Container(
                          height: 200,
                          child: Swiper(
                            itemCount: 5,
                            viewportFraction: 0.4,
                            scale: 0.5,
                            itemBuilder: (BuildContext context,int index){
                              if(index==0){
                                return Image1("asset/image2.png");
                              }
                              else if(index==1){
                                return Image1("asset/image7.png");
                              }
                              else if(index==2){
                                return Image1("asset/img00.png");
                              }else if(index==3){
                                return Image1("asset/Cap.png");
                              }
                              else{
                                return Image1("asset/img0.png");
                              }
                            },
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                List1(),
              SizedBox(
              height:10
              ),
                Expanded(
                  child: ListView.builder(
                    itemCount: list.length,
                    itemBuilder: (context,index){
                      return Container(
                        child: Card(
                          semanticContainer: true,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: Row(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8),
                                child: Image.asset(
                                  list[index],
                                  scale: 2.5,
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text("Grey Frock",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,

                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Different Colour available on Request",
                                    style: TextStyle(
                                      color: Colors.grey[600],
                                      fontSize: 10,
                                    ),
                                  )
                                ],
                              ),
                              Spacer(),
                              GestureDetector(
                                onTap: (){
                                  ModelProject model=new ModelProject(
                                    "Grey Frock","Different Colour available on Request",
                                    list[index]
                                  );
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context)=>Second(),
                                      settings: RouteSettings(
                                        arguments: model,
                                      )
                                    )
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                                  child: Icon(
                                    Icons.add,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  )
                )

              ],
            )
          ),
          new Column(
            children: <Widget>[expandableView],
          )
        ],
      ),
    );
  }

  Widget myList(BuildContext context){
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        child: Row(
          children: <Widget>[
            CardDesign("T-Shirts"),
            CardDesign("Shoes"),
            CardDesign("Trouser"),
            CardDesign("Watches"),
            CardDesign("Jeans"),
            CardDesign("Long Sleeved"),
            CardDesign("Towels"),
            CardDesign("Scarfs"),
            CardDesign("Hats")
          ],
        ),
      ),
    );
  }
  Widget CardDesign(String text){
    return Card(
      color: Colors.cyan[700],
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
  Widget Image1(dynamic image){
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(image),
        )
      ),
    );
  }

  Widget List1(){
    Color color=Colors.cyan[900];
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        child: Row(
          children: <Widget>[
            CardDesign1("T-Shirts",Icon(Icons.visibility,color: color,)),
            CardDesign1("Shoes",Icon(Icons.account_balance,color: color,)),
            CardDesign1("Trouser",Icon(Icons.accessibility_new,color: color,)),
            CardDesign1("Watches",Icon(Icons.category,color: color,)),
            CardDesign1("Jeans",Icon(Icons.voicemail,color: color,)),
            CardDesign1("Long Sleeved",Icon(Icons.web_asset,color: color,)),
            CardDesign1("Towels",Icon(Icons.wb_cloudy,color: color,)),
            CardDesign1("Scarfs",Icon(Icons.view_stream,color: color,)),
            CardDesign1("Hats",Icon(Icons.video_library,color: color,))
          ],
        ),
      ),
    );
  }

  Widget CardDesign1(String text,Icon icon){
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: <Widget>[
            icon,
            SizedBox(
              width: 5,
            ),
            Text(text,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16
              ),
            )
          ],
        ),
      ),
    );
  }

}
// run code
class ModelProject{
  String title,description,image;
  ModelProject(this.title,this.description,this.image);
}
class ExpandableView extends StatefulWidget {
  ExpandedView expandedView = new ExpandedView();
  @override
  ExpandedView createState() => expandedView;
}
class ExpandedView extends State<ExpandableView>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;
  bool isTaped = false;

  @override
  initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 300), vsync: this);
    animation = Tween(begin: 0.0, end: 300.0).animate(
      new CurvedAnimation(
        parent: controller,
        curve: new Interval(
          0.000,
          0.800,
          curve: Curves.linear,
        ),
      ),
    )..addListener(() {
      setState(() {
        // the state that has changed here is the animation object’s value
      });
    });
  }

  void tappedEvent() {
    if (!isTaped) {
      controller.forward();
      isTaped = !isTaped;
    } else {
      controller.reverse();
      isTaped = !isTaped;
    }
  }

  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    return new GestureDetector(
      child: new Material(
        elevation: 50.01,
        color: Colors.transparent,
        child: ClipPath(
          clipper: ArcClipper(),
          child: new Container(
            height: animation.value,
            decoration: new BoxDecoration(
                color: Colors.cyan[900],
                gradient: new LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.cyan[800], Colors.cyan[500]],
                  tileMode:
                  TileMode.repeated, // repeats the gradient over the canvas
                ),
                borderRadius: new BorderRadius.vertical(
                    bottom: new Radius.circular(animation.value / 10))
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 20, 0, 0),
              child: Row(

                children: <Widget>[
                  Container(
                    width: width/2-40,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'E-Commerce App',
                          style: new TextStyle(
                              color: Colors.cyan[100],
                              fontWeight: FontWeight.bold,
                              fontSize: 15
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                          child: Text(
                            "Ecommerce is a also known as electronic commerce or internet commerce, refers to the buying and selling of goods or services using the internet, and the transfer of money and data to execute these transactions.",
                            textAlign: TextAlign.justify,
                            style: new TextStyle(

                                fontStyle: FontStyle.italic,
                                color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                  Column(

                    children: <Widget>[
                      Image.asset("asset/frock8.png"),

                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      onTap: () {
        tappedEvent();
      },
    );
  }
}

class ArcClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 30);

    var firstControlPoint = Offset(size.width / 4, size.height);
    var firstPoint = Offset(size.width / 2, size.height);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstPoint.dx, firstPoint.dy);
    var secondControlPoint = Offset(size.width - (size.width / 4), size.height);
    var secondPoint = Offset(size.width, size.height - 30);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondPoint.dx, secondPoint.dy);

    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
class Second extends StatefulWidget {
  @override
  _SecondState createState() => _SecondState();
}

class _SecondState extends State<Second> {

  List<String> list=['asset/frock1.png','asset/frock2.png',
  'asset/frock3.png','asset/frock4.png','asset/frock5.png',
  'asset/frock6.png','asset/frock8.png'
  ];
  //i create a list of color

  List<Color> color1=[Colors.orange[100],Colors.green[100],
  Colors.grey[200],
  Colors.cyan[100],Colors.red[100],Colors.grey[100],
  ];

  @override
  Widget build(BuildContext context) {
    final ModelProject model=ModalRoute.of(context).settings.arguments;
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            height: height-50,
            child: Stack(
              children: <Widget>[
                ShapeOfView(
                  height: 200,
                  width: width,
                  shape: ArcShape(
                    direction: ArcDirection.Outside,
                    height: 50,
                    position: ArcPosition.Bottom,
                  ),
                  child: Container(
                    color: Colors.cyan[900],
                  ),
                ),
                Positioned(
                  top: 110,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Container(
                      height:height-180,
                      width: width-40,
                      child: ShapeOfView(
                        shape: BubbleShape(
                          position: BubblePosition.Bottom,
                          arrowPositionPercent: 0.5,
                          borderRadius: 20,
                          arrowHeight: 20,
                          arrowWidth: 20
                        ),
                        child: Container(
                          child: Column(
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                                    child: Image.asset(model.image),
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      Text(
                                        "Colors",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      circle(Colors.grey),
                                      circle(Colors.cyan[700]),
                                      circle(Colors.brown),
                                      circle(Colors.red),
                                      circle(Colors.cyan[300]),
                                      circle(Colors.black),
                                    ],
                                  )
                                ],
                              ),
                              Container(
                                width: width,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                                      child: Text(
                                        model.title,
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(8, 10, 8, 0),
                                      child: Text(
                                        model.description+"To switch to a new route, use the Navigator. To switch to a new route, use the Navigator.push() method. The push() method adds a Route to the stack of routes managed by the Navigator.",
                                        textAlign: TextAlign.justify,
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              shirt(),
                            ],
                          ),
                        ),

                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget circle(Color color){
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Container(
        height: 20,
        width: 20,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(Radius.circular(50)),

        ),
      ),
    );
  }
  Widget shirt(){
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: list.length,
        itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.all(8),
            child: Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(
                    list[index],
                  )
                )
              ),
            ),
          );
        },
      ),
    );
  }
}

//run code

//i hope you like this video
//like share and subscribe
//and share your views in comment box
//takecare Allah Hafix