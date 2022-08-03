import 'package:cloud_firestore/cloud_firestore.dart';

class OrderModel {
  String userID;
  double totalPrice;
  List<Map<String, dynamic>> listOfProduct;

  Map<String, dynamic> toJson() {
    return {
      'user': userID,
      'totalPrice': totalPrice,
      'products': listOfProduct,
    };
  }

  OrderModel({
    required this.userID,
    required this.totalPrice,
    required this.listOfProduct,
  });


}
