import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jammybread/utilities/strings.dart';
import 'package:jammybread/utilities/textstyles.dart';
import 'package:jammybread/common_widgets/category.item.dart';
import 'package:jammybread/common_widgets/search.dart';
import 'package:jammybread/utilities/colors.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home-screen';
  const HomeScreen({super.key});

  // Top Section
  Widget get topSection => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  height: 38,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                    color: peach60.withOpacity(0.5),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        color: peach100,
                      ),
                      Text('34,Lekki Way',
                          style: peachWeight400size15(),
                          overflow: TextOverflow.ellipsis),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                Container(
                  height: 38,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                    color: peach60.withOpacity(0.5),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.access_time_outlined,
                        color: peach100,
                        size: 20,
                      ),
                      Text(' Order Now',
                          style: peachWeight400size15(),
                          overflow: TextOverflow.ellipsis),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 21,
            ),
            Text(
              '${getGreeting()} Joel',
              style: blackWeight400size33(),
            ),
            const SizedBox(
              height: 12,
            ),
            const Search(
              hintText: 'Search Food, Restaurants etc.',
            )
          ],
        ),
      );

  Widget get categoriesSection => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Categories',
              style: blackWeight500size21(),
            ),
            const SizedBox(
              height: 14,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  children: [
                    CategoryItem(
                      image: Strings.burgerImage,
                      label: 'Burgers',
                    ),
                    SizedBox(height: 16),
                    CategoryItem(
                      image: Strings.sweetsImage,
                      label: 'Sweets',
                    ),
                  ],
                ),
                const Column(
                  children: [
                    CategoryItem(
                      image: Strings.groceryImage,
                      label: 'Grocery',
                    ),
                    SizedBox(height: 16),
                    CategoryItem(
                      image: Strings.utensilsImage,
                      label: 'Utensils',
                    ),
                  ],
                ),
                Column(
                  children: [
                    const CategoryItem(
                      image: Strings.saladImage,
                      label: 'Salad',
                    ),
                    const SizedBox(height: 16),
                    Container(
                      alignment: Alignment.center,
                      height: 102,
                      width: 102,
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(width: 2, color: blue100),
                          borderRadius: BorderRadius.circular(100)),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.arrow_forward_rounded,
                            size: 24,
                            color: blue100,
                          ),
                          Text(
                            'See All',
                            style: blueWeight500size18(),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      );

  Widget get offersNearYou => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'Offers Near You',
            style: blackWeight500size21(),
          ),
          const SizedBox(
            height: 14,
          ),
          SizedBox(
            height: 181,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 6,
              itemBuilder: (context, index) {
                return Container(
                    margin: const EdgeInsets.only(right: 18),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    height: 180,
                    width: 315,
                    child: Image.asset(Strings.offersImage));
              },
            ),
          )
        ]),
      );

  Widget get newTrending => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'New & Trending',
            style: blackWeight500size21(),
          ),
          const SizedBox(
            height: 14,
          ),
          SizedBox(
            height: 165,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 6,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                        margin: const EdgeInsets.only(right: 18),
                        decoration: const BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        height: 113,
                        width: 202,
                        child: Image.asset(
                          Strings.kfcImage,
                          fit: BoxFit.cover,
                        )),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SvgPicture.asset(
                          Strings.kfcLogo,
                          height: 36,
                          width: 36,
                        ),
                        const SizedBox(
                          width: 13,
                        ),
                        Column(
                          children: [
                            Text(
                              'KFC',
                              style: blackWeight500size17(),
                            ),
                            Text(
                              '2.1 mi',
                              style: greyWeight400size13(),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                );
              },
            ),
          )
        ]),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              topSection,
              const SizedBox(
                height: 22,
              ),
              categoriesSection,
              const SizedBox(
                height: 21,
              ),
              const Divider(
                color: light60,
                thickness: 1,
              ),
              const SizedBox(
                height: 18,
              ),
              offersNearYou,
              const SizedBox(
                height: 21,
              ),
              const Divider(
                color: light60,
                thickness: 1,
              ),
              const SizedBox(
                height: 18,
              ),
              newTrending
            ],
          ),
        ),
      ),
    );
  }

  String getGreeting() {
    var now = DateTime.now();
    var hour = now.hour;

    if (hour < 12) {
      return 'Good morning';
    } else if (hour < 18) {
      return 'Good afternoon';
    } else {
      return 'Good evening';
    }
  }
}
