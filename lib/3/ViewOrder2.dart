/* import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'AppDrawer.dart';
import 'Bills.dart';
import 'Server/help.dart';
import '_New.dart';

class ViewOrder extends StatefulWidget {
  @override
  _ViewOrderState createState() => _ViewOrderState();
} //ppp

class _ViewOrderState extends State<ViewOrder>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  FirebaseUser users;
  bool _hasEroor = false;
  bool _isLoading = true;
  bool isAdmin = true;
  String _eroorMassege;
  String name;
  String userType;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    _prepareDate().then((user) {
      if (user != null) {
        _secondStepData(user);
      }
    });
  }

  Future<FirebaseUser> _prepareDate() async {
    FirebaseAuth.instance.currentUser().then((user) {
      Firestore.instance
          .collection("profile")
          //  .where('user_id', isEqualTo: user.uid)
          .getDocuments()
          .then((snapshotQuery) {
        setState(() {
          name = snapshotQuery.documents[0]['name'];
          userType = snapshotQuery.documents[0]['user_type'];
          if (snapshotQuery.documents[0]['user_type'] == 'admin') {
            isAdmin = true;
          }
          users = user;
          _hasEroor = false;
          _isLoading = false;
        });
        return user;
      });
    }).catchError((error) {
      setState(() {
        _hasEroor = true;
        _eroorMassege = error.toString();
      });
      return null;
    });
    return null;
  }

  // انتتهاء
  void _secondStepData(FirebaseUser user) {}
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue[700],
          child: Icon(Icons.add),
          onPressed: () {
            return Navigator.of(context).push(
                MaterialPageRoute(builder: (BuildContext context) => News()));
          },
        ),
/*         floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.blue,
            child: Icon(Icons.add),
            onPressed: () {}), */
        endDrawer: AppDrawer(),
        appBar: AppBar(title: Text("الطلبات")),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: _isLoading
              ? _loading(context)
              : (_hasEroor
                  ? _eroor(context, _eroorMassege)
                  : _conTent(context)),
        ));
  }

  Widget _loading(BuildContext context) {
    return Center(child: CircularProgressIndicator());
  }

// orderBy معناها الترتيب حسب
//descending معناه تنازلي
  Widget _conTent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: StreamBuilder<QuerySnapshot>(
          stream: Firestore.instance
              .collection(collections['Contents'])
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return _eroor(context, "لم يحدث شى");
                break;
              case ConnectionState.waiting:
                return Center(
                  child: CircularProgressIndicator(),
                );
                break;
              case ConnectionState.active:
              case ConnectionState.done:
                if (snapshot.hasError) {
                  return _eroor(context, snapshot.error.toString());
                }
                if (!snapshot.hasData) {
                  return _eroor(context, "لايوجد بيانات");
                }
                return _drawScreen(context, snapshot.data);
                break;
            }
            return Container();
          }),
    );
  }

  Widget _eroor(BuildContext context, String masseg) {
    return Center(
        child: Text(
      masseg,
      style: TextStyle(color: Colors.red, fontSize: 15),
    ));
  }

  Widget _drawScreen(BuildContext context, QuerySnapshot data) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: data.documents.length,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: <Widget>[
/*             Expanded(
              child: Row(
                children: <Widget>[
                  ListTile(
                    title: Text(
                      " ${data.documents[index]['body']}\n",
                      style: TextStyle(
                          decoration: data.documents[index]["done"]
                              ? TextDecoration.lineThrough
                              : TextDecoration.none),
                    ),
                    leading: Text("حالاتت القبول : "),
                  ),
                  ListTile(
                    title: Text(
                      " ${data.documents[index]['body']}\n",
                      style: TextStyle(
                          decoration: data.documents[index]["done"]
                              ? TextDecoration.lineThrough
                              : TextDecoration.none),
                    ),
                    leading: Text("حالاتت القبول : "),
                  ),
                ],
              ),
            ), */
            Card(
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[],
                  ),
                  ListTile(
                    title: Text(
                      " ${data.documents[index]['OrderNnumber']}\n",
                      style: TextStyle(
                          decoration: data.documents[index]["done"]
                              ? TextDecoration.lineThrough
                              : TextDecoration.none),
                    ),
                    leading: InkWell(
                      onTap: () {
                        /* return Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) => UserData())); */
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width / 5,
                        height: MediaQuery.of(context).size.height / 9,
                        decoration: BoxDecoration(
                            color: Colors.cyan,
                            image: DecorationImage(
                                image: NetworkImage(
                                  "https://upload.3dlat.com/uploads/3dlat.com_28_18_18a6_9c59cddc60733.jpg",
                                ),
                                fit: BoxFit.cover),
                            borderRadius:
                                BorderRadius.all(Radius.circular(75.0)),
                            boxShadow: [
                              BoxShadow(blurRadius: 7.0, color: Colors.cyan)
                            ]),
                      ),
                    ),
                    trailing: InkWell(
                        onTap: () {
                          Firestore.instance
                              .collection(collections['Contents'])
                              .document(data.documents[index].documentID)
                              .updateData({
                            "Status": 1,
                            "int": 1 + 1,
                          });
                        },
                        child: Text(
                            " ${viewStatus[data.documents[index]['Status']]}")
                        /* viewStatus[""]) */),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      RaisedButton(
                          /*    color: data.documents[index]["done"]
                              ? Colors.teal
                              : Colors.grey.shade300, */
                          child: Text("عرض الطلب"),
                          onPressed: () {
                            return Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) => Bill(data
                                    .documents[index]['OrderNnumber']
                                    )));
                          }),
                      RaisedButton(
                          child: Text("حذف الطلب"),
                          onPressed: () {
                            Firestore.instance
                                .collection(collections['Contents'])
                                .document(data.documents[index].documentID)
                                .delete();
                          }),
                    ],
                  ),
                  /*          ListTile(
                              leading: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  InkWell(
                                    onTap: () {},
                                    child: Icon(
                                      Icons.assignment_turned_in,
                                      color: data.documents[index]["done"]
                                          ? Colors.teal
                                          : Colors.grey.shade300,
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Firestore.instance
                                          .collection(collections['Contents'])
                                          .document(
                                              data.documents[index].documentID)
                                          .updateData({
                                        "done": false,
                                      });
                                    },
                                    child: Icon(
                                      Icons.cancel,
                                      color: data.documents[index]["done"]
                                          ? Colors.red
                                          : Colors.grey.shade300,
                                    ),
                                  ),
                                ],
                              ),
                              title: Text(
                                " ${data.documents[index]['body']}\n",
                                style: TextStyle(
                                    decoration: data.documents[index]["done"]
                                        ? TextDecoration.lineThrough
                                        : TextDecoration.none),
                              ),
                              /*                        trailing: InkWell(
                                onTap: () {
                                  Firestore.instance
                                      .collection(collections['Contents'])
                                      .document(data.documents[index].documentID)
                                      .delete();
                                },
                                child: Icon(
                                  Icons.delete,
                                  color: Colors.red.shade800,
                                ),
                              ), */
                            ),
                     */
                ],
              ),
            ),
          ],
        );
      },
    );

