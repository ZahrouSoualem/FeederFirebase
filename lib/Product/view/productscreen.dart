import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/Favourite/controller/favouritecontroller.dart';
import 'package:untitled/constant.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:untitled/Product/model/productModel.dart';

import '../../Cart/controller/cartcontroller.dart';
import '../controller/productcontroller.dart';
import '../model/productModel.dart';

class Details_Screen extends StatelessWidget {
  static final pageName = '/detail';

  final ProductModel product;
  Details_Screen({
    required this.product,
  });

  //final productController = Get.find<ProductController>();
  final productController = Get.put(ProductController());
  //final favouriteController = Get.find<FavouriteController>();
  final favouriteController = Get.put(FavouriteController());
  //final orderController = Get.find<OrderController>();
  final orderController = Get.put(OrderController());

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: height * 0.5,
              width: width,
              child: Stack(
                children: [
                  Container(
                    height: height * 0.35,
                    child: SvgPicture.asset(
                      'assets/images/ContainerGradiant.svg',
                      color: Colors.red,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: height * 0.04, horizontal: width * 0.05),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Container(
                            height: 50,
                            width: 50,
                            child: Icon(Icons.arrow_back_ios_rounded),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        Container(
                          height: 50,
                          width: 50,
                          child: Obx(
                            () => GestureDetector(
                              onTap: () async{
                                 await favouriteController.addOrDelete(product);
                              },
                              child: Icon(
                                favouriteController.searchWithName(product)
                                    ? Icons.favorite
                                    : Icons.favorite_border_outlined,
                                color: favouriteController.searchWithName(product)
                                    ? kPinkColors
                                    : Colors.black,
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: height * 0.12,
                    left: width * 0.1,
                    right: width * 0.1,
                    child: Container(
                      height: height * 0.36,
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Positioned(
                            bottom: 0,
                            child: Container(
                              height: height * 0.25,
                              width: width * 0.8,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(30),
                                  bottomLeft: Radius.circular(30),
                                  topRight: Radius.circular(60),
                                  topLeft: Radius.circular(60),
                                ),
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(height * 0.03),
                                height: height * 0.2,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.fitHeight,
                                    image: NetworkImage(product.proImage),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: height * 0.02),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            product.proName,
                                            style: kTextBoldTitle16,
                                          ),
                                          SizedBox(
                                            height: height * 0.01,
                                          ),
                                          Text(
                                            product.proType,
                                            style: klableTextStyle,
                                          ),
                                        ],
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(width * 0.005),
                                        height: height * 0.035,
                                        width: width * 0.2,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.redAccent,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: GestureDetector(
                                                onTap: () {
                                                  // productController
                                                  //     .setQcounterPlus();
                                                  orderController.products[
                                                      product] = orderController
                                                          .products[product] +
                                                      1;
                                                },
                                                child: Container(
                                                  child: const Icon(
                                                    Icons.add,
                                                    color: Colors.redAccent,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            7),
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Container(
                                                child: Center(
                                                  child: Obx(
                                                    () => Text(
                                                      orderController.products
                                                              .containsKey(
                                                                  product)
                                                          ? '${orderController.products[product]}'
                                                          : '1',
                                                      style: const TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                ),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(7),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: GestureDetector(
                                                onTap: () {
                                                  // productController
                                                  //     .setQcounterminus();
                                                  if (orderController
                                                          .products[product] >
                                                      1) {
                                                    orderController
                                                            .products[product] =
                                                        orderController
                                                                    .products[
                                                                product] -
                                                            1;
                                                  } else {
                                                    orderController
                                                        .products[product];
                                                  }
                                                },
                                                child: Container(
                                                  child: const Icon(
                                                    Icons.remove,
                                                    color: Colors.redAccent,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            7),
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              const DottedLine(
                                dashLength: 5,
                                dashGapLength: 5,
                                lineThickness: 2,
                                dashColor: Colors.black38,
                              ),
                              Expanded(
                                child: Container(
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              const Icon(
                                                Icons.star,
                                                color: Color(0xFFFFAA2F),
                                              ),
                                              SizedBox(
                                                width: width * 0.015,
                                              ),
                                              Text("4.9")
                                            ],
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              const Icon(Icons.whatshot_rounded,
                                                  color: Colors.deepOrange),
                                              SizedBox(
                                                width: width * 0.015,
                                              ),
                                              Text("4.9")
                                            ],
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              const Icon(
                                                Icons.alarm,
                                                color: Colors.lightBlueAccent,
                                              ),
                                              SizedBox(
                                                width: width * 0.015,
                                              ),
                                              Text("4.9")
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding:
                    EdgeInsets.only(left: width * 0.05, right: width * 0.05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Ingredient',
                      style: ktextBold,
                    ),
                    SizedBox(
                      height: height * 0.015,
                    ),
                    Container(
                      height: 50,
                      child: ListView(
                        physics: AlwaysScrollableScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: height * 0.015),
                            height: 50,
                            width: 50,
                            child: Icon(Icons.arrow_back_ios_rounded),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: height * 0.015),
                            height: 50,
                            width: 50,
                            child: Icon(Icons.arrow_back_ios_rounded),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: height * 0.015),
                            height: 50,
                            width: 50,
                            child: Icon(Icons.arrow_back_ios_rounded),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: height * 0.015),
                            height: 50,
                            width: 50,
                            child: Icon(Icons.arrow_back_ios_rounded),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: height * 0.015),
                            height: 50,
                            width: 50,
                            child: Icon(Icons.arrow_back_ios_rounded),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: height * 0.015),
                            height: 50,
                            width: 50,
                            child: Icon(Icons.arrow_back_ios_rounded),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height * 0.015,
                    ),
                    const Text(
                      'Descreption',
                      style: ktextBold,
                    ),
                    SizedBox(
                      height: height * 0.015,
                    ),
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        child: Text(
                          product.proDescreption,
                          style: const TextStyle(
                            color: kLabeleColor,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              height: height * 0.11,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: kBorderRdiusForbottomButton,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: height * 0.03),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Total price',
                          style: TextStyle(
                            color: kLabeleColor,
                          ),
                        ),
                        Row(
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            const Icon(
                              FontAwesomeIcons.dollarSign,
                              size: 14,
                              color: kPinkColors,
                            ),
                            Obx(
                              () => Text(
                                orderController.costOfproduct(product: product),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      width: width * 0.1,
                    ),
                    Expanded(
                      child: Obx(
                        () => RaisedButton(
                          onPressed: () {
                            orderController.inCart(product);
                          },
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              orderController.products.containsKey(product)
                                  ? "Remove from cart"
                                  : "Add to Cart",
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          color: orderController.products.containsKey(product)
                              ? Colors.green
                              : kPinkColors,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
