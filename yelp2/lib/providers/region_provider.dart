import 'package:yelp2/regions_loaders.dart';

class RegionProvider {
  final RegionLoader loader = DatabaseRegionLoader();
  List<String> _regions = [];

  static final RegionProvider _instance = RegionProvider._internal();

  factory RegionProvider() {
    return _instance;
  }

  RegionProvider._internal();

  void add(String region) {
    _regions.add(region);
    loader.save(_regions);
  }

  List<String> get() {
    return _regions;
  }

  Future<List<String>> load() async {
    _regions = (await loader.load()) ?? [];
    return get();
  }
}