import 'package:habitual/data/models/cart_item_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable(explicitToJson: true)
class UserModel {
  String uid;
  String firstName;
  String? lastName;
  String email;
  List<CartItemModel> cart;

  UserModel(
      {required this.uid,
      required this.firstName,
      this.lastName,
      required this.email,
      required this.cart});

  @override
  String toString() {
    return 'UserModel{uid: $uid, firstName: $firstName, email: $email, cart: $cart}';
  }

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
