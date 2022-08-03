import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:untitled/Favourite/controller/favouritecontroller.dart';
import 'package:untitled/constant.dart';

import '/../SharedWidget/reuseableinfocontainer.dart';
import 'components/favinfo.dart';

class FavScreen extends StatelessWidget {
  FavScreen({Key? key}) : super(key: key);
  static const String pageName = '/Fav';
  final favouriteController = Get.put(FavouriteController());
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: kPinkColors,
        title: const Center(
          child: Text('Favoutite Food'),
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
                      'Your Favourite',
                      style: ktextBold,
                    ),
                  )),
            ),
            Flexible(
              flex: 15,
              child: Obx(
                () => ListView.builder(
                    itemCount: favouriteController.FavProduct.length /*favouriteController.favourites.length*/,
                    itemBuilder: (context, index) {
                      return ReUseableInfoContainer(
                        favProduct: favouriteController.FavProduct[index]! /*favouriteController.favourites[index]*/,
                        infoWidget: FavInfo(
                            mainIcon: Icons.favorite_border_outlined,
                            product: favouriteController.FavProduct[index]! /*favouriteController.favourites[index]*/,
                            favouriteController: favouriteController),
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