/*     ListView.builder(
      itemCount: data.documents.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: Column(
            children: <Widget>[
              ListTile(
                leading: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        Firestore.instance
                            .collection(collections['Contents'])
                            .document(data.documents[index].documentID)
                            .updateData({
                          "done": true,
                        });
                      },
                      child: Icon(
                        Icons.assignment_turned_in,
                        color: data.documents[index]["done"]
                            ? Colors.teal
                            : Colors.grey.shade300,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Firestore.instance
                            .collection(collections['Contents'])
                            .document(data.documents[index].documentID)
                            .updateData({
                          "done": false,
                        });
                      },
                      child: Icon(
                        Icons.cancel,
                        color: data.documents[index]["done"]
                            ? Colors.red
                            : Colors.grey.shade300,
                      ),
                    ),
                  ],
                ),
                title: Text(
                  " ${data.documents[index]['body']}\n",
                  style: TextStyle(
                      decoration: data.documents[index]["done"]
                          ? TextDecoration.lineThrough
                          : TextDecoration.none),
                ),
                trailing: InkWell(
                  onTap: () {
                    Firestore.instance
                        .collection(collections['Contents'])
                        .document(data.documents[index].documentID)
                        .delete();
                  },
                  child: Icon(
                    Icons.delete,
                    color: Colors.red.shade800,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    ); */
  }

  Widget feed() {}
}

class TodoCard extends StatelessWidget {
  final Todo todo;

  TodoCard(this.todo);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: <Widget>[
          Container(
            decoration: new BoxDecoration(
              color: PriorityHelper.getPriorityColor(todo.priority),
              borderRadius: new BorderRadius.only(
                topLeft: const Radius.circular(4.0),
                bottomLeft: const Radius.circular(4.0),
              ),
            ),
            width: 40.0,
            height: 80.0,
            child: todo.isDone
                ? IconButton(
                    icon: Icon(Icons.check),
                    onPressed: () {
//   model.toggleDone(todo.id);
                    },
                  )
                : IconButton(
                    icon: Icon(Icons.check_box_outline_blank),
                    onPressed: () {
                      // model.toggleDone(todo.id);
                    },
                  ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(10.0),
              child: Text(
                todo.title,
                style: TextStyle(
                    fontSize: 24.0,
                    decoration: todo.isDone
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              //model.setCurrentTodo(todo);

              Navigator.pushNamed(context, '/editor');
            },
          )
        ],
      ),
    );
  }
}

class PriorityHelper {
  static Color getPriorityColor(Priority priority) {
    switch (priority) {
      case Priority.High:
        return Colors.redAccent;

      case Priority.Medium:
        return Colors.amber;

      default:
        return Colors.lightGreen;
    }
  }

  static Priority toPriority(String value) {
    return Priority.values
        .firstWhere((priority) => priority.toString() == value);
  }
}

class Todo {
  final String id;
  final String title;
  final String content;
  final Priority priority;
  final bool isDone;
  final String userId;

  Todo({
    @required this.id,
    @required this.title,
    this.content,
    this.priority = Priority.Low,
    this.isDone = false,
    @required this.userId,
  });
}

enum Priority {
  High,
  Medium,
  Low,
}
 */
