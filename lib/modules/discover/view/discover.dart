import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jammybread/utilities/strings.dart';
import 'package:jammybread/utilities/theme.dart';

class Discover extends StatelessWidget {
  const Discover({super.key});

  Widget get appBar => Container(
    height: 135,
    decoration: BoxDecoration(
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
              style: TextStyles().blackWeight400size34(),
            ),
            Row(
              children: [
                IconButton(
                  icon: SvgPicture.asset(Strings.searchBlackIcon),
                  iconSize: 36,
                  onPressed: () {},
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
                    decoration: BoxDecoration(
                        color: AppColors().light100,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(18))),
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
                                    style: TextStyles().blackWeight400size17(),
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.location_on_outlined,
                                        color: AppColors().dark60,
                                        size: 13,
                                      ),
                                      const SizedBox(
                                        width: 4,
                                      ),
                                      Text('Bramlea & Sandalwood',
                                          style: TextStyles()
                                              .greyWeight500size12())
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
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 13),
                          child: Divider(
                            color: AppColors().light80,
                          ),
                        ),
                        SizedBox(
                          height: 22,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset(Strings.routeSqureIcon,height: 16,width: 15,),
                                  const SizedBox(width: 10,),
                                  Text('200m',style: TextStyles().darkWeight500size12(),),
                                  Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 13),
                            child: VerticalDivider(
                              
                               thickness: 1,
                              color: AppColors().light80,
                            ),
                          ),
                          Rating()
                                ],
                              ),
                              TextButton(
                                child: Text(
                                  'OPEN',
                                  style: TextStyles().greenWeight500size14(),
                                ),
                                onPressed: () {},
                              )
                            ],
                          ),
                        ),
                        Expanded(child: SizedBox()),
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                          discoverImage(Strings.burgerImage),
                          discoverImage(Strings.mcdonaldBurger2Image),
                          discoverImage(Strings.mcdonaldBurger1Image),
                          discoverImage(Strings.friesImage),



                        ],)
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
          Image.asset(
            Strings.discoverMapImage,
            fit: BoxFit.fill,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [appBar, discoverRestaurant],
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
                          decoration: BoxDecoration(color: AppColors().light80,
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
        Icon(Icons.star_rounded,size: 14,color: AppColors().peach100,),
        Icon(Icons.star_rounded,size: 14,color: AppColors().peach100,),
        Icon(Icons.star_rounded,size: 14,color: AppColors().peach100,),
        Icon(Icons.star_rounded,size: 14,color: AppColors().peach100,),
        Icon(Icons.star_rounded,size: 14,color: AppColors().light60,),

        SizedBox(width: 6,),
        Text('(1,293)', style: TextStyles().greyWeight500size12(),)
      ],
    );
  }
}
