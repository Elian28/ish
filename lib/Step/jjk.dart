import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NotGoodWidge extends StatefulWidget {
  @override
  _NotGoodWidgeState createState() => _NotGoodWidgeState();
}

class _NotGoodWidgeState extends State<NotGoodWidge> {
  StreamSubscription sub;
  dynamic data;
  final db = FirebaseFirestore.instance;
  @override
  void initState() {
    sub = db.collection('path').doc('id').snapshots().listen((snap) {
      setState(() {
        data = snap.data;
      });
      super.initState();
    });

    void dispose() {
      sub.cancel();
      super.dispose();
    }

    ;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(data['title']),
    );
  }
}

class ProbleWidget extends StatelessWidget {
  final db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Object>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          return Center(
            child: StreamBuilder<DocumentSnapshot>(
                stream: db.collection('path').doc('id').snapshots(),
                builder: (context, snapshot) {
                  Map data = snapshot.data.data();
                  return Container(
                    child: Text(data['title'] ?? ' defaul'),
                  );
                }),
          );
        });
  }
}

class AnotherWidget extends StatelessWidget {
  const AnotherWidget({this.data});
  final Map data;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(data['title'] ?? 'default'),
    );
  }
}

class HeroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = FirebaseAuth.instance;
    var user = Provider.of<User>(context);
    bool loggedIn = user != null;
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey[800],
      ),
      body: Center(
        child: Column(
          children: [
            //if (loggedIn) ...[
            loggedIn != false
                ?
                /*  SizedBox( */
                /*    child: Image.asset('assets/icon/app@60x60x1.png'), */
                /*    width: 150, */
                /*  ), */
                RaisedButton(
                    child: Text('Sign out'),
                    onPressed: auth.signOut,
                  )
                :
                //],
                //  if (loggedIn) ...[
                RaisedButton(
                    child: Text('Login'),
                    onPressed: auth.signInAnonymously,
                  )
            //  ]
          ],
        ),
      ),
    );
  }
}

class SuperHero {
  final String name;
  final int strength;
  //final int damage;

  SuperHero({this.name, this.strength});
}

class Weapon {
  final String id;
  final String name;
  final int hitpoints;

  Weapon({this.id, this.name, this.hitpoints});
}
