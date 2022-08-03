import 'package:flutter/material.dart';
import 'package:untitled/Cart/view/components/quantitybutton.dart';

import '../../../constant.dart';




class CartItem extends StatelessWidget {
  const CartItem({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height * 0.14,
      margin: EdgeInsets.only(bottom: height*0.02,left: height*0.02,right: height*0.02 ),
      decoration: BoxDecoration(
        color: kLightPinkColors,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            spreadRadius: 0,
            offset: Offset(0, 1),
            blurRadius: 5,
          )
        ],
      ),
      child: Row(
        children: [
          Container(
            width: height * 0.14,
            height: height * 0.14,
            decoration: const BoxDecoration(
              color: Colors.blueGrey,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                bottomLeft: Radius.circular(15),
              ),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/pizza/pizza3.png"),
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Zahreddine Soualem",
                          style: kTextBoldTitle16,
                        ),
                        InkWell(
                          onTap: (){},
                          child: const Icon(Icons.highlight_remove_rounded,color: kPinkColors,),
                        )

                      ]
                  ),
                  const Text(
                    "\$ 19.19",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 13),
                  ),
                  Container(
                    width: width * 0.3,
                    height: (width * 0.3) / 2.5,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: kLightPinkColors,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        QuantityButton(
                          icon: Icons.add,
                          function: () {},
                          border: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                          ),
                        ),
                        Expanded(
                          child:   Center(
                            child:  Text(
                              '1',
                              textAlign: TextAlign.center,
                              maxLines: 1,
                              style: kTextBoldTitle16.copyWith(color: kPinkColors),
                            ),
                          ),
                        ),
                        QuantityButton(
                          icon: Icons.remove,
                          function: () {},
                          border: const BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}


