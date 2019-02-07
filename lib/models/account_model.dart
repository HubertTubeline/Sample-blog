class Account {
  Account({this.id, this.email, this.firstName, this.lastName});
  
  int id;
  String email;
  String firstName;
  String lastName;

  Map<String, dynamic> toMap() {
    var map = <String, dynamic> {
      "email": email,
      "firstName": firstName,
      "lastName": lastName
    };

    if (id != null) {
      map["_id"] = id;
    }

    return map;
  }

  Account.fromMap(Map<String, dynamic> map) {
    id = map["_id"];
    email = map["email"];
    firstName = map["firstName"];
    lastName = map["lastName"];
  }

}
