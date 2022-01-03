class UserModel {
  String? uid;
  String? firstName;
  String? lastName;
  String? email;

  UserModel({
    this.uid,
    this.firstName,
    this.lastName,
    this.email,
  });

  @override
  String toString() {
    return 'UserModel{uid: $uid, email: $email}';
  }
}
