import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Product/model/productModel.dart';
import '../ui model/categorymodel.dart';

class Database extends GetxController {
  // Collection Reference
  final CollectionReference categoryCollRef =
      FirebaseFirestore.instance.collection('Category');
  final CollectionReference productCollRef =
      FirebaseFirestore.instance.collection('Product');

  // Parameters used to get the data
  Rx<List<ProductModel?>> productList = Rx<List<ProductModel?>>([]);
  List<ProductModel?> get listProduct => productList.value;

  Rx<List<CategoryModel?>> categoryList = Rx<List<CategoryModel?>>([]);
  List<CategoryModel?> get listCategory => categoryList.value;

  //Obervable variables
  RxString categoryName = ''.obs;

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();

    //print(categoryName.value);
  }

  @override
  void onReady() async{
    // TODO: implement onReady
    super.onReady();
    categoryName.value = await firstCategory;
    productList.bindStream(streamOfCategoryProduct);
    categoryList.bindStream(categories);
  }

  // ------------------Get a list of all products ---------------------------//

  //Converting the document to list products objects
  List<ProductModel?> fetchProduct(QuerySnapshot querySnapshot) {
    return querySnapshot.docs.map((product) {
      print(product.get('timing'));
      return ProductModel(
        id: product.id,
        proName: product.get('name'),
        proType: product.get('type'),
        proDescreption: product.get('descreption'),
        proImage: product.get('image'),
        proPrice: double.parse(product.get('price')),
        proRate: double.parse(product.get('rate')),
        proTiming:
            product.get('timing') == "" ? 0 : int.parse(product.get('timing')),
      );
    }).toList();
  }

  //making a stream of products list
  Stream<List<ProductModel?>> get products {
    return productCollRef.snapshots().map(fetchProduct);
  }

  // ------------------ Get the first document ---------------------------//

  // how to get the first category

  String getFirstCatgeroty(QuerySnapshot querySnapshot) {
    return querySnapshot.docs[0].get('name').toString() ;
  }

  Future<String> get firstCategory {
    return categoryCollRef.snapshots().map(getFirstCatgeroty).first;
  }

  // ------------------Converting the document to list products objects ---------------------------//

  List<CategoryModel?> fetchCategory(QuerySnapshot querySnapshot) {
    return querySnapshot.docs.map((category) {
      return CategoryModel(
        categoryImage: category.get('image'),
        categoryName: category.get('name'),
      );
    }).toList();
  }

  //making a stream of products list
  Stream<List<CategoryModel?>> get categories {
    return categoryCollRef.snapshots().map(fetchCategory);
  }

  // --------------------------------Specific list of product -----------------------------------//

  List<ProductModel?> listOfCategoryProduct(QuerySnapshot querySnapshot) {
    return querySnapshot.docs.map((product) {
      //print(product.get('timing'));
      return ProductModel(
        id: product.id,
        proName: product.get('name'),
        proType: product.get('type'),
        proDescreption: product.get('descreption'),
        proImage: product.get('image'),
        proPrice: double.parse(product.get('price')),
        proRate: double.parse(product.get('rate')),
        proTiming:
            product.get('timing') == "" ? 0 : int.parse(product.get('timing')),
      );
    }).toList();
  }

  Stream<List<ProductModel?>>  get streamOfCategoryProduct{
    // here we are going to fetch the product of specific category
    listProduct.clear();
    return productCollRef
        .where('category', isEqualTo: categoryName.value)
        .snapshots()
        .map(listOfCategoryProduct);
  }
}
