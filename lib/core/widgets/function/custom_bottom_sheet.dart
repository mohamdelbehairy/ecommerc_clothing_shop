import 'package:flutter/material.dart';

Future<dynamic> customBottomSheet(BuildContext context,
    {required Widget child}) {
  return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(16), topLeft: Radius.circular(16))),
      builder: (context) => child);
}
