import 'package:e_clot_shop/core/utils/secret_key.dart';
import 'package:url_launcher/url_launcher.dart';

import 'launch_url_repo.dart';

class LaunchUrlRepoImpl extends LaunchUrlRepo {
  @override
  Future<void> launchEmail() async {
    if (!await launchUrl(Uri.parse(SecretKey.launchEmail))) {
      throw 'Could not launch ${SecretKey.launchEmail}';
    }
  }

  @override
  Future<void> launchSms() async {
    if (!await launchUrl(Uri.parse(SecretKey.launchNumber))) {
      throw 'Could not launch ${SecretKey.launchNumber}';
    }
  }

  @override
  Future<void> launchWhatsApp() async {
    if (!await launchUrl(Uri.parse(SecretKey.launchWhatsApp))) {
      throw 'Could not launch ${SecretKey.launchWhatsApp}';
    }
  }
}
