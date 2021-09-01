import 'package:firebase_auth/firebase_auth.dart';

class UserId {
  String idUsers;
  UserId(this.idUsers);

  Future _idUsers() async {
    var id = FirebaseAuth.instance.currentUser;
    idUsers = id.uid;
  }

  getUsersId() async {
    await _idUsers();
  }
}
