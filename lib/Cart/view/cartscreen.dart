import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:untitled/constant.dart';

import '../../SharedWidget/reuseableinfocontainer.dart';
import '../controller/cartcontroller.dart';
import 'components/cartinfo.dart';
import 'components/thirdsection.dart';

class CartScreen extends StatelessWidget {
  static const pageName = "/Cart";

  final orderController = Get.put(OrderController());

  @override
  Widget build(BuildContext context) {
    //orderController.total();
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: kPinkColors,
        title: const Center(
          child: Text('My Cart'),
        ),
      ),
      body: SizedBox(
        width: width,
        height: height,
        child: Column(
          children: [
            Flexible(
              flex: 1,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: height * 0.02),
                  child: const Text(
                    'Your Cart',
                    style: ktextBold,
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 12,
              child: Obx(()=>
                 ListView.builder(
                    itemCount: orderController.products.length,
                    itemBuilder: (context, index) {
                      return ReUseableInfoContainer(
                        favProduct: orderController.products.keys.toList()[index], /*orderController.order[index]!*/
                        infoWidget: CartInfo(
                          product: orderController.products.keys.toList()[index],
                          mainIcon: Icons.remove_shopping_cart_outlined,
                        ),
                      );
                    }),
              ),
            ),
            ThirdSection(orderController: orderController),
          ],
        ),
      ),
    );
  }
}
// CartItem(width: width, height: height)
