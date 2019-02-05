class Account {
  Account(this._userId, {this.email, this.firstName, this.lastName});
  final int _userId;
  final String email;
  final String firstName;
  final String lastName;
}