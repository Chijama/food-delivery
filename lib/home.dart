import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/utils/strings.dart';
import 'package:food_delivery/utils/theme.dart';
import 'package:food_delivery/utils/widgets.dart';

class HomeWidget extends StatefulWidget {
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  static List<List> foodImgxNames = <List>[
    [Strings.imgCartoonBurger, Strings.burger],
    [Strings.imgCartoonPizza, Strings.pizza],
    [Strings.imgCartoonRice, Strings.rice],
    [Strings.imgCartoonDrink, Strings.drinks],
    [Strings.imgCartoonMeat, Strings.meat],
    [Strings.imgCartoonNoodles, Strings.noodles]
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Themes().backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
                  child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.notification_important),
                    ),
                    const SizedBox(width: 15),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.shopping_cart),
                    )
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    // Search bar
                    TextBoxWidget(
                      label: '',
                      color: Themes().whiteColor,
                      hintText: Strings.search,
                      prefixIcon: Icon(Icons.search_outlined),
                    ),
                    SizedBox(height: 10),

                    // Special offer text row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          Strings.specialOffers,
                          style: TextStyles()
                              .blackTextStyle600()
                              .copyWith(fontSize: 20),
                        ),
                        TextButton(
                          child: Text(Strings.seeAll,
                              style: TextStyles().orangeTextStyle500()),
                          onPressed: () {},
                        )
                      ],
                    ),
                    SizedBox(height: 10),
                    
                    // Special offer widget
                    Container(
                      padding: const EdgeInsets.all(10.0),
                      height: 200,
                      width: double.infinity,
                      // color: Color.fromARGB(255, 13, 196, 121),
                      child: Image.asset(Strings.imgSpecialOffer, fit: BoxFit.fill,)
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     Container(
                      //       height: double.infinity,
                      //       width: 200,
                      //       child: Column(
                      //         children: [
                      //           Text(
                      //             '30%',
                      //             style: TextStyles()
                      //                 .whiteTextStyle700()
                      //                 .copyWith(fontSize: 40),
                      //           ),
                      //           Text(
                      //             'Discount Only For You Today',
                      //             overflow: TextOverflow.fade,
                      //             style: TextStyles().whiteTextStyle700(),
                      //           )
                      //         ],
                      //       ),
                      //     ),
                      //     Container(
                      //       height: 150,
                            
                      //       decoration: BoxDecoration(
                      //           borderRadius:
                      //               BorderRadius.all(Radius.circular(8))),
                      //       child: Image.asset(Strings.burger, fit: BoxFit.fill),
                      //     )
                      //   ],
                      // ),
                    ),
                    SizedBox(
                      height: 15,
                    ),

                    // Popular food text row
   Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                         Strings.popular,
                          style: TextStyles()
                              .blackTextStyle600()
                              .copyWith(fontSize: 18),
                        ),
                        TextButton(
                          child: Text(Strings.seeAll,
                              style: TextStyles().orangeTextStyle500()),
                          onPressed: () {},
                        )
                      ],
                    ),

                    // Popular food widget

                    Container(
                      
                      height: 150,
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: foodImgxNames.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Container(
                                  height: 100,
                                  width: 100,
                                  child: Image.asset(foodImgxNames[index][0])),
                              SizedBox(height: 10),
                              Text(
                                foodImgxNames[index][1],
                                style: TextStyles()
                                    .blackTextStyle400()
                                    .copyWith(fontWeight: FontWeight.w500),
                              )
                            ],
                          );
                        },
                      ),

                    ),

                    // Your favourites text row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          Strings.fav,
                          style: TextStyles()
                              .blackTextStyle600()
                              .copyWith(fontSize: 18),
                        ),
                        TextButton(
                          child: Text(Strings.seeAll,
                              style: TextStyles().orangeTextStyle500()),
                          onPressed: () {},
                        ),
                       
                      ],
                    ),
                    SizedBox(height: 20),

                    // Your favourites widget

                 
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
