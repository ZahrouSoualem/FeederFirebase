import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../Authentication/services/authservice.dart';
import '../../Profile/controller/usercontroller.dart';
import '/../../Product/model/productModel.dart';

class FavouriteController extends GetxController {
  Rx<List<ProductModel?>> productOfFavourite = Rx<List<ProductModel?>>([]);
  List<ProductModel?> get producst => productOfFavourite.value;

  bool variable = false;
  bool changeVariable() {
    return !variable;
  }

  RxBool FavSelected = false.obs;
  bool setFavSelected() {
    FavSelected.value = !FavSelected.value;
    return FavSelected.value;
  }

  //--------------------------Map approach--------------------------//

// the approach with a list we diclare a list
//   var _favourite = {}.obs;
//   get favourites => _favourite;
//
//    void isFavourite(ProductModel product){
//     if(_favourite.containsKey(product)){
//       _favourite.removeWhere((key, value) => key==product);
//       Get.snackbar("Message", 'You have removed the product',snackPosition: SnackPosition.BOTTOM);
//     }else{
//       _favourite[product]=true;
//       Get.snackbar("Message", 'You have add the product to favourite',snackPosition: SnackPosition.BOTTOM);
//
//     }
//   }

  //--------------------------List approach--------------------------//
  var _favourite = [].obs;
  get favourites => _favourite;
  void isFavourite(ProductModel product) {
    if (_favourite.contains(product)) {
      _favourite.remove(product);
      Get.snackbar("Message", 'You have removed the product',
          snackPosition: SnackPosition.BOTTOM);
    } else {
      _favourite.add(product);
      Get.snackbar("Message", 'You have add the product to favourite',
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  //--------------------------------------Add Favourite List to the Firebase----------------------------------//
  final CollectionReference favouriteCollRef =
      FirebaseFirestore.instance.collection('Favourite');

  // var _favouriteProduct = <ProductModel?>[].obs;
  // get productts => _favouriteProduct.value;

  Rx<List<ProductModel?>> _obsFavProduct = Rx<List<ProductModel?>>([]);
  List<ProductModel?> get FavProduct => _obsFavProduct.value;

  // this is the ID of the current user, So whenever
  // this user add a product to favourite liste,
  // this product will be added only to that user.
  RxString uid = ''.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    final authService = Get.find<AuthToApp>();
    uid.value = authService.uid.value;
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    _obsFavProduct.bindStream(products);
  }

  List<ProductModel?> fetchFavourite(QuerySnapshot querySnapshot) {
    return querySnapshot.docs.map((product) {
      //print('the timing is : ' + product.get('timing').toString());
      return ProductModel(
        id: product.id.toString(),
        proName: product.get('name'),
        proType: product.get('type'),
        proDescreption: product.get('descreption'),
        proImage: product.get('image'),
        proPrice: double.parse(product.get('price').toString()),
        proRate: double.parse(product.get('rate').toString()),
        proTiming: product.get('timing') == ""
            ? 0
            : int.parse(product.get('timing').toString()),
      );
    }).toList();
  }

  Stream<List<ProductModel?>> get products {
    return favouriteCollRef
        .doc(uid.value /*'FgjpaN6btzTR0Z55mseGqZXUB9N2'*/)
        .collection('Product')
        .snapshots()
        .map(fetchFavourite);
  }

  Future addFavourite(ProductModel product) async {
    return await favouriteCollRef
        .doc(uid.value /*'FgjpaN6btzTR0Z55mseGqZXUB9N2'*/)
        .collection('Product')
        .doc(product.id)
        .set(product.toFirestore());
  }

  //.where('name',isEqualTo: product.proName).get().
  Future deleteFavourite(ProductModel product) async {
    return await favouriteCollRef
        .doc(uid.value /*'FgjpaN6btzTR0Z55mseGqZXUB9N2'*/)
        .collection('Product')
        .doc(product.id)
        .delete();
  }

  Future<bool> ifDocExists(ProductModel productModel) async {
    return await favouriteCollRef
        .doc(uid.value /*'FgjpaN6btzTR0Z55mseGqZXUB9N2'*/)
        .collection('Product')
        .doc(productModel.id)
        .get()
        .then((Doc) => Doc.exists);
  }

  addOrDelete(ProductModel productModel) async {
    if (await ifDocExists(productModel)) {
      deleteFavourite(productModel);
      return false;
    } else {
      addFavourite(productModel);
      return false;
    }
  }

  bool searchWithName(ProductModel productModel) {
    bool variable = false;
    FavProduct.forEach((element) {
      if (element!.proName == productModel.proName) {
        variable = true;
      }
    });
    return variable;
  }
}
