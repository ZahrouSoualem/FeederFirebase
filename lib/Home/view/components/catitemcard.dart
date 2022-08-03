import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:untitled/constant.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled/Home/controller/homecontroller.dart';

import '../../controller/database.dart';

class CategoryItemCard extends StatelessWidget {
  final String catImage;
  final String catName;
  //final bool isSelected;
  final int index;

  //final Function()? onTap;
  //final Color backGoundColor;

  CategoryItemCard(
      {required this.catImage,
      required this.catName,
      required this.index});

  final homeControler = Get.find<HomeController>();
  final database = Get.find<Database>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => GestureDetector(
        onTap: () {
          homeControler.slectedIndex.value = index;
          database.categoryName.value = catName;

          database.productList.bindStream(database.streamOfCategoryProduct);
          print(database.categoryName.value);
          print(database.listProduct.length);
        },
        child: Container(
            margin: EdgeInsets.only(right: 10),
            width: MediaQuery.of(context).size.width / 4.5,
            decoration: BoxDecoration(
              color: index == homeControler.slectedIndex.value
                  ? kPinkColors
                  : kLightPinkColors,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(7),
                  child: SvgPicture.network(
                    '$catImage',
                    height: 35,
                    width: 35,
                    fit: BoxFit.scaleDown,
                    alignment: Alignment.center,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                // child:  Image.asset("images/hamburger.png"),
                const SizedBox(height: 10),
                Text(catName),
              ],
            ),
          ),

      ),
    );
  }
}
