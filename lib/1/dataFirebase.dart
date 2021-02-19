import 'package:firebase_auth/firebase_auth.dart';

class DataFiirebase {
  getidUsers(String idUsers) {
    var idUser = FirebaseAuth.instance.currentUser;
    idUsers = idUser.uid;
    print(idUser.uid);
  }
}
