import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:untitled/Cart/controller/cartcontroller.dart';
import 'package:untitled/Product/model/productModel.dart';

import '../../../Product/model/productModel.dart';
import '../../../SharedWidget/ratewidget.dart';
import '../../../constant.dart';

class CartInfo extends StatelessWidget {
  final IconData mainIcon;
  final ProductModel product;

  CartInfo({required this.mainIcon, required this.product});
  final orderController = Get.find<OrderController>();
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product.proName,
              style: kTextBoldTitle16,
            ),
            GestureDetector(
              onTap: () {
                orderController.inCart(product);
              },
              child: Icon(
                mainIcon,
                size: 19,
                color: kPinkColors,
              ),
            ),
          ],
        ),
        SizedBox(
          height: height * 0.01,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          textBaseline: TextBaseline.alphabetic,
          children: [
            RateWidget(rating: product.proRate),
            SizedBox(
              width: width * 0.03,
            ),
            Text(
              "(210) reviews",
              style: klableTextStyle.copyWith(fontSize: 12),
            ),
          ],
        ),
        SizedBox(
          height: height * 0.02,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: width * 0.3,
              child: Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: Material(
                      borderRadius: BorderRadius.circular(10),
                      color: /*Colors.white*/ kLightPinkColors,
                      child: InkWell(
                        onTap: () {
                          // if (orderController.products[product] > 1) {
                          //   orderController.products[product] =
                          //       orderController.products[product] - 1;
                          // } else {
                          //   orderController.products[product];
                          // }
                          orderController.reduceQuantity(product);
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(5),
                          child: Icon(
                            Icons.remove,
                            color: kPinkColors,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                      flex: 1,
                      child: TextField(
                          controller: TextEditingController()
                            ..text = orderController.products[product].toString(),
                          maxLines: 1,
                          cursorHeight: 35,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(2),
                            FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                          ],
                          onChanged: (value){
                            orderController.products[product]=int.parse(value);
                          },
                          decoration: InputDecoration(),
                        ),),
                  Flexible(
                    flex: 1,
                    child: Material(
                      borderRadius: BorderRadius.circular(10),
                      color: /*Colors.white*/ kLightPinkColors,
                      child: InkWell(
                        onTap: () {
                          orderController.addQuantity(product);
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(5),
                          child: Icon(
                            Icons.add,
                            color: kPinkColors,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Obx(
              () => Text(
                '\$ ${orderController.costOfproduct(product: product)}',
                style: kTextBoldTitle16,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
