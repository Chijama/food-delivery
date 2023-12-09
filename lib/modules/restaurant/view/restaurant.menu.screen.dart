import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jammybread/utilities/strings.dart';
import 'package:jammybread/utilities/theme.dart';

class RestaurantMenu extends StatefulWidget {
  static const String routeName = '/restaurant-menu';

  const RestaurantMenu({super.key});

  @override
  State<RestaurantMenu> createState() => _RestaurantMenuState();
}

class _RestaurantMenuState extends State<RestaurantMenu>
    with SingleTickerProviderStateMixin {
  Widget get topSection => Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(children: [
              CircleAvatar(
                radius: 25,
                backgroundColor: Colors.red,
                child: SvgPicture.asset(
                  Strings.mcDonaldLogo,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(
                width: 13,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "McDonald's",
                    style: TextStyles().blackWeight400size24(),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        color: AppColors().dark100,
                        size: 13,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text('Bramlea & Sandalwood',
                          style: TextStyles().blackWeight400size14())
                    ],
                  )
                ],
              )
            ]),
            CircleAvatar(
              radius: 25,
              backgroundColor: AppColors().light80,
              child: Icon(
                Icons.favorite_rounded,
                color: AppColors().dark60,
                size: 22,
              ),
            )
          ],
        ),
      );
  Widget get tabBar => Container(
        height: kToolbarHeight - 3,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: TabBar(
          controller: _tabController,
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorWeight: 3,
          indicatorColor: AppColors().dark100,
          labelStyle: TextStyles().greyWeight400size17(),
          labelColor: AppColors().dark100,
          unselectedLabelColor: AppColors().dark60,
          tabs: const [
            Tab(text: 'Breakfast'),
            Tab(text: 'Lunch'),
            Tab(text: 'Dinner'),
          ],
        ),
      );
  Widget get tabBarView => Expanded(
        child: TabBarView(
          controller: _tabController,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  SizedBox(
                    height: 38,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: const [
                        Filters(
                          text: 'Burger meals',
                        ),
                        Filters(
                          text: "Today's Deals",
                        ),
                        Filters(
                          text: 'Pizza',
                        ),
                        Filters(
                          text: 'Jam Bread',
                        ),
                        Filters(
                          text: 'Burger meals',
                        ),
                        Filters(
                          text: 'Burger meals',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Expanded(
                    child: ListView.separated(
                      itemCount: 20,
                      separatorBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 21),
                          child:
                              Divider(thickness: 1, color: AppColors().light80),
                        );
                      },
                      itemBuilder: (context, index) {
                        return Container(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, bottom: 15),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 100,
                                child: Image.asset(
                                    Strings.classicCheeseburgerImage),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Classic Cheese Burger (400 Cals)',
                                        style:
                                            TextStyles().blackWeight400size17(),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text('\$5.84 ',
                                              style: TextStyles()
                                                  .blackWeight400size16()
                                                  .copyWith(
                                                    decoration: TextDecoration
                                                        .lineThrough,
                                                  )),
                                          Text(
                                            '\$4.59',
                                            style: TextStyles()
                                                .blueWeight600size16(),
                                          ),
                                        ],
                                      )
                                    ]),
                              ),
                              const SizedBox(width: 10),
                              IconButton(
                                icon: const Icon(Icons.arrow_forward_ios),
                                iconSize: 24,
                                onPressed: () {},
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 50,
              width: 50,
              color: Colors.blue,
            ),
            Container(
              height: 50,
              width: 50,
              color: Colors.red,
            )
          ],
        ),
      );
  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  late TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: SvgPicture.asset(Strings.moreSquareIcon),
            iconSize: 36,
            onPressed: () {},
          ),
          IconButton(
            icon: SvgPicture.asset(Strings.searchBlackIcon),
            iconSize: 36,
            onPressed: () {},
          ),
          IconButton(
            icon: SvgPicture.asset(Strings.shoppingBagIcon),
            iconSize: 36,
            onPressed: () {},
          ),
        ],
        leading: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back_rounded),
              iconSize: 24,
              color: AppColors().dark100,
              onPressed: () {},
            ),
            // SizedBox(width: 5,),
            Text(
              'Back',
              style: TextStyles().blackWeight500size14(),
            ),
          ],
        ),
        leadingWidth: 100,
      ),
      body: SafeArea(
        child: Column(
          children: [topSection, tabBar, tabBarView],
        ),
      ),
    );
  }
}

class Filters extends StatefulWidget {
  final String text;
  const Filters({super.key, required this.text});
  @override
  State<Filters> createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  bool state = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          state = !state;
        });
        if (kDebugMode) {
          print('${widget.text}: $state');
        }
      },
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        height: 35,
        padding: const EdgeInsets.symmetric(horizontal: 14),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(25)),
            color: state ? AppColors().dark90 : AppColors().light80),
        child: Text(
          widget.text,
          style: state
              ? TextStyles().whiteWeight500size14()
              : TextStyles().blackWeight500size14(),
        ),
      ),
    );
  }
}
