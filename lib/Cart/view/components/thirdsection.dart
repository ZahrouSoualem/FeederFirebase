import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/Cart/controller/cartcontroller.dart';

import '../../../constant.dart';

class ThirdSection extends StatelessWidget {
  final OrderController orderController;

  ThirdSection({
    required this.orderController,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Flexible(
      flex: 2,
      child: Padding(
        padding: EdgeInsets.all(height * 0.02),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              flex: 1,
              child: SizedBox(
                width: width,
                height: height,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('Place Order'),
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Flexible(
                    flex: 1,
                    child: Text(
                      'Total: ',
                      style: ktextBold.copyWith(fontSize: 14),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Obx(
                      ()=> Text(
                        '\$ ${orderController.total()}',
                          maxLines: 1,
                          style: ktextBold.copyWith(fontSize: 17),
                        ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
