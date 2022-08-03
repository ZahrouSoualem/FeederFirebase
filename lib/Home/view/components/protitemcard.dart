import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:untitled/Product/model/productModel.dart';
import '../../../SharedWidget/ratewidget.dart';
import '../../../Cart/controller/cartcontroller.dart';
import '../../../constant.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../Product/view/productscreen.dart';
import '../../../Favourite/controller/favouritecontroller.dart';

class ProductItemCard extends StatelessWidget {
  final ProductModel product;
  int index;

  ProductItemCard({required this.product, required this.index});

  final favouriteController = Get.find<FavouriteController>();
  final orderController = Get.find<OrderController>();

  //void set index(bool? index) => this.index = index;

  @override
  Widget build(BuildContext context)  {

    return GestureDetector(
      onTap: () {
        Get.to(() => Details_Screen(
              product: this.product,
            ));
      },
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        width: MediaQuery.of(context).size.width / 2,
        //height: MediaQuery.of(context).size.width / 2 ,
        child: Stack(children: [
          Positioned(

            right: 0,
            bottom: 0,
            width: 35,
            height: 35,
            child: Obx(()=>
               GestureDetector(
                onTap: () {
                  orderController.inCart(product);
                },
                child: Container(
                  child: const Icon(
                    Icons.add_rounded,
                    color: Colors.white,
                    size: 30,
                  ),
                  decoration: BoxDecoration(
                      color: orderController.products.containsKey(product) ? Colors.green : kPinkColors,
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ),
          ),
          ClipPath(
            clipper: CubeShape(),
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          color: kScaffoldColor,
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: RateWidget(rating:product.proRate),
                      ),
                       Obx(
                           ()=> GestureDetector(
                            onTap: () async {
                              await favouriteController.addOrDelete(product);
                              //await favouriteController.addFavourite(product);
                            },
                            child:  Icon(
                               favouriteController.searchWithName(product)
                                    ? Icons.favorite
                                    : Icons.favorite_border_outlined,
                              color: favouriteController.searchWithName(product)
                                    ? kPinkColors
                                    : Colors.black,
                              ),

                      ),
                       ),
                    ],
                  ),
                  Flexible(
                    child: Container(
                      width: double.infinity,
                      height: 120,
                      //color: Colors.black,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.scaleDown,
                            image: NetworkImage(product.proImage)),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  Text(
                    product.proName,
                    maxLines: 1,
                    style: kTextBoldTitle16,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    product.proType,
                    style: klableTextStyle,
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  Row(
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      const Icon(
                        FontAwesomeIcons.dollarSign,
                        size: 14,
                        color: kPinkColors,
                      ),
                      Text(
                        product.proPrice.toString(),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      )
                    ],
                  ),
                ],
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.white,
                      spreadRadius: 3,
                    ),
                  ]),
            ),
          ),
        ]),
      ),
    );
  }
}

class CubeShape extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    //  throw UnimplementedError();
    var path = new Path();

    path.lineTo(0, size.height);
    var plus =
        (size.width - (size.width / 5)) - (size.width - (size.width / 4.1));
    var fifthofwidth = (size.width / 5);
    var fourthwidth = size.width / 4.1;
    var FisrtStart = Offset(size.width - (size.width / 4.1), size.height);
    var FisrtCenter = Offset(size.width - (size.width / 5), size.height);
    var FisrtEnd = Offset(size.width - (size.width / 5), size.height * 0.95);

    path.lineTo(FisrtStart.dx, FisrtStart.dy);
    path.quadraticBezierTo(
        FisrtCenter.dx, FisrtCenter.dy, FisrtEnd.dx, FisrtEnd.dy);
    path.lineTo(FisrtEnd.dx, FisrtEnd.dy);
    /*************************************/
    var SecondCenter = Offset(
        size.width - (size.width / 5), (size.height - (size.width / 5)) + plus);
    var SecondFirst =
        Offset(size.width - (size.width / 5), (size.height - (size.width / 5)));
    var SecondEnd = Offset(size.width - (size.width / 5) + plus,
        (size.height - (size.width / 4.1)) + plus);

    path.lineTo(SecondCenter.dx, SecondCenter.dy);
    path.quadraticBezierTo(
        SecondFirst.dx, SecondFirst.dy, SecondEnd.dx, SecondEnd.dy);

    var ThirdFirst = Offset(size.width - plus, size.height - (size.width / 5));
    var ThirdCenter = Offset(size.width, size.height - (size.width / 5));
    var ThirdEnd = Offset(size.width, size.height - (size.width / 5) - plus);

    path.lineTo(ThirdFirst.dx, ThirdFirst.dy);
    path.quadraticBezierTo(
        ThirdCenter.dx, ThirdCenter.dy, ThirdEnd.dx, ThirdEnd.dy);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
