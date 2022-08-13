import 'package:flutter/material.dart';
import 'package:yelp2/region_restaurants_screen.dart';

import 'own_card.dart';

class RegionsCard extends StatelessWidget {
  final String region;
  // RegionsCard(String region) {
  //   this.region = region;
  // }
  const RegionsCard(this.region, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OwnCard(
      child: Center(child: Text(region)),
      onTap: () => Navigator.pushNamed(context, '/region_restaurants',
          arguments: RegionRestaurantsScreenArgs(region: region)),
    );
  }
}
