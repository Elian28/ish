class Users {
  String body;
  String userId;
  bool done;
  DateTime created;

  Users(this.body, this.userId, this.done);

  Users.formJson(Map<String, dynamic> map) {
    created = DateTime.now();
    this.body = map['details'];
    this.userId = map['user_id'];
    this.done = map['done'];
    this.created = map['Created'];
  }

  Map<String, dynamic> toMap() {
    return {'body': this.body, 
    'user_id': this.userId, 
    'Created': this.created};
  }
}
