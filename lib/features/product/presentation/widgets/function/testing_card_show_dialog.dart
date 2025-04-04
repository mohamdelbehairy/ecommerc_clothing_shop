import 'package:flutter/material.dart';

import '../../../../app/presentation/manager/build_app/build_app_cubit.dart';
import '../testing_card_alert_dialog.dart';

void testingCardShowDialog(BuildContext context, BuildAppCubit buildApp) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return TestingCardAlertDialog(buildApp: buildApp);
    },
  );
}
