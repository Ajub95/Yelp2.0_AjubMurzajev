import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Screen extends StatelessWidget {
  final void Function()? onFabPressed;
  final Widget? child;
  const Screen({Key? key, this.onFabPressed, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Yelp 2.0'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: onFabPressed == null
          ? const Offstage()
          : IconButton(
              icon: const Icon(Icons.add_outlined),
              onPressed: onFabPressed,
            ),
      body: Center(
        child: child,
      ),
    );
  }
}
