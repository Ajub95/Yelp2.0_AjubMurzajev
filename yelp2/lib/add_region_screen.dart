import 'package:flutter/material.dart';
import 'package:yelp2/providers/region_provider.dart';

class AddRegionScreen extends StatelessWidget {
  final TextEditingController regionController = TextEditingController();
  AddRegionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        TextField(
          controller: regionController,
          maxLines: 1,
          decoration: const InputDecoration(hintText: 'Regionname'),
        ),
        InkWell(
          onTap: () {
            final input = regionController.value.text;
            RegionProvider().add(input);
            Navigator.pop(context);
          },
          child: Container(
            color: Colors.green,
            child: const Text('Add Region'),
          ),
        )
      ]),
    );
  }
}
