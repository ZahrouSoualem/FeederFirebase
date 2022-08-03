import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:untitled/Favourite/controller/favouritecontroller.dart';
import 'package:untitled/Home/controller/homecontroller.dart';
import '../../constant.dart';
import '../controller/database.dart';
import 'components/catitemcard.dart';
import 'components/protitemcard.dart';
import 'components/scaffoledcomponents/header.dart';
import 'components/scaffoledcomponents/menu.dart';
import 'package:http/http.dart' as http;


class HomeScreen extends StatefulWidget {
  static final pageName = "/home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final homeControoler = Get.put(HomeController());
  //final facControoler = Get.put(FavouriteController());
  final facControoler = Get.find<FavouriteController>();
  final database = Get.put(Database());
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();


  Widget build(BuildContext context)  {

    /*----- I used this part here to verify the result of the requests from the Firestore -----*/


    // the name of categories recieved from the firestore
    // for(int i=0;i<database.listCategory.length;i++){
    //   print(database.listCategory[i]!.categoryName);
    // }

    // the length of the list of product recieved from the firestore
    // print('the length is : ${database.listProduct.length}');

    //the fisrt category in the list
    // print("the first category name is : ${database.categoryName.value}");

    //the list of product of a specific category
    // for(int i=0;i<database.listProduct.length;i++){
    //   print(database.listProduct[i]!.proName);
    // }

    // print('this if from fav controller : ${facControoler.FavProduct.length}');
    /*-------------------------------------------------------------------------------------------*/
    // x() async{
    //   var url = Uri.parse('https://fast-api-backend-app-v1.herokuapp.com/categories?skip=0&limit=100');
    //   var response = await http.get(url);
    //   print('Response status: ${response.statusCode}');
    //   print('Response body: ${response.body}');
    //
    //   //print(await http.read(Uri.parse('https://example.com/foobar.txt')));
    // }
    // x();

    return Scaffold(
      drawer: Drawer(
        backgroundColor: kScaffoldColor,
        child: Column(
          children:  [
            Header(),
            Menu(),
          ],
        ),
      ),
      key: _scaffoldKey,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    _scaffoldKey.currentState!.openDrawer();
                    //Scaffold.of(context).openDrawer();
                    print('object');
                  },
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(13),
                      image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/images/image_1.jpg")),
                    ),
                  ),
                ),
                Column(
                  children: [
                    Row(
                      children: const [
                        Text(
                          "Location",
                          style: TextStyle(
                            color: kLabeleColor,
                          ),
                        ),
                        Icon(
                          Icons.keyboard_arrow_down_outlined,
                          color: Colors.pinkAccent,
                        ),
                      ],
                    ),
                    Row(
                      children: const [
                        Text(
                          "Sétif,",
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Algeria",
                        )
                      ],
                    )
                  ],
                ),
                Container(
                  width: 50,
                  height: 50,
                  child: const Icon(
                    Icons.search,
                    size: 30,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(13),
                  ),
                ),
              ],
            ),
                Column(
                  children: [

                    const SizedBox(height: 20),
                    Container(
                      height: 160,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichText(
                                  text: const TextSpan(
                                      text: "Free Home\n",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: "Delivery\t",
                                          style: TextStyle(
                                            color: Color(0xFFEE3543),
                                          ),
                                        ),
                                        TextSpan(
                                          text: 'Service',
                                        ),
                                      ]),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                RaisedButton(
                                  onPressed: () {},
                                  child: const Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Text(
                                      "Order Now",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  color: kPinkColors,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                                //RichText(text: text),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Container(
                                decoration: const BoxDecoration(
                                  //color: Colors.white,
                                  image: DecorationImage(
                                      fit: BoxFit.fitHeight,
                                      image: AssetImage("assets/images/image_2.png")),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color(0xFFFCCA94),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 120,
                      child: Obx(
                          ()=> ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: database.listCategory.length,
                          itemBuilder: (context, index) {
                            return CategoryItemCard(
                              catImage: database.listCategory[index]!.categoryImage,
                              catName: database.listCategory[index]!.categoryName,
                              index: index,
                            );
                          },
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          //children: ,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: MediaQuery.of(context).size.height/2.94,
                      child: Obx(
                        () => ListView.builder(
                          physics: BouncingScrollPhysics(),
                          itemCount:
                          database.listProduct.length,
                          itemBuilder: (context, index) {

                            return ProductItemCard(
                              index: index,
                                product: database.listProduct[index]!,
                            );
                          },
                          scrollDirection: Axis.horizontal,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
