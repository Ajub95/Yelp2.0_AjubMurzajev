import 'package:flutter/material.dart';
import 'package:yelp2/providers/restaurant_provider.dart';
import 'package:yelp2/restaurant_card.dart';

import 'add_resturant_screen.dart';
import 'screen.dart';

// ignore: non_constant_identifier_names
class RegionRestaurantsScreenArgs {
  final String region;

  const RegionRestaurantsScreenArgs({required this.region});
}

class RegionRestaurantsScreen extends StatefulWidget {
  final RegionRestaurantsScreenArgs args;
  const RegionRestaurantsScreen(this.args, {Key? key}) : super(key: key);

  @override
  State<RegionRestaurantsScreen> createState() =>
      _RegionRestaurantsScreenState();
}

class _RegionRestaurantsScreenState extends State<RegionRestaurantsScreen> {
  List<Restaurant> restaurants = [];

  @override
  void initState() {
    super.initState();
    RestaurantProvider()
        .load()
        .then((value) => setState(() => restaurants = value));
  }

  @override
  Widget build(BuildContext context) {
    return Screen(
      onFabPressed: _addRestaurant,
      child: Column(
        children: [
          Text(widget.args.region),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children:
                restaurants.map((Restaurant r) => RestaurantCard(r)).toList(),
          ),
        ],
      ),
    );
  }

  void _addRestaurant() async {
    await Navigator.pushNamed(context, '/add_restaurant',
        arguments: AddRestaurantScreenArgs(widget.args.region));
    setState(() {
      restaurants = RestaurantProvider().get();
    });
  }
}
