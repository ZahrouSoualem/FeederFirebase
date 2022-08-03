import 'package:flutter/material.dart';
import 'package:untitled/Product/model/productModel.dart';

import '../Product/model/productModel.dart';
import '../constant.dart';


class ReUseableInfoContainer extends StatelessWidget {
   ReUseableInfoContainer({
    required this.infoWidget, required this.favProduct,
  });

  final Widget infoWidget;
  final ProductModel favProduct;



  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Container(
      margin: EdgeInsets.symmetric(horizontal:width * 0.03),
      //padding: EdgeInsets.all(height * 0.02),
      child: Column(
        children: [
          Material(
            //color:kLightPinkColors,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  flex: 3,
                  // here a container used to hold the picture
                  child: Container(
                    // this padding used to make the picture away from the edge of the container
                    padding: EdgeInsets.all(5),
                    height: width*0.3 ,
                    width: width*0.3 ,
                    //this margin to shape the container of the picture
                    margin: EdgeInsets.all(width*0.02),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: kScaffoldColor,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          offset: Offset(1, 1),
                          spreadRadius: 0,
                          blurRadius: 5,
                          //blurStyle: BlurStyle.outer,
                        ),
                      ],
                    ),
                    child: Image.network(
                        favProduct.proImage),
                  ),
                ),
                SizedBox(
                  width: width * 0.03,
                ),
                Flexible(
                  flex: 6,
                  child: Padding(
                    padding:  EdgeInsets.only(top: width*0.01),
                    child: infoWidget,
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            thickness: 1,
          ),
        ],
      ),
    );
  }
}
