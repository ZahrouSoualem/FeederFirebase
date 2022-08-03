import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:untitled/Cart/model/orderModel.dart';

import '../../Product/model/productModel.dart';

class OrderController extends GetxController {
  //------------------------------Connecting to the firebase and fetch the date--------------------------------//
  final CollectionReference collectionOrd =
      FirebaseFirestore.instance.collection('Order');

  // list that contains all the product;
  Rx<List<ProductModel?>> productOfCart = Rx<List<ProductModel?>>([]);
  List<ProductModel?> get order => productOfCart.value;

  List<OrderModel?> fetchOrder(QuerySnapshot querySnapshot) {
    return querySnapshot.docs.map(
      (order) {
        return OrderModel(
          userID: order.get('user'),
          totalPrice: double.parse(order.get('user')),
          listOfProduct: order.get('Products'),
        );
      },
    ).toList();
  }

  Stream<List<OrderModel?>> get Orders {
    return collectionOrd.snapshots().map(fetchOrder);
  }

  // here to add an Order
  Future addOrder(OrderModel order) async {
    try {
      await collectionOrd.add(order.toJson());
    } catch (e) {
      Get.snackbar('Error', 'An error has been occured');
    }
  }

  // here to delete an Order
  Future deleteOrder(DocumentSnapshot order) async {
    try {
      await collectionOrd.doc(order.id).delete();
    } catch (e) {
      Get.snackbar('Error', 'An error has been occured');
    }
  }

  //-------------------------------Get the list of the product from the view -------------------------------//

  //In this part I will work with the map unlike the
  // fivourite controller where I worked with a list

  var _products = {}.obs;
  get products => _products;

  void inCart(ProductModel product) {
    if (_products.containsKey(product)) {
      _products.removeWhere((key, value) => key == product);
      Get.snackbar("Message", 'You have removed the product from the cart',
          snackPosition: SnackPosition.BOTTOM);
    } else {
      _products[product] = 1;
      Get.snackbar("Message", 'You have added the product to the cart',
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void addQuantity(ProductModel product) {
    _products[product] = _products[product] + 1;
  }

  void reduceQuantity(ProductModel product) {
    if (_products[product] > 1) {
      _products[product] = _products[product] - 1;
    } else {
      _products[product] = 1;
    }
  }

  String costOfproduct({required ProductModel product}) {


    if(products.containsKey(product)){
      double cost = product.proPrice * products[product];
      return cost.toStringAsFixed(2);
    }else{
      return product.proPrice.toStringAsFixed(2);
    }

  }

  String total() {
    if (_products.length == 0) {
      return 0.toString();
    } else {
      double totalSum = double.parse(_products.entries
          .map((product) => product.key.proPrice * product.value)
          .toList()
          .reduce((value, element) => value + element).toString());
      return totalSum.toStringAsFixed(2);
    }
  }
}
