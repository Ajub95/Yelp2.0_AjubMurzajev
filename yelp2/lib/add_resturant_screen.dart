import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'buttons.dart';
import 'input_field.dart';
import 'screen.dart';

class AddRestaurantScreenArgs {
  final String region;

  const AddRestaurantScreenArgs(this.region);
}

class AddRestaurantScreen extends StatelessWidget {
  final AddRestaurantScreenArgs args;
  final TextEditingController nameController = TextEditingController();
  AddRestaurantScreen(this.args, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Screen(
      child: Column(
        children: [
          InputField(
            label: 'Name',
            controller: nameController,
            hintText: 'eg.: muto Restaurant',
          ),
          Button.primary(text: 'Create Restaurant')
        ],
      ),
    );
  }
}
