import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jammybread/modules/discover/view/discover.search.dart';
import 'package:jammybread/utilities/strings.dart';
import 'package:jammybread/utilities/theme.dart';
import 'package:jammybread/utilities/colors.dart';

class Discover extends StatelessWidget {
  const Discover({super.key});

  Widget appBar(BuildContext context) {
    return Container(
      height: 135,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.white, Colors.white12],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Discover',
            style: blackWeight400size34(),
          ),
          Row(
            children: [
              IconButton(
                icon: SvgPicture.asset(Strings.searchBlackIcon),
                iconSize: 36,
                onPressed: () {
                  Navigator.pushNamed(context, DiscoverSearch.routeName);
                },
              ),
              const SizedBox(width: 15),
              IconButton(
                icon: SvgPicture.asset(Strings.shoppingBagIcon),
                iconSize: 36,
                onPressed: () {},
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget get discoverRestaurant => Column(
        children: [
          SizedBox(
              height: 210,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    height: 210,
                    width: 330,
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    padding: const EdgeInsets.all(12),
                    decoration: const BoxDecoration(
                        color: light100,
                        borderRadius:
                            BorderRadius.all(Radius.circular(18))),
                    child: Column(
                      children: [
                        Row(
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
                                    style: blackWeight400size17(),
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.location_on_outlined,
                                        color: dark60,
                                        size: 13,
                                      ),
                                      const SizedBox(
                                        width: 4,
                                      ),
                                      Text('Bramlea & Sandalwood',
                                          style: greyWeight500size12())
                                    ],
                                  )
                                ],
                              )
                            ]),
                            const CircleAvatar(
                              radius: 25,
                              backgroundColor: light80,
                              child: Icon(
                                Icons.favorite_rounded,
                                color: dark60,
                                size: 22,
                              ),
                            )
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 13),
                          child: Divider(
                            color: light80,
                          ),
                        ),
                        SizedBox(
                          height: 22,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    Strings.routeSquareIcon,
                                    height: 16,
                                    width: 15,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    '200m',
                                    style: darkWeight500size12(),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 13),
                                    child: VerticalDivider(
                                      thickness: 1,
                                      color: light80,
                                    ),
                                  ),
                                  const Rating()
                                ],
                              ),
                              TextButton(
                                child: Text(
                                  'OPEN',
                                  style: greenWeight500size14(),
                                ),
                                onPressed: () {},
                              )
                            ],
                          ),
                        ),
                        const Expanded(child: SizedBox()),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            discoverImage(Strings.burgerImage),
                            discoverImage(Strings.mcdonaldBurger2Image),
                            discoverImage(Strings.mcdonaldBurger1Image),
                            discoverImage(Strings.friesImage),
                          ],
                        )
                      ],
                    ),
                  );
                },
              )),
          const SizedBox(
            height: 12,
          )
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Image.asset(
              Strings.discoverMapImage,
              fit: BoxFit.fill,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [appBar(context), discoverRestaurant],
          ),
        ],
      ),
    );
  }
}

Container discoverImage(String image) {
  return Container(
      height: 67,
      width: 68,
      decoration: const BoxDecoration(
          color: light80,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Image.asset(image));
}

class Rating extends StatelessWidget {
  const Rating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.star_rounded,
          size: 14,
          color: peach100,
        ),
        const Icon(
          Icons.star_rounded,
          size: 14,
          color: peach100,
        ),
        const Icon(
          Icons.star_rounded,
          size: 14,
          color: peach100,
        ),
        const Icon(
          Icons.star_rounded,
          size: 14,
          color: peach100,
        ),
        const Icon(
          Icons.star_rounded,
          size: 14,
          color: light60,
        ),
        const SizedBox(
          width: 6,
        ),
        Text(
          '(1,293)',
          style: greyWeight500size12(),
        )
      ],
    );
  }
}
