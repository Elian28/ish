/*
Nguyen Duc Hoang (Mr)
Programming tutorial channel:
https://www.youtube.com/c/nguyenduchoang
Flutter, React, React Native, IOS development, Swift, Python, Angular
* */
import 'package:flutter/material.dart';

//Define "root widget"
void main() => runApp(new MyApp000()); //one-line function

// صفحة الكتاب ابغاها
class MyApp000 extends StatelessWidget {
  //Stateless = immutable = cannot change object's properties
  //Every UI components are widgets
  @override
  Widget build(BuildContext context) {
    //Now we need multiple widgets into a parent = "Container" widget
    Widget titleSection = new Container(
      padding: const EdgeInsets.all(10.0), //Top, Right, Bottom, Left
      child: new Row(
        children: <Widget>[
          new Expanded(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Container(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: new Text("Programming tutorials Channel",
                      style: new TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18.0)),
                ),
                //Need to add space below this Text ?
                new Text(
                  "This channel contains tutorial videos in Flutter, "
                  "React Native, React, Angular",
                  style: new TextStyle(color: Colors.grey[850], fontSize: 16.0),
                ),
              ],
            ),
          ),
          new Icon(Icons.favorite, color: Colors.red),
          new Text(
            " 100",
            style: new TextStyle(fontSize: 16.0),
          ),
        ],
      ),
    );
    Widget buildButton(IconData icon, String buttonTitle) {
      final Color tintColor = Colors.blue;
      return new Column(
        children: <Widget>[
          new Icon(icon, color: tintColor),
          new Container(
            margin: const EdgeInsets.only(top: 5.0),
            child: new Text(
              buttonTitle,
              style: new TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                  color: tintColor),
            ),
          )
        ],
      );
    }

    Widget fourButtonsSection = new Container(
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          //build in a separated function
          buildButton(Icons.home, "Home"),
          buildButton(Icons.arrow_back, "Back"),
          buildButton(Icons.arrow_forward, "Next"),
          buildButton(Icons.share, "Share"),
        ],
      ),
    );
    final bottomTextSection = new Container(
      padding: const EdgeInsets.all(20.0),
      //How to show long text ?
      child: new Text(
          '''I am Nguyen Duc Hoang, I live in Hanoi, Vietnam. I create this channel which contains videos in Swift programming language, python, NodeJS, Angular, Typescript, ReactJS, React Native, ios and android programming, Kotlin programming, new technologies' overviews. These videos will help people learn latest programming language and software framework. They will be also very useful for their work or business. My channel's languages are English and Vietnamese.
      ''',
          style: new TextStyle(color: Colors.grey[850], fontSize: 16.0)),
    );
    //build function returns a "Widget"
    return new MaterialApp(
        title: "",
        home: new Scaffold(
            appBar: new AppBar(
              title: new Text('Flutter App'),
            ),
            body: new ListView(
              children: <Widget>[
                new Image.asset('images/tutorialChannel.png',
                    fit: BoxFit.cover),
                //You can add more widget bellow
                titleSection,
                fourButtonsSection,
                bottomTextSection
              ],
            ))); //Widget with "Material design"
  }
}

/*
Nguyen Duc Hoang (Mr)
Programming tutorial channel:
https://www.youtube.com/c/nguyenduchoang
Flutter, React, React Native, IOS development, Swift, Python, Angular
* */

//Define "root widget"
//Now use stateful Widget = Widget has properties which can be changed
class MainPage000 extends StatefulWidget {
  final String title;
  //Custom constructor, add property : title
  @override
  MainPage000({this.title}) : super();
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new MainPage000State(); //Return a state object
  }
}

class MainPage000State extends State<MainPage000> {
  //State must have "build" => return Widget
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("widget.title"),
      ),
      body: new GridView.extent(
        maxCrossAxisExtent: 150.0,
        mainAxisSpacing: 5.0,
        crossAxisSpacing: 5.0,
        padding: const EdgeInsets.all(5.0),
        children: _buildGridTiles(29), //Where is this function ?
      ),
    );
  }
}

List<Widget> _buildGridTiles(numberOfTiles) {
  List<Stack> containers = new List<Stack>.generate(numberOfTiles, (int index) {
    //index = 0, 1, 2,...
    final imageName = index < 9
        ? 'images/image0${index + 1}.JPG'
        : 'images/image${index + 1}.JPG';
    return new Stack(
      alignment: const Alignment(0.0, 0.0),
      children: <Widget>[
        new Container(
          //Do you need to make Image as "Circle"
          child: new Image.asset(imageName,
              width: 150.0, height: 150.0, fit: BoxFit.fill),
        ),
        //How to set background to Text ?
        //Let's move Text inside a Container,then set it's decoration
        new Container(
          padding: const EdgeInsets.all(5.0),
          decoration:
              new BoxDecoration(color: new Color.fromARGB(150, 71, 150, 236)),
          child: new Text('$index',
              style: new TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              )),
        ),
      ],
    );
    /*
    return new Container(
      child: new Image.asset(
        imageName,
        fit: BoxFit.fill
      ),
    );
    */
  });
  return containers;
}

class MyApps000 extends StatelessWidget {
  //Stateless = immutable = cannot change object's properties
  //Every UI components are widgets
  @override
  Widget build(BuildContext context) {
    //Now we need multiple widgets into a parent = "Container" widget
    //build function returns a "Widget"
    return new MaterialApp(
        title: "", home: new MainPage000(title: "GridView of Images"));
  }
}

/*
Nguyen Duc Hoang (Mr)
Programming tutorial channel:
https://www.youtube.com/c/nguyenduchoang
Flutter, React, React Native, IOS development, Swift, Python, Angular
* */

//Define "root widget"
// الهاتف
class MyAppf extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //build function returns a "Widget"
    var card = new Card(
      child: new Column(
        children: <Widget>[
          new ListTile(
            leading: new Icon(
              Icons.account_box,
              color: Colors.blue,
              size: 26.0,
            ),
            title: new Text(
              "Nguyen Duc Hoang",
              style: new TextStyle(fontWeight: FontWeight.w400),
            ),
            subtitle: new Text("Software developer"),
          ),
          new Divider(
            color: Colors.blue,
            indent: 16.0,
          ),
          new ListTile(
            leading: new Icon(
              Icons.email,
              color: Colors.blue,
              size: 26.0,
            ),
            title: new Text(
              "sunlight4d@gmail.com",
              style: new TextStyle(fontWeight: FontWeight.w400),
            ),
          ),
          new ListTile(
            leading: new Icon(
              Icons.phone,
              color: Colors.blue,
              size: 26.0,
            ),
            title: new Text(
              "+84-123.456.789",
              style: new TextStyle(fontWeight: FontWeight.w400),
            ),
          )
        ],
      ),
    );
    final sizedBox = new Container(
      margin: new EdgeInsets.only(left: 10.0, right: 10.0),
      child: new SizedBox(
        height: 220.0,
        child: card,
      ),
    );
    final center = new Center(
      child: sizedBox,
    );
    return new MaterialApp(
        title: "",
//      home: new Text("Add Google fonts to Flutter App")
        home: new Scaffold(
          appBar: new AppBar(title: new Text("Card example")),
          body: center,
        ));
  }
}
