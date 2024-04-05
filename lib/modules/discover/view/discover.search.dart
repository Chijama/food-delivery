import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jammybread/utilities/colors.dart';
import 'package:jammybread/utilities/strings.dart';
import 'package:jammybread/utilities/theme.dart';
import 'package:jammybread/common_widgets/app.bar.dart';
import 'package:jammybread/common_widgets/search.dart';

class DiscoverSearch extends StatelessWidget {
  static const String routeName = '/discover-search';

  const DiscoverSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Discover',
                      style: blackWeight400size34(),
                    ),
                    Container(
                      height: 38,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 10),
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12)),
                        color: pink60.withOpacity(0.4),
                      ),
                      child: Row(
                        children: [
                          SvgPicture.asset(Strings.filterIcon),
                          Text('Filter',
                              style: pinkWeight500size16(),
                              overflow: TextOverflow.ellipsis),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 14,
                ),
                const Search(
                  hintText: 'Search Food, Restaurants etc.',
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Recommended',
                  style: blackWeight500size21(),
                ),
                const SizedBox(
                  height: 33,
                ),
                SizedBox(
                  height: double.infinity,
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return;
                    },
                  ),
                )
              ],
            ),
          )
        ],
      )),
    );
  }
}
