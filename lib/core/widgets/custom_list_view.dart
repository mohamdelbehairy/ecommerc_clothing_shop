import 'package:flutter/material.dart';

class CustomListView extends StatelessWidget {
  const CustomListView(
      {super.key, required this.itemCount, required this.itemBuilder});
  final int itemCount;
  final Widget? Function(BuildContext, int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 281,
      child: ListView.builder(
          itemCount: itemCount,
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemBuilder: itemBuilder),
    );
  }
}
