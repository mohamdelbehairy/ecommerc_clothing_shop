import 'package:flutter/material.dart';

import '../widgets/myfavourite_view_body.dart';

class MyFavouriteView extends StatelessWidget {
  const MyFavouriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: MyFavouriteViewBody(),
    );
  }
}
