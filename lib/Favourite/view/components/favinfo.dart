import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:untitled/Product/model/productModel.dart';
import 'package:untitled/Favourite/controller/favouritecontroller.dart';

import '/../../../Product/model/productModel.dart';
import '/../../../SharedWidget/ratewidget.dart';
import '/../../../constant.dart';

class FavInfo extends StatelessWidget {
  final IconData mainIcon;
  final FavouriteController favouriteController;
  FavInfo({
    required this.mainIcon,
    required this.product,
    required this.favouriteController,
  });
  final ProductModel product;

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
            Obx(
              () => GestureDetector(
                onTap: () {
                  favouriteController.deleteFavourite(product);
                },
                child: Icon(
                  favouriteController.FavProduct.contains(product)
                      ? Icons.favorite
                      : Icons.favorite_border_outlined,
                  color: favouriteController.FavProduct.contains(product)
                      ? kPinkColors
                      : Colors.black,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: height * 0.01,
        ),
        Text(
          product.proType,
          style: klableTextStyle,
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
              style: kTextBoldTitle16.copyWith(fontSize: 12),
            ),
          ],
        )
      ],
    );
  }
}
