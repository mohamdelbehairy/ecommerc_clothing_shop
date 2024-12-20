import 'package:e_clot_shop/core/utils/format_date.dart';
import 'package:e_clot_shop/core/utils/styles.dart';
import 'package:e_clot_shop/features/user_data/data/models/user_data_model.dart';
import 'package:flutter/material.dart';

class SettingUserInfoWidget extends StatelessWidget {
  const SettingUserInfoWidget({super.key, required this.userData});
  final UserDataModel userData;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 13),
        Text(userData.userName, style: Styles.styleBold16(context)),
        const SizedBox(height: 6),
        Text(userData.email!, style: Styles.styleMedium16WithOpacity(context)),
        const SizedBox(height: 6),
        Text(formatDate(userData.dateTime),
            style: Styles.styleMedium16WithOpacity(context)),
        const SizedBox(height: 13),
      ],
    );
  }
}
